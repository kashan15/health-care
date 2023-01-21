import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

import '../Widget/error_widget.dart';
import '../app/locator.dart';
import '../utils/app_localization.dart';
import '../utils/color_utils.dart';
import '../utils/dialog_utils.dart';
import '../utils/dimensions.dart';
import '../utils/font_utils.dart';

class WhatBringYou extends StatefulWidget {
  const WhatBringYou({Key? key}) : super(key: key);

  @override
  State<WhatBringYou> createState() => _WhatBringYouState();
}

class _WhatBringYouState extends State<WhatBringYou> {
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
                  body: Container(
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
                              ImageUtils.progressbar6,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                children: [
                                  Text(
                                    "What brings you to \nSoulgood?",
                                    // AppLocalizations.of(context)!
                                    //     .translate('other_text_87')!,
                                    style: TextStyle(
                                        fontFamily: FontUtils.montserratBold,
                                        fontSize: 3.t),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Material(
                                    elevation: 10,
                                    shadowColor:
                                        ColorUtils.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      // padding: EdgeInsets.all(20),
                                      height: 8.h,
                                      // padding:
                                      //     EdgeInsets.symmetric(vertical: 2.h),
                                      // width: 100.w,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorUtils.green),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: InkWell(
                                        onTap: () {
                                          model.dropDownOfBringsYou =
                                              !model.dropDownOfBringsYou;
                                          model.notifyListeners();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 70.w,
                                                child: Text(
                                                  model.selectedNameofBring
                                                          .isEmpty
                                                      ? "Select one or multiple"
                                                      // AppLocalizations.of(context)!
                                                      //     .translate('other_text_88')!,
                                                      : model
                                                          .selectedNameofBring
                                                          .toString()
                                                          .replaceAll("[", "")
                                                          .replaceAll("]", ""),
                                                  style: TextStyle(
                                                      color: ColorUtils.green,
                                                      fontFamily: FontUtils
                                                          .montserratSemiBold,
                                                      fontSize: 2.t),
                                                  softWrap: true,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Icon(Icons
                                                  .keyboard_arrow_down_outlined)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  model.dropDownOfBringsYou == true
                                      ? Container(
                                          decoration: BoxDecoration(
                                              // boxShadow: [
                                              //   BoxShadow(
                                              //       color: ColorUtils.greyLight,
                                              //       blurRadius: 15,
                                              //       blurStyle: BlurStyle.outer)
                                              // ],
                                              border: Border.all(
                                                  color: ColorUtils.green),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 1.h),
                                          child: ListView.separated(
                                            padding: EdgeInsets.zero,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: model.brignsYou.length,
                                            separatorBuilder:
                                                (context, index) =>
                                                    SizedBox(height: 1.h),
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                tileColor:
                                                    // model.selectedDropDownItemWhatYouBring ==
                                                    //         index
                                                    model.selectedNameofBring
                                                            .contains(model
                                                                    .brignsYou[
                                                                index]['name'])
                                                        ? ColorUtils.LightGrey
                                                        : Colors.transparent,
                                                onTap: () {
                                                  model.selectedDropDownItemWhatYouBring =
                                                      index;

                                                  model.selectedNameofBring
                                                          .contains(model
                                                                  .brignsYou[index]
                                                              ['name'])
                                                      ? model
                                                          .selectedNameofBring
                                                          .remove(model
                                                                  .brignsYou[
                                                              index]['name'])
                                                      : model
                                                          .selectedNameofBring
                                                          .add(model.brignsYou[
                                                              index]['name']);
                                                  // model.selectedDropDownLang =
                                                  //     model.brignsYou[index]
                                                  //         ['name'];
                                                  // model.dropDownPressed =
                                                  //     !model.dropDownPressed;

                                                  model.notifyListeners();
                                                },
                                                minVerticalPadding: 0,
                                                title: Text(model
                                                    .brignsYou[index]['name']),
                                              );
                                            },
                                          ),
                                        )
                                      : SizedBox(),
                                  model.dropDownOfBringsYou == true
                                      ? SizedBox(
                                          height: 4.h,
                                        )
                                      : SizedBox(
                                          height: 50.h,
                                        ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
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
                                              if (model.selectedNameofBring
                                                  .isEmpty) {
                                                DialogUtils().showDialog(
                                                    MyErrorWidget(
                                                        error:
                                                            "Please Select Atleast one"));
                                              } else {
                                                model.navigation_Service
                                                    .navigateTo(
                                                        to: WhatBringYou());
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
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
