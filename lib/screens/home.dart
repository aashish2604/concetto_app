import 'package:concetto_app/services/configs/size_config.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Text('Home Page', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
