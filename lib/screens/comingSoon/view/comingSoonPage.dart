import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internshala_submission/common/Common_Widget.dart';


import '../../../AppDetails.dart';
import '../../../common/Common_Colors.dart';
import '../../../common/SizeConfig.dart';
import '../../filtersPage/controller/selectionController.dart';


class ComingSoonPage extends StatefulWidget {
  @override
  ComingSoonPageState createState() => ComingSoonPageState();
}

class ComingSoonPageState extends State<ComingSoonPage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(preferredSize: const Size.fromHeight(55),
            child: SizedBox(height: 55,
              child: Container(
                height: 55,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  color: HexColor(CommonColors.dashboardBackColor),
                  boxShadow: [
                    BoxShadow(
                        color: HexColor("#D0D0D0"),
                        blurRadius: 5),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 8.0, bottom: 0.0),
                  visualDensity:
                  const VisualDensity(horizontal: -4.0, vertical: -4),
                  leading: InkWell(onTap:(){

                  }, child: Icon(Icons.menu)),

                  title: textWidget(
                    text:
                    "Internshala",
                    fontSize: 16.0,
                    fontFamily: AppDetails.fontPoppinsRegular,
                    color: HexColor(CommonColors.onBoardingTitleColor),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: HexColor(CommonColors.dashboardBackColor),
          body: Container(color: HexColor(CommonColors.whiteColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                textWidget(
                  textAlign: TextAlign.center,
                  text: 'We are about to launch these features, will update here very soon',
                  color: HexColor(CommonColors.addDataColor),
                  fontFamily: AppDetails.fontPoppinsBold,
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0,
                ),
                textWidget(
                  textAlign: TextAlign.center,
                  text: 'Come after sometime and recheck!',
                  color: HexColor(CommonColors.appPrimaryColor),
                  fontFamily: AppDetails.fontPoppinsBold,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                const SizedBox(
                  height: 7.0,
                ),
              ],
            ),
          ))
      );
  }
}
