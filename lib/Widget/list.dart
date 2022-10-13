import 'package:doctor_application/core/constants.dart';
import 'package:flutter/material.dart';

class CardBanner {
  final Icon icon;
  final String title;
  final String text;

  CardBanner(this.icon, this.title, this.text);
}

List<CardBanner> cardList = [
  CardBanner(
      Icon(
        Icons.date_range_outlined,
        color: DoctorConst.colorBlue,
      ),
      DoctorConst.cardTitle,
      DoctorConst.appBarDownText),
];
