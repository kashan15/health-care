import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      builder: (context, model, child) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            backgroundColor: ColorUtils.almond,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   height: 3.1.h,
                      // ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(ImageUtils.onboardTopleft),
                          Image.asset(ImageUtils.onboardTopRight),
                        ],
                      ),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 37.67.h,
                              child: Image.asset(
                                ImageUtils.appointmentGif,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Center(
                              child: Text(
                                AppLocalizations.of(context)!
                                    .translate('home_text_30')!,
                                style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 3.t,
                                  // color: ColorUtils.darkText,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text(
                                AppLocalizations.of(context)!
                                    .translate('home_text_31')!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratRegular,
                                    fontSize: 2.2.t,
                                    height: 0.15.h
                                    // color: ColorUtils.jobsDescription,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset(ImageUtils.onboardBottomleft1),
                      SvgPicture.asset(ImageUtils.onboardBottomRight2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
