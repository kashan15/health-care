import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulgood/Widget/bottom_app_bar.dart';
import 'package:soulgood/Widget/therapis_bottom_app_bar.dart';
import 'package:soulgood/onboard/on_board.dart';
import 'package:soulgood/onboard/test.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/authentication_view_model.dart';
import 'package:stacked/stacked.dart';

import 'Widget/bottom_app_bar_custom.dart';
import 'app/locator.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }

  navigate() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    await Future.delayed(Duration(milliseconds: 4500), () {});
    model.isPatient = prefs.getBool("isPatient") ?? false;
    model.istherapist = prefs.getBool('isTherapist') ?? false;
    if (model.isPatient == true) {
      model.userId = prefs.getString('UserId')!;
      model.userToken = prefs.getString('userToken')!;
      model.userEmail = prefs.getString('userEmail')!;
      print(model.userId);
      print(model.userToken);
      print(model.isPatient);
      print(model.istherapist);
      model.AllUserDataForCheckingTokenExpiry(
          prefs.getString('UserId')!, prefs.getString('userToken')!);
    } else if (model.istherapist == true) {
      model.therapistId = prefs.getString('TherapistId')!;
      model.therapistToken = prefs.getString('TherapistToken')!;
      model.therapistEmailForshared = prefs.getString('therapistEmail')!;
      print(model.therapistId);
      print(model.therapistToken);
      print(model.istherapist);
      print(model.isPatient);
      model.gettherapistByIdCheckingForTokenExpiry(
          prefs.getString('TherapistId')!, prefs.getString('TherapistToken')!);
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Test()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorUtils.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Image.asset(ImageUtils.splash)
            ],
          ),
        ),
      ),
    );
  }
}
