import 'package:concetto_app/models/events_model.dart';
import 'package:concetto_app/models/winners_model.dart';
import 'package:concetto_app/repository/single_event_repository.dart';
import 'package:concetto_app/repository/winners_repository.dart';
import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:concetto_app/widgets/glassmorphic_container.dart';
import 'package:concetto_app/widgets/key_value_text.dart';
import 'package:concetto_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WinnerList extends StatelessWidget {
  const WinnerList({super.key});

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
            future: WinnersRepository().getWinners(),
            builder: (context, AsyncSnapshot<List<WinnerModel>?> snapshot) {
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
                                'Winners',
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
                                mainAxisExtent: 220.0,
                              ),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return WinnerListTile(
                                    winnerModel: snapshot.data![index]);
                              },
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
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

class WinnerListTile extends StatelessWidget {
  final WinnerModel winnerModel;
  const WinnerListTile({required this.winnerModel, super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTextStyle = GoogleFonts.quantico(
        color: Colors.white, fontSize: 21.0, fontWeight: FontWeight.w600);
    final TextStyle subtitleTextStyle = GoogleFonts.manrope(
        color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w400);
    return GlassMorphicListTile(
        height: 220,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: FutureBuilder(
                    future: SingleEventRepository()
                        .getSingleEvent(winnerModel.event.toString()),
                    builder: (context, AsyncSnapshot<EventModel?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data != null) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                winnerModel.name,
                                style: titleTextStyle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              KeyValueText(
                                keyText: 'College',
                                valueText: winnerModel.college,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              KeyValueText(
                                  keyText: 'Position',
                                  valueText: winnerModel.position.toString()),
                              const SizedBox(
                                height: 4.0,
                              ),
                              KeyValueText(
                                  keyText: 'Event',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  valueText: snapshot.data!.name)
                            ],
                          );
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
            ],
          ),
        ));
  }
}
