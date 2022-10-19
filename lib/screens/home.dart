import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:concetto_app/repository/events_repository.dart';
import 'package:concetto_app/repository/exhibition_repository.dart';
import 'package:concetto_app/repository/workshop_repository.dart';
import 'package:concetto_app/screens/about_us.dart';
import 'package:concetto_app/screens/events_guests/event_guest.dart';
import 'package:concetto_app/screens/exhibitions/exhibitions.dart';
import 'package:concetto_app/screens/workshop/workshop.dart';
import 'package:concetto_app/services/configs/size_config.dart';
import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:concetto_app/widgets/navigation_drawer.dart';
import 'package:concetto_app/widgets/rive_animation.dart';
import 'package:concetto_app/widgets/slashbox.dart';
import 'package:concetto_app/widgets/sponsors_list.dart';
import 'package:concetto_app/widgets/youtube_player.dart';
import 'package:flutter/material.dart';
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
    TextStyle slashboxTextStyle = const TextStyle(
      color: kBrightCyan,
      fontSize: 22.0,
      fontFamily: 'orbitron',
    );

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/app_background.jpeg'),
              fit: BoxFit.fill)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          child: Scaffold(
            extendBodyBehindAppBar: true,
            drawer: const NavigationDrawer(),
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            backgroundColor: Colors.transparent,
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
                  // const SizedBox(
                  //   height: 40.0,
                  // ),
                  SizedBox(
                    height: 250,
                    width: screenWidth,
                    child: MyRiveAnimation(height: 350, width: screenWidth),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EventsGuests()));
                    },
                    child: BorderedSlashBox(
                      padding: EdgeInsets.zero,
                      height: 150,
                      backgroundImage:
                          'assets/images/slashbox_dearkbackground.png',
                      width: screenWidth * 0.85,
                      child: Center(
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            color: kBrightCyan,
                            fontSize: 22.0,
                            fontFamily: 'orbitron',
                          ),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EventsGuests())),
                            animatedTexts: [
                              TypewriterAnimatedText('Events'),
                              TypewriterAnimatedText('Guest Talks'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // const Center(
                  //   child: Text(
                  //     'Coming Soon...',
                  //     style: TextStyle(
                  //         fontFamily: "orbitron",
                  //         fontSize: 40,
                  //         color: Colors.white),
                  //     // style: TextStyle(color: Colors.white, fontSize: 40)
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20.0,
                  // ),
                  // Text(
                  //   '$days:$hours:$minutes:$seconds',
                  //   style: const TextStyle(
                  //       fontWeight: FontWeight.w400,
                  //       color: kBrightCyan,
                  //       fontSize: 40),
                  // ),
                  YoutubePlayerContainer(
                    backgroundColor: kCoolGrey,
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.35,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ExhibitionList()));
                        },
                        child: BorderedSlashBox(
                          backgroundImage:
                              'assets/images/slashbox_dearkbackground.png',
                          height: 150.0,
                          width: SizeConfig.instance.screenWidth * 0.45,
                          padding: EdgeInsets.zero,
                          child: Center(
                            child: Text(
                              'Exhibitions',
                              style: slashboxTextStyle,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const WorkshopList()));
                        },
                        child: BorderedSlashBox(
                          backgroundImage:
                              'assets/images/slashbox_dearkbackground.png',
                          height: 150.0,
                          width: SizeConfig.instance.screenWidth * 0.45,
                          padding: EdgeInsets.zero,
                          child: Center(
                            child: Text(
                              'Workshop',
                              style: slashboxTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),

                  const Text(
                    'Major Sponsors',
                    style: TextStyle(
                        fontFamily: "orbitron",
                        fontSize: 30,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SponsorList(
                    isMajorRequired: true,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AboutUs()));
                        },
                        child: const Text('About us')),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                openWhatsapp();
              },
              child: Container(
                child: Image.asset('assets/images/whatsapp.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  openWhatsapp() async {
    var whatsapp = "+919835063191";
    var whatsappAndroid =
        "https://api.whatsapp.com//send?phone=$whatsapp&text=Hello , Can you please help me out .  I have a doubt regarding ";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappAndroid)) {
        await launch(whatsappAndroid);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }
}
