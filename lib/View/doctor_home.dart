import 'package:doctor_application/Widget/list.dart';
import 'package:doctor_application/core/constants.dart';
import 'package:flutter/material.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({super.key});

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        children: [Text("SAĞLIK SEBEBLERİNDEN DOLAYI ZAMANIM OLMADI VE YETİŞTİREMEDİM SAYGILAR.")],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leading: _paddingContainerColumnText(context),
      actions: [
        _containerRowButton(),
      ],
      leadingWidth: 100,
      bottom: _preferredsizeColumn(context),
    );
  }

  PreferredSize _preferredsizeColumn(BuildContext context) {
    return PreferredSize(
      child: Column(
        children: [
          _containerColumnTextsContainer(context),
          DoctorConst.sizedBoxHeight20,
        ],
      ),
      preferredSize: Size.fromHeight(120),
    );
  }

  Container _containerColumnTextsContainer(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
          borderRadius: DoctorConst.borderRadius10,
          color: DoctorConst.colorWhite),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DoctorConst.appBarDownText,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: DoctorConst.colorGrey),
                ),
                Text(DoctorConst.appBarDownTitle,
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: DoctorConst.borderRadius5,
                gradient: LinearGradient(
                  colors: [DoctorConst.colorBlue, DoctorConst.colorWhite],
                ),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 7,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_outlined,
                    color: DoctorConst.colorWhite),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _containerRowButton() {
    return Container(
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.markunread_outlined)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
    );
  }

  Padding _paddingContainerColumnText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(DoctorConst.appBarText,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: DoctorConst.colorWhite),
              textAlign: TextAlign.start),
          Row(
            children: [
              Text(DoctorConst.appBarName,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: DoctorConst.colorWhite),
                  textAlign: TextAlign.end),
              DoctorConst.sizedBoxWidth5,
              Icon(Icons.waving_hand_sharp),
            ],
          ),
        ]),
      ),
    );
  }
}
