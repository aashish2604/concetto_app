import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KeyValueText extends StatelessWidget {
  final String keyText;
  final String valueText;
  const KeyValueText(
      {required this.keyText, required this.valueText, super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: '$keyText: ',
          style: GoogleFonts.sourceCodePro(color: kBrightCyan, fontSize: 18.0)),
      TextSpan(
          text: valueText,
          style: const TextStyle(color: Colors.white, fontSize: 16.0)),
    ]));
  }
}
