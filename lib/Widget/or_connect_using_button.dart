import 'package:doctor_application/core/constants.dart';
import 'package:flutter/material.dart';

class OrConnectUsingFacebook extends StatelessWidget {
  const OrConnectUsingFacebook(
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
        shape: RoundedRectangleBorder(borderRadius: DoctorConst.borderRadius10),
      ),
    );
  }
}
