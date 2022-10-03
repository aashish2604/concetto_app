import 'package:concetto_app/services/configs/size_config.dart';
import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:concetto_app/widgets/slashbox.dart';
import 'package:concetto_app/widgets/video_player_container.dart';
import 'package:concetto_app/widgets/youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;

  Duration duration =
      DateTime(2022, 10, 21, 0, 0, 0).difference(DateTime.now());

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = duration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        timer!.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(duration.inDays);
    final hours = strDigits(duration.inHours.remainder(24));
    final minutes = strDigits(duration.inMinutes.remainder(60));
    final seconds = strDigits(duration.inSeconds.remainder(60));

    double screenHeight = SizeConfig.instance.screenHeight;
    double screenWidth = SizeConfig.instance.screenWidth;

    final Row followUsLabel = Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: const Divider(
              color: Colors.white70,
              height: 50,
            )),
      ),
      const Text(
        "Follow us on",
        style: TextStyle(color: Colors.white70),
      ),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: const Divider(
              color: Colors.white70,
              height: 50,
            )),
      ),
    ]);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.06),
              child: Text('Concetto',
                  style: GoogleFonts.orbitron(
                      fontSize: 46.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                color: Colors.white54,
              ),
            ),
            Text('REALITY BEYOND VISION',
                style: GoogleFonts.orbitron(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white70)),
            const SizedBox(
              height: 40.0,
            ),
            YoutubePlayerContainer(
              backgroundColor: kCoolGrey,
              width: screenWidth * 0.85,
              height: screenHeight * 0.35,
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Center(
              child: Text(
                'Coming Soon...',
                style: TextStyle(
                    fontFamily: "orbitron", fontSize: 40, color: Colors.white),
                // style: TextStyle(color: Colors.white, fontSize: 40)
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              '$days:$hours:$minutes:$seconds',
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: kBrightCyan,
                  fontSize: 40),
            ),
            const SizedBox(
              height: 60,
            ),
            followUsLabel,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      Uri uri = Uri.parse(
                          "https://www.facebook.com/Concettoiitdhanbad/");
                      launchUrl(uri);
                    },
                    icon: const FaIcon(
                      size: 40,
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                    )),
                IconButton(
                    onPressed: () {
                      Uri uri = Uri.parse(
                          "https://www.instagram.com/concetto.iitism/?hl=en");
                      launchUrl(uri);
                    },
                    icon: const FaIcon(
                      size: 40,
                      FontAwesomeIcons.instagram,
                      color: Colors.purple,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      size: 40,
                      FontAwesomeIcons.linkedin,
                      color: Colors.blue,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      size: 40,
                      FontAwesomeIcons.globe,
                      color: Colors.blue,
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
