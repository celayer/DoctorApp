import 'package:flutter/material.dart';

class TitleHeadlineSmall extends StatelessWidget {
  const TitleHeadlineSmall({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(fontWeight: FontWeight.w800),
      textAlign: TextAlign.center,
    );
  }
}
