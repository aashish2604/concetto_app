import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassMorphicListTile extends StatelessWidget {
  final Widget child;
  const GlassMorphicListTile({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicFlexContainer(
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
            kBrightCyan.withOpacity(0.5),
            kBrightCyan.withOpacity(0.5),
          ],
        ),
        child: child);
  }
}
