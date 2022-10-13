import 'package:doctor_application/View/docotr_community.dart';
import 'package:doctor_application/View/doctor_appointments.dart';
import 'package:doctor_application/View/doctor_home.dart';
import 'package:doctor_application/View/doctor_message.dart';
import 'package:doctor_application/View/doctor_profile.dart';
import 'package:flutter/material.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({super.key});

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  int _selectIndex = 0;

  List<Widget> _navigationBottomBar = [
    DoctorHome(),
    DoctorAppointments(),
    DoctorMessage(),
    DoctorCommunity(),
    DoctorProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        onTap: (int index) {
          setState(() {
            _selectIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.markunread_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
        ],
      ),
      body: _navigationBottomBar.elementAt(_selectIndex),
    );
  }
}
