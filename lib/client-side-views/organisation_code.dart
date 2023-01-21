import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/Widget/bottom_app_bar.dart';
import 'package:soulgood/Widget/error_widget.dart';
import 'package:soulgood/client-side-views/looking_for.dart';
import 'package:soulgood/utils/dialog_utils.dart';
import 'package:soulgood/utils/extensions.dart';

import '../utils/color_utils.dart';
import '../utils/dimensions.dart';
import '../utils/font_utils.dart';
import '../utils/image_utils.dart';

class OrganizationCode extends StatefulWidget {
  const OrganizationCode({Key? key}) : super(key: key);

  @override
  State<OrganizationCode> createState() => _OrganizationCodeState();
}

class _OrganizationCodeState extends State<OrganizationCode> {
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
                              "Enter your organisation code",
                              // AppLocalizations.of(context)!
                              //     .translate('other_text_81')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 4.t,
                                  height: 0.2.h),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              width: 60.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: model.codeFocus.hasFocus
                                          ? ColorUtils.green
                                          : ColorUtils.silver),
                                  borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(
                                        fontSize: 4.t,
                                      ),
                                      focusNode: model.codeFocus,
                                      onTap: () {
                                        model.notifyListeners();
                                      },
                                      controller: model.codeController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Enter code',
                                          // AppLocalizations.of(context)!
                                          //     .translate('other_text_82')!,
                                          hintStyle: TextStyle(
                                              fontSize: 2.8.t,
                                              color: ColorUtils.black)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  )
                                ],
                              ),
                            ),
                            // Container(
                            //   height: 5.h,
                            //   child: Center(
                            //     child: model.errorMessage != null
                            //         ? Text(
                            //             model.errorMessage!,
                            //             style: TextStyle(
                            //               fontFamily: FontUtils.montserratBold,
                            //               color: ColorUtils.text_red,
                            //               fontSize: 1.8.t,
                            //             ),
                            //             maxLines: null,
                            //             textAlign: TextAlign.center,
                            //           )
                            //         : Container(),
                            //   ),
                            // ),
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
                                        if (model.codeController.text.isEmpty) {
                                          DialogUtils().showDialog(MyErrorWidget(
                                              error:
                                                  "Please Enter Valid Code"));
                                        } else {
                                          model.navigation_Service
                                              .navigateTo(to: LookingFor());
                                        }
                                        model.notifyListeners();
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
