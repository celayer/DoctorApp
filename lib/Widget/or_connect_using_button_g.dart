import 'package:doctor_application/core/constants.dart';
import 'package:flutter/material.dart';

class OrConnectUsingGoogle extends StatelessWidget {
  const OrConnectUsingGoogle(
      {super.key,
      required this.onPressed,
      required this.widget,
      required this.icon});

  final void Function() onPressed;
  final Widget widget;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: widget,
      style: ElevatedButton.styleFrom(
        backgroundColor: DoctorConst.colorOrange,
        shape: RoundedRectangleBorder(borderRadius: DoctorConst.borderRadius10),
      ),
    );
  }
}
