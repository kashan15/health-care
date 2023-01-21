import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';

import '../Widget/bottom_app_bar.dart';
import '../Widget/error_widget.dart';
import '../utils/app_localization.dart';
import '../utils/color_utils.dart';
import '../utils/dialog_utils.dart';
import '../utils/font_utils.dart';
import '../utils/image_utils.dart';

class LookingFor extends StatefulWidget {
  const LookingFor({Key? key}) : super(key: key);

  @override
  State<LookingFor> createState() => _LookingForState();
}

class _LookingForState extends State<LookingFor> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
                backgroundColor: ColorUtils.almond,
                body: SingleChildScrollView(
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.horizontalPadding),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Dimensions.topMargin,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                ImageUtils.soulgood,
                                height: 10.i,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              children: [
                                SizedBox(
                                  width: 5.w,
                                ),
                                SvgPicture.asset(
                                  ImageUtils.progressbar2,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              "I’m looking for",
                              // AppLocalizations.of(context)!
                              //     .translate('other_text_78')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 4.t),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 9.h,
                            ),
                            InkWell(
                              onTap: () {
                                model.coachingSelect = true;
                                model.TherapistSelect = false;
                                // model.notifyListeners();
                                setState(() {});
                              },
                              child: Material(
                                elevation:
                                    model.coachingSelect == true ? 10 : 0,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 1.h),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.white,
                                      border: Border.all(
                                          color: model.coachingSelect == true
                                              ? ColorUtils.green
                                              : ColorUtils.silver),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    "Coaching",
                                    // "AppLocalizations.of(context)!
                                    //     .translate('other_text_84')!",
                                    style: TextStyle(
                                        fontFamily: FontUtils.montserratMedium,
                                        color: model.coachingSelect == true
                                            ? ColorUtils.green
                                            : ColorUtils.black,
                                        fontSize: 2.5.t,
                                        height: 0.2.h),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            InkWell(
                              onTap: () {
                                model.coachingSelect = false;
                                model.TherapistSelect = true;
                                // model.notifyListeners();
                                setState(() {});
                              },
                              child: Material(
                                elevation:
                                    model.TherapistSelect == true ? 10 : 0,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 22.w, vertical: 1.h),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.white,
                                      border: Border.all(
                                          color: model.TherapistSelect == true
                                              ? ColorUtils.green
                                              : ColorUtils.silver),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    "Therapy",
                                    // "AppLocalizations.of(context)!
                                    //     .translate('other_text_84')!",
                                    style: TextStyle(
                                        fontFamily: FontUtils.montserratMedium,
                                        color: model.TherapistSelect == true
                                            ? ColorUtils.green
                                            : ColorUtils.black,
                                        fontSize: 2.5.t,
                                        height: 0.2.h),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // SizedBox(
                                  //   width: 10.w,
                                  // ),
                                  InkWell(
                                      onTap: () {
                                        model.navigateBack();
                                      },
                                      child: Image.asset(
                                        ImageUtils.backArrow,
                                        height: 10.i,
                                      )),
                                  InkWell(
                                      onTap: () {
                                        model.checkForLookingFor();
                                        // if (model.codeController.text.isEmpty) {
                                        //   DialogUtils().showDialog(MyErrorWidget(
                                        //       error:
                                        //           "Please Enter Valid Code"));
                                        // } else {
                                        //   model.navigation_Service
                                        //       .navigateTo(to: LookingFor());
                                        // }
                                        // model.notifyListeners();
                                      },
                                      child: SvgPicture.asset(
                                          ImageUtils.forwardArrow)),
                                  // SizedBox(
                                  //   width: 10.w,
                                  // )
                                ],
                              ),
                            )
                          ],
                        ))))));
  }
}
