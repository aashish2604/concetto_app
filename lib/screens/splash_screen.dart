import 'dart:async';

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
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/app_background.jpeg'),
            fit: BoxFit.fill),
      ),
      child: Center(
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
            SizedBox(
              height: 350,
              width: screenWidth,
              child: MyRiveAnimation(height: 350, width: screenWidth),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                color: Colors.white54,
              ),
            ),
            Text(
              'REALITY BEYOND VISION',
              style: GoogleFonts.orbitron(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
