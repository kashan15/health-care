import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';
import '../utils/app_localization.dart';
import '../utils/color_utils.dart';
import '../utils/dimensions.dart';
import '../utils/font_utils.dart';
import '../utils/image_utils.dart';
import '../viewModels/main_view_model.dart';

class JoiningAs extends StatefulWidget {
  const JoiningAs({Key? key}) : super(key: key);

  @override
  State<JoiningAs> createState() => _JoiningAsState();
}

class _JoiningAsState extends State<JoiningAs> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => locator<MainViewModel>(),
        disposeViewModel: false,
        onModelReady: (model) {},
        builder: (context, model, child) {
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
                                  ImageUtils.progressbar,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .translate('other_text_78')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 4.t),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            InkWell(
                              onTap: () {
                                model.individualSelect = true;
                                model.EmployeeSelect = false;
                                model.notifyListeners();
                              },
                              child: Material(
                                elevation:
                                    model.individualSelect == true ? 10 : 0,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 2.h),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.white,
                                      border: Border.all(
                                          color: model.individualSelect == true
                                              ? ColorUtils.green
                                              : ColorUtils.silver),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    // "Individual",
                                    AppLocalizations.of(context)!
                                        .translate('other_text_79')!,
                                    style: TextStyle(
                                        fontFamily: FontUtils.montserratMedium,
                                        color: model.individualSelect == true
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
                              height: 8.h,
                            ),
                            InkWell(
                              onTap: () {
                                model.EmployeeSelect = true;
                                model.individualSelect = false;
                                model.notifyListeners();
                              },
                              child: Material(
                                elevation:
                                    model.EmployeeSelect == true ? 10 : 0,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h, horizontal: 10.w),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.white,
                                      border: Border.all(
                                          color: model.EmployeeSelect == true
                                              ? ColorUtils.green
                                              : ColorUtils.silver),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    // "Employee or \nInsurance Member",
                                    AppLocalizations.of(context)!
                                        .translate('other_text_80')!,
                                    style: TextStyle(
                                        fontFamily: FontUtils.montserratMedium,
                                        fontSize: 2.5.t,
                                        color: model.EmployeeSelect == true
                                            ? ColorUtils.green
                                            : ColorUtils.black,
                                        height: 0.2.h),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                    onTap: () {
                                      model.checkForJoiningAs();
                                      // model.navigation_Service
                                      //     .navigateTo(to: );
                                    },
                                    child: SvgPicture.asset(
                                        ImageUtils.forwardArrow)),
                                SizedBox(
                                  width: 10.w,
                                )
                              ],
                            )
                            // InkWell(
                            //     onTap: () {
                            //       // model.navigateToExtra();
                            //     },
                            //     child: Container(
                            //       width: 45.w,
                            //       padding: EdgeInsets.symmetric(
                            //         vertical: 2.h,
                            //       ),
                            //       decoration: BoxDecoration(
                            //           boxShadow: [
                            //             BoxShadow(
                            //                 blurRadius: 6,
                            //                 offset: Offset(0, 10),
                            //                 color: ColorUtils.grey
                            //                     .withOpacity(0.2))
                            //           ],
                            //           color: ColorUtils.green,
                            //           borderRadius: BorderRadius.circular(20)),
                            //       child: Center(
                            //         child: Text(
                            //           AppLocalizations.of(context)!
                            //               .translate('other_text_14')!,
                            //           style: TextStyle(
                            //               color: ColorUtils.white,
                            //               fontFamily:
                            //                   FontUtils.montserratSemiBold),
                            //         ),
                            //       ),
                            //     )),
                          ],
                        ),
                      ),
                    ),
                  )));
        });
  }
}
