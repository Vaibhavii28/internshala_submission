import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internshala_submission/screens/searchPage/view/searchPage.dart';

import '../../common/Common_Images.dart';
import '../../common/SizeConfig.dart';
// import 'package:lawinzo_app/common/Common_Images.dart';
// import 'package:lawinzo_app/common/InternetConnection.dart';
// import 'package:lawinzo_app/common/SizeConfig.dart';
// import 'package:lawinzo_app/screens/ClientSection/clientDashboard/view/ClientDashboard.dart';
// import 'package:lawinzo_app/screens/LawyerSection/createProfile/view/createProfile.dart';
// import 'package:lawinzo_app/screens/LawyerSection/dashboard/view/Dashboard.dart';
// import 'package:lawinzo_app/screens/LawyerSection/onBoarding/view/onBoardingScreen.dart';
// import 'package:lawinzo_app/storage/Storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashtime = 3;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: splashtime), () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => SearchPage(), fullscreenDialog: true),
        );

    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);


      return Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Image.asset(
          CommonImages.splashImage,
          fit: BoxFit.fill,
        ),
      );

  }
}
