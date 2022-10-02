import 'package:concetto_app/services/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;


  Duration duration = DateTime(2022,10,21,0,0,0).difference(DateTime.now());

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

    double height = SizeConfig.instance.screenHeight;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.06),
            child: const Text('Concetto',
                style: TextStyle(
                    fontSize: 36.0,
                    fontFamily: "orbitron",
                    letterSpacing: 5.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Center(
            child: Text('Coming Soon...', style: TextStyle(color: Colors.white,
                fontSize: 40)),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            '$days:$hours:$minutes:$seconds',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
                fontSize: 40),
          ),
        ],
      ),
    );
  }
}
