import 'package:concetto_app/services/configs/size_config.dart';
import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:concetto_app/widgets/slashbox.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerContainer extends StatefulWidget {
  final double height;
  final double width;
  final Color? backgroundColor;
  const YoutubePlayerContainer(
      {required this.height,
      required this.width,
      this.backgroundColor = kCoolGrey,
      super.key});

  @override
  State<YoutubePlayerContainer> createState() => _YoutubePlayerContainerState();
}

class _YoutubePlayerContainerState extends State<YoutubePlayerContainer> {
  YoutubePlayerController? playController;
  @override
  void initState() {
    playController = YoutubePlayerController(
        initialVideoId: 'ylirku6tBFc',
        flags: const YoutubePlayerFlags(
            autoPlay: true, loop: true, showLiveFullscreenButton: false));

    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return playController != null
        ? YoutubePlayerBuilder(
            player: YoutubePlayer(controller: playController!),
            builder: (builder, player) {
              return BorderedSlashBox(
                height: widget.height,
                width: widget.width,
                padding: EdgeInsets.zero,
                child: player,
              );
            })
        : const Center(
            child: CircularProgressIndicator(color: kBrightCyan),
          );
  }
}
