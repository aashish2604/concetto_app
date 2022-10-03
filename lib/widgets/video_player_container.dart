import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:concetto_app/widgets/slashbox.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerContainer extends StatefulWidget {
  final double height;
  final double width;
  final Color? backgroundColor;
  const VideoPlayerContainer(
      {super.key,
      required this.height,
      required this.width,
      this.backgroundColor = kCoolGrey});

  @override
  State<VideoPlayerContainer> createState() => _VideoPlayerContainerState();
}

class _VideoPlayerContainerState extends State<VideoPlayerContainer> {
  Widget? chewiePlayer;
  late ChewieController chewieController;

  final videoPlayerController = VideoPlayerController.network(
      "https://firebasestorage.googleapis.com/v0/b/grid-4ccab.appspot.com/o/Concetto%20'22.mp4?alt=media&token=08c68ccc-df1b-4d2f-beae-8be86f55f969");

  void initPlayer() async {
    try {
      await videoPlayerController.initialize();

      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
      );

      chewiePlayer = Chewie(controller: chewieController);
      setState(() {});
    } on Exception catch (e) {
      print(e.toString());
      chewiePlayer = const Center(
        child: Text(
          'Some error occured!!',
          style: TextStyle(color: kBrightCyan, fontSize: 16.0),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: widget.height,
    //   width: widget.width,
    //   decoration:
    //       BoxDecoration(color: widget.backgroundColor, boxShadow: boxShadow),
    //   child: chewiePlayer ??
    //       const Center(
    //         child: CircularProgressIndicator(
    //           color: kBrightCyan,
    //         ),
    //       ),
    // );
    return BorderedSlashBox(
      height: widget.height,
      width: widget.width,
      padding: EdgeInsets.zero,
      child: chewiePlayer ??
          const Center(
            child: CircularProgressIndicator(
              color: kBrightCyan,
            ),
          ),
    );
  }

  final List<BoxShadow> boxShadow = [
    BoxShadow(
        color: kBrightCyan.withOpacity(0.7),
        spreadRadius: 2.0,
        blurRadius: 12.0),
  ];
}
