import 'package:concetto_app/models/events_model.dart';
import 'package:concetto_app/repository/events_repository.dart';
import 'package:concetto_app/screens/events/event_details.dart';
import 'package:concetto_app/services/configs/size_config.dart';
import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:concetto_app/widgets/loading.dart';
import 'package:concetto_app/widgets/slashbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle headingStyle =
        GoogleFonts.oswald(color: Colors.white, fontSize: 36.0);

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: EventsRepository().getEvents(),
          builder: (context, AsyncSnapshot<List<EventModel>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data != null) {
                return SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Events',
                          style: headingStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 36.0,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) =>
                            EventsListBox(eventModel: snapshot.data![index])),
                      )
                    ],
                  ),
                ));
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
    );
  }
}

class EventsListBox extends StatelessWidget {
  final EventModel eventModel;
  const EventsListBox({required this.eventModel, super.key});

  @override
  Widget build(BuildContext context) {
    // double heightOfScreen = SizeConfig.instance.screenHeight;
    double boxHeight = 200;
    final TextStyle titleTextStyle = GoogleFonts.quantico(
        color: kBrightCyan, fontSize: 24.0, fontWeight: FontWeight.w600);
    final TextStyle subtitleTextStyle = GoogleFonts.manrope(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w400);
    final TextStyle summaryTextStyle = GoogleFonts.sourceCodePro(
      color: Colors.white60,
      fontSize: 16.0,
    );
    final String startTime =
        DateFormat('dd MMM, h:mm a').format(eventModel.startTimestamp);
    final String endTime =
        DateFormat('dd MMM, h:mm a').format(eventModel.endTimestamp);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EventDetails(eventModel: eventModel)));
        },
        child: BorderedSlashBox(
          height: boxHeight,
          width: SizeConfig.instance.screenWidth - 32,
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventModel.name,
                  style: titleTextStyle,
                ),
                Text(
                  eventModel.subTitle,
                  style: subtitleTextStyle,
                ),
                Text(
                  eventModel.summary,
                  style: summaryTextStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Expanded(child: SizedBox()),
                // Text(
                //   'Venue: ${eventModel.venue}',
                //   style: const TextStyle(color: Colors.white),
                // ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  '$startTime -- $endTime',
                  style: const TextStyle(color: kBrightCyan),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
