import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'dart:ui';

class GlassMorphicListTile extends StatelessWidget {
  final Color borderColor;
  final Widget child;
  final double width;
  final double height;
  const GlassMorphicListTile(
      {this.borderColor = kBrightCyan,
      required this.child,
      required this.height,
      required this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
        height: height,
        width: width,
        borderRadius: 20,
        blur: 20,
        // padding: const EdgeInsets.all(40),
        alignment: Alignment.bottomCenter,
        border: 2,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFffffff).withOpacity(0.1),
              const Color(0xFFFFFFFF).withOpacity(0.05),
            ],
            stops: const [
              0.1,
              1,
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            borderColor.withOpacity(0.5),
            borderColor.withOpacity(0.5),
          ],
        ),
        child: child);
  }
}

class GlassMorphism extends StatelessWidget {
  final Color? borderColor;
  final Widget child;
  final double start;
  final double end;
  const GlassMorphism({
    Key? key,
    this.borderColor,
    required this.child,
    required this.start,
    required this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(start),
                Colors.white.withOpacity(end),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              width: 1.5,
              color: borderColor ?? (Colors.white).withOpacity(0.2),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
