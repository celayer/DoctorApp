import 'package:flutter/material.dart';
class TextStyleSubtitleOne extends StatelessWidget {
  const TextStyleSubtitleOne({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: Theme.of(context).textTheme.subtitle1,);
  }
}