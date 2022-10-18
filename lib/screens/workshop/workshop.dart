import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:concetto_app/models/workshop_model.dart';
import 'package:concetto_app/repository/workshop_repository.dart';
import 'package:concetto_app/screens/events_guests/events/events.dart';
import 'package:concetto_app/screens/workshop/workshop_details.dart';
import 'package:concetto_app/services/configs/size_config.dart';
import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:concetto_app/widgets/loading.dart';
import 'package:concetto_app/widgets/slashbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkshopList extends StatelessWidget {
  const WorkshopList({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle headingStyle =
        GoogleFonts.oswald(color: Colors.white, fontSize: 36.0);
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/app_background.jpeg'),
              fit: BoxFit.fill)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            body: FutureBuilder(
                future: WorkshopRepository().getWorkshops(),
                builder:
                    (context, AsyncSnapshot<List<WorkShopModel>?> snapshot) {
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
                                    'Workshops',
                                    style: headingStyle,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12.0,
                                ),
                                const SizedBox(
                                  height: 36.0,
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: ((context, index) =>
                                      WorkshopListBox(
                                          workshopModel:
                                              snapshot.data![index])),
                                )
                              ],
                            ),
                          ),
                        ));
                      } else {
                        return const Center(
                          child: Text(
                            'Coming soon....',
                            style: TextStyle(
                                fontFamily: "orbitron",
                                fontSize: 22,
                                color: kBrightCyan),
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
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
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
        ),
      ),
    );
  }
}

class WorkshopListBox extends StatelessWidget {
  final WorkShopModel workshopModel;
  const WorkshopListBox({required this.workshopModel, super.key});

  @override
  Widget build(BuildContext context) {
    // double heightOfScreen = SizeConfig.instance.screenHeight;
    double boxHeight = 400;
    final TextStyle titleTextStyle = GoogleFonts.quantico(
        color: kBrightCyan, fontSize: 24.0, fontWeight: FontWeight.w600);
    final TextStyle summaryTextStyle = GoogleFonts.sourceCodePro(
      color: Colors.white60,
      fontSize: 16.0,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  WorkshopDetails(workshopModel: workshopModel)));
        },
        child: BorderedSlashBox(
          height: boxHeight,
          padding: EdgeInsets.zero,
          width: SizeConfig.instance.screenWidth - 32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: CachedNetworkImage(
                  height: 290,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  imageUrl: workshopModel.image,
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
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      workshopModel.name,
                      style: titleTextStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      workshopModel.summary,
                      style: summaryTextStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
