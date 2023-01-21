import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/onboard/appointment.dart';
import 'package:soulgood/onboard/potential.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/utils/screen_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
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
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              width: MediaQuery.of(context).size.width,
                              height: 35.h,
                              child: Image.asset(
                                ImageUtils.onBoard,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              AppLocalizations.of(context)!.translate('home_text_28')!,
                              style: TextStyle(
                                fontFamily: FontUtils.montserratBold,
                                fontSize: 3.t,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text(
                                AppLocalizations.of(context)!.translate('home_text_29')!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratRegular,
                                    fontSize: 2.t,
                                    height: 0.15.h),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
        
                      // DotsIndicator(
                      //
                      //   dotsCount: 3,
                      //   position: 0,
                      //   decorator: DotsDecorator(
                      //     color: ColorUtils.purplelight, // Inactive color
                      //     activeColor: ColorUtils.purple,
                      //   ),
                      // ),
                      // )
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
