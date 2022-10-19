import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KeyValueText extends StatelessWidget {
  final String keyText;
  final String valueText;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? valueSize;
  const KeyValueText(
      {required this.keyText,
      required this.valueText,
      this.maxLines,
      this.valueSize,
      this.overflow,
      super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        overflow: overflow ?? TextOverflow.clip,
        maxLines: maxLines,
        text: TextSpan(children: [
          TextSpan(
              text: '$keyText: ',
              style: GoogleFonts.sourceCodePro(
                  color: kBrightCyan, fontSize: 18.0)),
          TextSpan(
              text: valueText,
              style:
                  TextStyle(color: Colors.white, fontSize: valueSize ?? 16.0)),
        ]));
  }
}
