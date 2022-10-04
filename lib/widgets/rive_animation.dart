import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class MyRiveAnimation extends StatefulWidget {
  final double height;
  final double width;
  const MyRiveAnimation({required this.height, required this.width, super.key});

  @override
  State<MyRiveAnimation> createState() => _MyRiveAnimationState();
}

class _MyRiveAnimationState extends State<MyRiveAnimation> {
  SMITrigger? _click;
  Artboard? _riveArtboard;
  StateMachineController? _controller;

  @override
  void initState() {
    rootBundle.load('assets/animations/new_file.riv').then((data) async {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      var controller =
          StateMachineController.fromArtboard(artboard, 'State Machine 1');
      if (controller != null) {
        artboard.addController(controller);
        _click = controller.findSMI('Click');
        setState(() {
          _riveArtboard = artboard;
        });
      }
    });
    super.initState();
  }

  void hitClick() {
    setState(() {
      _click?.fire();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _riveArtboard != null
            ? GestureDetector(
                onTap: () {
                  hitClick();
                },
                child: SizedBox(
                    height: widget.height,
                    width: widget.width,
                    child: Rive(
                      artboard: _riveArtboard!,
                      alignment: Alignment.center,
                    )),
              )
            : const SizedBox(),
      ),
    );
  }
}
