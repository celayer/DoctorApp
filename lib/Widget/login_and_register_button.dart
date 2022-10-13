import 'package:doctor_application/core/constants.dart';
import 'package:flutter/material.dart';

class LoginAndRegisterButton extends StatelessWidget {
  const LoginAndRegisterButton(
      {super.key, required this.onPressed, required this.widget});

  final void Function() onPressed;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 2,
      child: ElevatedButton(
        onPressed: onPressed,
        child: widget,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          textStyle: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(fontWeight: FontWeight.bold),
          shape:
              RoundedRectangleBorder(borderRadius: DoctorConst.borderRadius30),
        ),
      ),
    );
  }
}
