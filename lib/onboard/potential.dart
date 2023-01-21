import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class Potential extends StatefulWidget {
  @override
  _PotentialState createState() => _PotentialState();
}

class _PotentialState extends State<Potential> {
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
            // floatingActionButton: GestureDetector(
            //     onTap: () {
            //       model.navigateToLogin();
            //     },
            //     child: Stack(
            //       alignment: Alignment.center,
            //       children: [
            //         Container(
            //           decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //             color: ColorUtils.purple,
            //           ),
            //           child: Padding(
            //             padding: const EdgeInsets.all(18.0),
            //             child: Icon(
            //               Icons.arrow_forward_ios_outlined,
            //               color: Colors.white,
            //               size: 4.i,
            //               // height: 1.h,
            //               // width: 1.w,
            //             ),
            //           ),
            //         ),

            //         TweenAnimationBuilder(
            //           tween: Tween(begin: 0.7, end: 1),
            //           duration: Duration(seconds: 2),
            //           builder: (context, value, child) {
            //             return SizedBox(
            //               width: 17.w,
            //               height: 17.w,
            //               child: CircularProgressIndicator(
            //                 value: double.parse(value.toString()),
            //                 color: ColorUtils.purple,
            //                 backgroundColor: Colors.transparent,
            //                 strokeWidth: 3,
            //               ),
            //             );
            //           },
            //         ),

            //       ],
            //     )
            // ),
            backgroundColor: ColorUtils.almond,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              height: 37.h,
                              child: Image.asset(
                                ImageUtils.potential,
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: Dimensions.horizontalPadding),
                              child: Text(
                                AppLocalizations.of(context)!
                                    .translate('home_text_32')!,
                                style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 3.t,
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
                                    .translate('home_text_33')!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratRegular,
                                    fontSize: 2.t,
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
