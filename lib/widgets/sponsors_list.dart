import 'package:cached_network_image/cached_network_image.dart';
import 'package:concetto_app/models/sponsors_model.dart';
import 'package:concetto_app/repository/sponsors_repository.dart';
import 'package:concetto_app/widgets/glassmorphic_container.dart';
import 'package:concetto_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SponsorList extends StatelessWidget {
  final bool isMajorRequired;
  final EdgeInsets? gridPadding;
  const SponsorList(
      {required this.isMajorRequired, this.gridPadding, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SponsorsRepository().getSponsors(isMajorRequired),
        builder: (context, AsyncSnapshot<List<SponsorsModel>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              if (snapshot.data!.isNotEmpty) {
                return Padding(
                  padding: gridPadding ??
                      const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 0.0),
                  child: Expanded(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        mainAxisExtent: 190.0,
                      ),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return SponsorsGridTile(data: snapshot.data![index]);
                      },
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text(
                    'No Data Found',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
            } else {
              return const Center(
                child: Text(
                  'No Data Found',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          } else {
            return const Center(
                child: Text(
              'Some error occured',
              style: TextStyle(color: Colors.white),
            ));
          }
        });
  }
}

class SponsorsGridTile extends StatelessWidget {
  final SponsorsModel data;
  const SponsorsGridTile({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Uri uri = Uri.parse(data.url);
        launchUrl(uri);
      },
      child: GlassMorphicListTile(
        borderColor: Colors.grey,
        child: Column(
          children: [
            CachedNetworkImage(
              height: 150,
              width: double.infinity,
              fit: BoxFit.fill,
              imageUrl: data.logo,
              placeholder: (context, url) =>
                  const Center(child: LoadingWidget()),
              errorWidget: (context, url, error) => const Center(
                child: Icon(
                  Icons.error_outline,
                  size: 76.0,
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                data.name,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.oswald(color: Colors.white, fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
