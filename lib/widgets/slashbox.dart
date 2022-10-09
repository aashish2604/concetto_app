import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BorderedSlashBox extends StatelessWidget {
  final Widget? child;
  final double height;
  final double width;
  final EdgeInsets? padding;
  final String? backgroundImage;
  const BorderedSlashBox(
      {super.key,
      required this.height,
      required this.width,
      this.backgroundImage,
      this.padding,
      this.child});

  @override
  Widget build(BuildContext context) {
    return SlashBox(
      height: height,
      width: width,
      color: kBrightCyan,
      child: Center(
        child: SlashBox(
          height: height - 4,
          width: width - 4,
          color: kCoolGrey,
          backgroundImage: backgroundImage,
          child: Padding(
            padding: padding ??
                EdgeInsets.only(
                    top: (height * 0.1 + 2), left: (width * 0.1 + 2)),
            child: child,
          ),
        ),
      ),
    );
  }
}

class SlashBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;
  final Color color;
  final String? backgroundImage;
  const SlashBox(
      {required this.height,
      required this.width,
      required this.color,
      this.backgroundImage,
      this.child,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color,
            image: backgroundImage != null
                ? DecorationImage(
                    image: AssetImage(backgroundImage!), fit: BoxFit.fill)
                : null
            // border: Border.all(color: kBrightCyan, width: 2),
            ),
        child: child,
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    Path path = Path();
    // path.moveTo(0, h * 0.1802192);
    // path.lineTo(0, h * 0.9976932);
    // path.lineTo(w * 0.8958333, h * 0.9976932);
    // path.lineTo(w * 0.9983333, h * 0.8290081);
    // path.lineTo(w * 0.9983333, h * 0.0028835);
    // path.lineTo(w * 0.1041667, h * 0.0043253);
    // path.lineTo(0, h * 0.1802192);
    // path.close();
    path.moveTo(0, h * 0.15);
    path.lineTo(0, h);
    path.lineTo(w * 0.85, h);
    path.lineTo(w, h * 0.85);
    path.lineTo(w, 0);
    path.lineTo(w * 0.15, 0);
    // path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
