import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:concetto_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/configs/size_config.dart';
import '../widgets/rive_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double screenHeight = SizeConfig.instance.screenHeight;
  double screenWidth = SizeConfig.instance.screenWidth;

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
            () => Navigator.of(context).pushReplacement(_createRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/app_background.jpeg'),
                fit: BoxFit.fill),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Concetto',
                  style: GoogleFonts.orbitron(
                      fontSize: 46.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  padding: const EdgeInsets.all(2.0),
                  child: SizedBox(
                    height: 300,
                    width: screenWidth,
                    child: MyRiveAnimation(height: 350, width: screenWidth),
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w300,
                    fontSize: 20.0,
                    fontFamily: 'orbitron',
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText('REALITY BEYOND VISION'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),

    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}