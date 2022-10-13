import 'package:concetto_app/models/notifications_model.dart';
import 'package:concetto_app/repository/notification_repository.dart';
import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:concetto_app/widgets/glassmorphic_container.dart';
import 'package:concetto_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle headingStyle =
        GoogleFonts.oswald(color: Colors.white, fontSize: 32.0);
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/app_background.jpeg'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: NotificationRepository().getNotifications(),
            builder:
                (context, AsyncSnapshot<List<NotificationModel>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data != null) {
                  if (snapshot.data!.isNotEmpty) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10.0),
                        child: Column(
                          children: [
                            Text(
                              'Notifications',
                              style: headingStyle,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              // gridDelegate:
                              //     const SliverGridDelegateWithFixedCrossAxisCount(
                              //   crossAxisCount: 1,
                              //   crossAxisSpacing: 10,
                              //   mainAxisSpacing: 10,
                              // ),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return NotificationListTile(
                                    notificationModel: snapshot.data![index]);
                              },
                            ),
                          ],
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
            }),
      ),
    );
  }
}

class NotificationListTile extends StatelessWidget {
  final NotificationModel notificationModel;
  const NotificationListTile({required this.notificationModel, super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTextStyle = GoogleFonts.quantico(
        color: kBrightCyan, fontSize: 20.0, fontWeight: FontWeight.w600);
    final TextStyle subtitleTextStyle = GoogleFonts.manrope(
        color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w400);
    final String time =
        DateFormat('dd MMM, h:mm a').format(notificationModel.timestamp);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GlassMorphism(
          borderColor: kBrightCyan,
          start: 0.25,
          end: 0.3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notificationModel.title, style: titleTextStyle),
                Text(
                  time,
                  style: const TextStyle(color: Colors.white70, fontSize: 14.0),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  notificationModel.message,
                  style: subtitleTextStyle,
                )
              ],
            ),
          )),
    );
  }
}
