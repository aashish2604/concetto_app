import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:concetto_app/models/events_model.dart';
import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:concetto_app/widgets/key_value_text.dart';
import 'package:concetto_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetails extends StatelessWidget {
  final EventModel eventModel;
  const EventDetails({required this.eventModel, super.key});

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
        DateFormat('dd MMM, h:mm a').format(eventModel.startTimestamp);
    final String endTime =
        DateFormat('dd MMM, h:mm a').format(eventModel.endTimestamp);
    final String registrationDeadline =
        DateFormat('dd MMM, h:mm a').format(eventModel.registerTimestamp);

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
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.fill,
                            imageUrl: eventModel.image,
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
                            eventModel.name,
                            style: titleTextStyle,
                          ),
                          Text(
                            eventModel.subTitle,
                            style: subTitleTextStyle,
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
                            eventModel.summary,
                            style: summaryTextStyle,
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
                            eventModel.details,
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
                              keyText: 'Venue', valueText: eventModel.venue),
                          KeyValueText(
                              keyText: 'Event type',
                              valueText: eventModel.eventType),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextButton(
                                onPressed: () {
                                  Uri uri = Uri.parse(eventModel.registerLink);
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
              floatingActionButton: FloatingActionButton(
                backgroundColor: kBrightCyan,
                child:
                    const Icon(Icons.assignment_outlined, color: Colors.black),
                onPressed: () {
                  Uri uri = Uri.parse(eventModel.brochureLink);
                  launchUrl(uri);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
