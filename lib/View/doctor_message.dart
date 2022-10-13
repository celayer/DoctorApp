import 'package:flutter/material.dart';
class DoctorMessage extends StatefulWidget {
  const DoctorMessage({super.key});

  @override
  State<DoctorMessage> createState() => _DoctorMessageState();
}

class _DoctorMessageState extends State<DoctorMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Message")),);
  }
}