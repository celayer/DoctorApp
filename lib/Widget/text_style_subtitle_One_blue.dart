import 'package:doctor_application/core/constants.dart';
import 'package:flutter/material.dart';

class TextStyleSubtitleOneBlue extends StatelessWidget {
  const TextStyleSubtitleOneBlue({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .subtitle1
          ?.copyWith(color: DoctorConst.colorBlue),
    );
  }
}
