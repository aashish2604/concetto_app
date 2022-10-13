import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:concetto_app/widgets/key_value_text.dart';
import 'package:concetto_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/guest_talks_model.dart';

class GuestTalksDetails extends StatelessWidget {
  final GuestTalksModel guestTalksModel;
  const GuestTalksDetails({required this.guestTalksModel, super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle titleTextStyle =
    TextStyle(fontFamily: "orbitron", fontSize: 32.0, color: Colors.white);
    const TextStyle subTitleTextStyle =
    TextStyle(fontSize: 22.0, color: Colors.white70);
    final TextStyle headingTextStyle =
    GoogleFonts.oswald(color: Colors.white, fontSize: 32.0);
    final TextStyle summaryTextStyle =
    GoogleFonts.sourceCodePro(color: Colors.white, fontSize: 22.0);
    final String startTime =
    DateFormat('dd MMM, h:mm a').format(guestTalksModel.startTimestamp);
    final String endTime =
    DateFormat('dd MMM, h:mm a').format(guestTalksModel.endTimestamp);
    final String registrationDeadline =
    DateFormat('dd MMM, h:mm a').format(guestTalksModel.registerTimestamp);

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/app_background.jpeg'),
              fit: BoxFit.fill)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          child: SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          child: CachedNetworkImage(
                            height: 350,
                            width: double.infinity,
                            fit: BoxFit.fill,
                            imageUrl: guestTalksModel.image,
                            placeholder: (context, url) =>
                            const Center(child: LoadingWidget()),
                            errorWidget: (context, url, error) => const Center(
                              child: Icon(
                                Icons.error_outline,
                                size: 76.0,
                              ),
                            ),
                          ),
                        ),
                        SafeArea(
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              )),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            guestTalksModel.guestName,
                            style: titleTextStyle,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '$startTime -- $endTime',
                            style: const TextStyle(color: kBrightCyan),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            guestTalksModel.summary,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20.0),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Details',
                            style: headingTextStyle,
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            guestTalksModel.details,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          KeyValueText(
                              keyText: 'Registration',
                              valueText: registrationDeadline),
                          KeyValueText(
                              keyText: 'Venue', valueText: guestTalksModel.venue),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextButton(
                                onPressed: () {
                                  Uri uri = Uri.parse(guestTalksModel.registerLink);
                                  launchUrl(uri);
                                },
                                child: const Text('Register')),
                          ),
                          const SizedBox(
                            height: 40.0,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // floatingActionButton: Container(
              //   padding: const EdgeInsets.all(2),
              //   decoration: const BoxDecoration(
              //       color: kBrightCyan, shape: BoxShape.circle),
              //   child: FloatingActionButton(
              //     backgroundColor: Colors.black,
              //     child:
              //     const Icon(Icons.assignment_outlined, color: kBrightCyan),
              //     onPressed: () {
              //       Uri uri = Uri.parse(guestTalksModel.);
              //       launchUrl(uri);
              //     },
              //   ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
