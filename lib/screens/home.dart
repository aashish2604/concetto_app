import 'package:concetto_app/services/configs/size_config.dart';
import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:concetto_app/widgets/slashbox.dart';
import 'package:concetto_app/widgets/video_player_container.dart';
import 'package:concetto_app/widgets/youtube_player.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = SizeConfig.instance.screenHeight;
    double screenWidth = SizeConfig.instance.screenWidth;
    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.06),
                child: const Text('Concetto',
                    style: TextStyle(
                        fontSize: 36.0,
                        fontFamily: "orbitron",
                        letterSpacing: 5.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              const SizedBox(
                height: 40.0,
              ),
              // VideoPlayerContainer(
              //   backgroundColor: kCoolGrey,
              //   width: screenWidth * 0.85,
              //   height: screenHeight * 0.35,
              // ),
              YoutubePlayerContainer(
                backgroundColor: kCoolGrey,
                width: screenWidth * 0.85,
                height: screenHeight * 0.35,
              ),
              const SizedBox(
                height: 20,
              ),
              // BorderedSlashBox(
              //   height: 200,
              //   width: SizeConfig.instance.screenWidth * 0.8,
              //   child: const Text(
              //     'Something',
              //     style: TextStyle(fontSize: 18, color: Colors.white),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
