import 'package:cached_network_image/cached_network_image.dart';
import 'package:concetto_app/models/guest_talks_model.dart';
import 'package:concetto_app/repository/guest_talks_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../services/configs/size_config.dart';
import '../../../services/theme/custom_colors.dart';
import '../../../widgets/glassmorphic_container.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/slashbox.dart';
import '../events/events.dart';
import 'guest_talks_details.dart';

class GuestTalks extends StatefulWidget {
  const GuestTalks({super.key});

  @override
  State<GuestTalks> createState() => _GuestTalksState();
}

class _GuestTalksState extends State<GuestTalks> {
  @override
  Widget build(BuildContext context) {
    TextStyle headingStyle =
        GoogleFonts.oswald(color: Colors.white, fontSize: 36.0);

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/app_background.jpeg'),
              fit: BoxFit.fill)),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: FutureBuilder(
            future: GuestTalksRepository().getGetTalks(),
            builder: (context, AsyncSnapshot<List<GuestTalksModel>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data != null) {
                  if (snapshot.data!.isNotEmpty) {
                    return SingleChildScrollView(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Center(
                              child: Text(
                                'Guest Talks',
                                style: headingStyle,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 190.0,
                              ),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                if (index % 2 == 0) {
                                  return GuestTalksListBox1(
                                      guestTalksModel: snapshot.data![index]);
                                } else {
                                  return GuestTalksListBox2(
                                      guestTalksModel: snapshot.data![index]);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ));
                  } else {
                    return const Center(
                      child: Text(
                        'No Current Guest Talks',
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
            }),
      ),
    );
  }
}

class GuestTalksListBox1 extends StatelessWidget {
  final GuestTalksModel guestTalksModel;
  const GuestTalksListBox1({required this.guestTalksModel, super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTextStyle = GoogleFonts.quantico(
        color: kBrightCyan, fontSize: 22.0, fontWeight: FontWeight.w600);
    final TextStyle subtitleTextStyle = GoogleFonts.manrope(
        color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w400);
    return GlassMorphicListTile(
      height: 190,
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  GuestTalksDetails(guestTalksModel: guestTalksModel)));
        },
        child: Center(
          child: Row(
            children: [
              SizedBox(
                child: CachedNetworkImage(
                  height: double.infinity,
                  width: SizeConfig.instance.screenWidth * 0.4,
                  fit: BoxFit.fill,
                  imageUrl: guestTalksModel.image,
                  placeholder: (context, url) =>
                      const Center(child: LoadingWidget()),
                  errorWidget: (context, url, error) {
                    try {
                      return const CachedNetworkImageError();
                    } on Exception catch (e) {
                      return const CachedNetworkImageError();
                    }
                  },
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(guestTalksModel.guestName,
                          maxLines: 2,
                          style: titleTextStyle,
                          overflow: TextOverflow.ellipsis),
                      Text(
                        guestTalksModel.summary,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: subtitleTextStyle,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GuestTalksListBox2 extends StatelessWidget {
  final GuestTalksModel guestTalksModel;
  const GuestTalksListBox2({required this.guestTalksModel, super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTextStyle = GoogleFonts.quantico(
        color: kBrightCyan, fontSize: 22.0, fontWeight: FontWeight.w600);
    final TextStyle subtitleTextStyle = GoogleFonts.manrope(
        color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w400);
    return GlassMorphicListTile(
      height: 190,
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  GuestTalksDetails(guestTalksModel: guestTalksModel)));
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        guestTalksModel.guestName,
                        maxLines: 2,
                        style: titleTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(guestTalksModel.summary,
                          style: subtitleTextStyle,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              SizedBox(
                child: CachedNetworkImage(
                  height: double.infinity,
                  width: SizeConfig.instance.screenWidth * 0.4,
                  fit: BoxFit.fill,
                  imageUrl: guestTalksModel.image,
                  placeholder: (context, url) =>
                      const Center(child: LoadingWidget()),
                  errorWidget: (context, url, error) {
                    try {
                      return const CachedNetworkImageError();
                    } on Exception catch (e) {
                      return const CachedNetworkImageError();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
