import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/client-side-views/diseases.dart';
import 'package:soulgood/client-side-views/gender.dart';
import 'package:soulgood/client-side-views/looking_for.dart';
import 'package:soulgood/client-side-views/what_bring_you_to_soulgood.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

import '../Widget/error_widget.dart';
import '../utils/app_localization.dart';
import '../utils/dialog_utils.dart';
import '../utils/font_utils.dart';
import '../utils/image_utils.dart';

class SelectionOfCountryAndLanguage extends StatefulWidget {
  const SelectionOfCountryAndLanguage({Key? key}) : super(key: key);

  @override
  State<SelectionOfCountryAndLanguage> createState() =>
      _SelectionOfCOuntroStateAndLanguage();
}

class _SelectionOfCOuntroStateAndLanguage
    extends State<SelectionOfCountryAndLanguage> {
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
                            Expanded(
                              child: TweenAnimationBuilder(
                                  tween: Tween(
                                      begin: 0,
                                      end: ((model.selectionOfPages / 18) *
                                              100) /
                                          100),
                                  duration: Duration(milliseconds: 1000),
                                  builder: (context, value, child) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: ClipRRect(
                                        clipBehavior: Clip.hardEdge,
                                        borderRadius: BorderRadius.circular(5),
                                        child: LinearProgressIndicator(
                                          backgroundColor: Colors.transparent,
                                          minHeight: 1.h,
                                          color: ColorUtils.LightGrey,
                                          value: double.parse(value.toString()),
                                        ),
                                      ),
                                    );
                                  }),
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
                                  model.selectionOfPages == 1
                                      ? /*1*/ Text(
                                          //"I'm Joining as an"
                                          AppLocalizations.of(context)!
                                              .translate('other_text_78')!,
                                          style: TextStyle(
                                              fontFamily:
                                                  FontUtils.montserratBold,
                                              fontSize: 4.t),
                                        )
                                      : model.selectionOfPages == 2
                                          ? Text(
                                              // "Enter your organisation code",
                                              AppLocalizations.of(context)!
                                                  .translate('other_text_81')!,
                                              style: TextStyle(
                                                  fontFamily:
                                                      FontUtils.montserratBold,
                                                  fontSize: 4.t,
                                                  height: 0.2.h),
                                              textAlign: TextAlign.center,
                                            )
                                          : model.selectionOfPages == 3
                                              ? Text(
                                                  // "I’m looking for",
                                                  AppLocalizations.of(context)!
                                                      .translate(
                                                          'other_text_83')!,
                                                  style: TextStyle(
                                                      fontFamily: FontUtils
                                                          .montserratBold,
                                                      fontSize: 4.t),
                                                  textAlign: TextAlign.center,
                                                )
                                              : model.selectionOfPages == 4
                                                  ? Text(
                                                      'What’s your name?',
                                                      // AppLocalizations.of(context)!
                                                      //     .translate('user_detail_text_2')!,
                                                      style: TextStyle(
                                                          fontFamily: FontUtils
                                                              .montserratBold,
                                                          fontSize: 3.1.t),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )
                                                  : model.selectionOfPages == 5
                                                      ? Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      20.w),
                                                          child: Text(
                                                            // "Select your gender",
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .translate(
                                                                    'select_your_gender_text_1')!,
                                                            style: TextStyle(
                                                                color:
                                                                    ColorUtils
                                                                        .black,
                                                                fontFamily:
                                                                    FontUtils
                                                                        .montserratBold,
                                                                fontSize: 3.t),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        )
                                                      : model.selectionOfPages ==
                                                              6
                                                          ? Text(
                                                              // "Select your country \nand language",
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .translate(
                                                                      'other_text_86')!,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .montserratBold,
                                                                  fontSize:
                                                                      3.t),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            )
                                                          : model.selectionOfPages ==
                                                                  7
                                                              ? Text(
                                                                  "What brings you to \nSoulgood?",
                                                                  // AppLocalizations.of(context)!
                                                                  //     .translate('other_text_87')!,
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          FontUtils
                                                                              .montserratBold,
                                                                      fontSize:
                                                                          3.t),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                )
                                                              : model.selectionOfPages ==
                                                                      8
                                                                  ? Text(
                                                                      // "Which of the following best describes how you want your therapist or coach to help you?",
                                                                      AppLocalizations.of(context)!
                                                                          .translate('other_text_127')!,
                                                                      style: TextStyle(
                                                                          fontFamily: FontUtils
                                                                              .montserratBold,
                                                                          fontSize:
                                                                              3.t),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    )
                                                                  : model.selectionOfPages ==
                                                                          9
                                                                      ? Text(
                                                                          // "Anything else you want to work on?",
                                                                          AppLocalizations.of(context)!
                                                                              .translate('other_text_126')!,
                                                                          style: TextStyle(
                                                                              fontFamily: FontUtils.montserratBold,
                                                                              fontSize: 3.t),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        )
                                                                      : model.selectionOfPages ==
                                                                              10
                                                                          ? Text(
                                                                              // "Do you have a preference \nfor your counsellor’s \ngender?",
                                                                              AppLocalizations.of(context)!
                                                                                  .translate('other_text_125')!,
                                                                              style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 3.t),
                                                                              textAlign: TextAlign.center,
                                                                            )
                                                                          : model.selectionOfPages == 11
                                                                              ? Text(
                                                                                  // "Have you had therapy or coaching in the past?",
                                                                                  AppLocalizations.of(context)!
                                                                                      .translate('other_text_122')!,
                                                                                  style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 3.t),
                                                                                  textAlign: TextAlign.center,
                                                                                )
                                                                              : model.selectionOfPages == 12
                                                                                  ? Column(
                                                                                      children: [
                                                                                        Text(
                                                                                          // "Have you experienced violent or suicidal ideas in the past 2 weeks?",
                                                                                          AppLocalizations.of(context)!
                                                                                              .translate('other_text_123')!,
                                                                                          style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 3.t),
                                                                                          textAlign: TextAlign.center,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: 2.h,
                                                                                        ),
                                                                                        Text(
                                                                                          // "The soulgood platform should not be used during emergencies or crises.",
                                                                                          AppLocalizations.of(context)!
                                                                                              .translate('other_text_124')!,
                                                                                          style: TextStyle(fontFamily: FontUtils.montserratMedium, fontSize: 2.4.t, color: ColorUtils.text_red),
                                                                                          textAlign: TextAlign.center,
                                                                                        )
                                                                                      ],
                                                                                    )
                                                                                  : model.selectionOfPages == 13
                                                                                      ? Column(
                                                                                          children: [
                                                                                            Text(
                                                                                              // "Background information about yourself to share with your coach or therapist",
                                                                                              AppLocalizations.of(context)!
                                                                                                  .translate('other_text_120')!,
                                                                                              style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 3.t),
                                                                                              textAlign: TextAlign.center,
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 4.h,
                                                                                            ),
                                                                                            Text(
                                                                                              // "This will help us match you with the \nbest counsellor!",
                                                                                               AppLocalizations.of(context)!
                                                                                                  .translate('other_text_121')!,
                                                                                              style: TextStyle(height: 1, fontFamily: FontUtils.montserratMedium, fontSize: 2.t, color: ColorUtils.border),
                                                                                              textAlign: TextAlign.center,
                                                                                            )
                                                                                          ],
                                                                                        )
                                                                                      : model.selectionOfPages == 14
                                                                                          ? Text(
                                                                                              // "How did you hear about us?",
                                                                                              AppLocalizations.of(context)!
                                                                                                  .translate('other_text_118')!,
                                                                                              style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 3.t),
                                                                                              textAlign: TextAlign.center,
                                                                                            )
                                                                                          : model.selectionOfPages == 15
                                                                                              ? Text(
                                                                                                  // "Why is Soulgood better?",
                                                                                                  AppLocalizations.of(context)!
                                                                                                      .translate('other_text_108')!,
                                                                                                  style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 3.t),
                                                                                                  textAlign: TextAlign.center,
                                                                                                )
                                                                                              : model.selectionOfPages == 16
                                                                                                  ? Text(
                                                                                                      "Terms and Conditions",
                                                                                                      // AppLocalizations.of(context)!
                                                                                                      //     .translate('other_text_87')!,
                                                                                                      style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 3.t),
                                                                                                      textAlign: TextAlign.center,
                                                                                                    )
                                                                                                  : model.selectionOfPages == 17
                                                                                                      ? Text(
                                                                                                          "Finding the best \ntherapist for you",
                                                                                                          // AppLocalizations.of(context)!
                                                                                                          //     .translate('other_text_87')!,
                                                                                                          style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 3.t),
                                                                                                          textAlign: TextAlign.center,
                                                                                                        )
                                                                                                      : model.selectionOfPages == 18
                                                                                                          ? Text(
                                                                                                              // "Choose your Therapist",
                                                                                                              AppLocalizations.of(context)!
                                                                                                                  .translate('other_text_101')!,
                                                                                                              style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 3.t),
                                                                                                              textAlign: TextAlign.center,
                                                                                                            )
                                                                                                          : SizedBox(),
                                  model.selectionOfPages == 1
                                      ? /*1*/ SizedBox(
                                          height: 6.h,
                                        )
                                      : model.selectionOfPages == 2
                                          ? SizedBox(
                                              height: 10.h,
                                            )
                                          : model.selectionOfPages == 3
                                              ? SizedBox(
                                                  height: 9.h,
                                                )
                                              : model.selectionOfPages == 4
                                                  ? SizedBox(
                                                      height: 5.h,
                                                    )
                                                  : model.selectionOfPages == 5
                                                      ? SizedBox(
                                                          height: 4.h,
                                                        )
                                                      : model.selectionOfPages ==
                                                              6
                                                          ? SizedBox(
                                                              height: 2.h,
                                                            )
                                                          : model.selectionOfPages ==
                                                                  7
                                                              ? SizedBox(
                                                                  height: 2.h,
                                                                )
                                                              : model.selectionOfPages ==
                                                                      8
                                                                  ? SizedBox(
                                                                      height:
                                                                          2.h,
                                                                    )
                                                                  : model.selectionOfPages ==
                                                                          9
                                                                      ? SizedBox(
                                                                          height:
                                                                              2.h,
                                                                        )
                                                                      : model.selectionOfPages ==
                                                                              10
                                                                          ? SizedBox(
                                                                              height: 4.h,
                                                                            )
                                                                          : model.selectionOfPages == 11
                                                                              ? SizedBox(
                                                                                  height: 10.h,
                                                                                )
                                                                              : model.selectionOfPages == 12
                                                                                  ? SizedBox(
                                                                                      height: 4.h,
                                                                                    )
                                                                                  : model.selectionOfPages == 13
                                                                                      ? SizedBox(
                                                                                          height: 2.h,
                                                                                        )
                                                                                      : model.selectionOfPages == 14
                                                                                          ? SizedBox(
                                                                                              height: 5.h,
                                                                                            )
                                                                                          : model.selectionOfPages == 15
                                                                                              ? SizedBox(
                                                                                                  height: 7.h,
                                                                                                )
                                                                                              : model.selectionOfPages == 16
                                                                                                  ? SizedBox(
                                                                                                      height: 5.h,
                                                                                                    )
                                                                                                  : model.selectionOfPages == 17
                                                                                                      ? SizedBox(
                                                                                                          height: 4.h,
                                                                                                        )
                                                                                                      : model.selectionOfPages == 18
                                                                                                          ? SizedBox(
                                                                                                              height: 3.h,
                                                                                                            )
                                                                                                          : SizedBox(),
                                  model.selectionOfPages == 1
                                      ? /*1*/ Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                model.individualSelect = true;
                                                model.EmployeeSelect = false;
                                                model.notifyListeners();
                                              },
                                              child: Material(
                                                elevation:
                                                    model.individualSelect ==
                                                            true
                                                        ? 10
                                                        : 0,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.w,
                                                      vertical: 2.h),
                                                  decoration: BoxDecoration(
                                                      color: ColorUtils.white,
                                                      border: Border.all(
                                                          color:
                                                              model.individualSelect ==
                                                                      true
                                                                  ? ColorUtils
                                                                      .green
                                                                  : ColorUtils
                                                                      .silver),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Text(
                                                    // "Individual",
                                                    AppLocalizations.of(
                                                            context)!
                                                        .translate(
                                                            'other_text_79')!,
                                                    style: TextStyle(
                                                        fontFamily: FontUtils
                                                            .montserratMedium,
                                                        color:
                                                            model.individualSelect ==
                                                                    true
                                                                ? ColorUtils
                                                                    .green
                                                                : ColorUtils
                                                                    .black,
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
                                                    model.EmployeeSelect == true
                                                        ? 10
                                                        : 0,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 1.h,
                                                      horizontal: 10.w),
                                                  decoration: BoxDecoration(
                                                      color: ColorUtils.white,
                                                      border: Border.all(
                                                          color:
                                                              model.EmployeeSelect ==
                                                                      true
                                                                  ? ColorUtils
                                                                      .green
                                                                  : ColorUtils
                                                                      .silver),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Text(
                                                    // "Employee or \nInsurance Member",
                                                    AppLocalizations.of(
                                                            context)!
                                                        .translate(
                                                            'other_text_80')!,
                                                    style: TextStyle(
                                                        fontFamily: FontUtils
                                                            .montserratMedium,
                                                        fontSize: 2.5.t,
                                                        color:
                                                            model.EmployeeSelect ==
                                                                    true
                                                                ? ColorUtils
                                                                    .green
                                                                : ColorUtils
                                                                    .black,
                                                        height: 0.2.h),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 24.h,
                                            ),
                                          ],
                                        )
                                      : model.selectionOfPages == 2
                                          ? Column(
                                              children: [
                                                Container(
                                                  width: 60.w,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: model.codeFocus
                                                                  .hasFocus
                                                              ? ColorUtils.green
                                                              : ColorUtils
                                                                  .silver),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5.w),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Expanded(
                                                        child: TextField(
                                                          style: TextStyle(
                                                            fontSize: 4.t,
                                                          ),
                                                          focusNode:
                                                              model.codeFocus,
                                                          onTap: () {
                                                            model
                                                                .notifyListeners();
                                                          },
                                                          controller: model
                                                              .codeController,
                                                          decoration:
                                                              InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      'Enter code',
                                                                  // AppLocalizations.of(context)!
                                                                  //     .translate('other_text_82')!,
                                                                  hintStyle: TextStyle(
                                                                      fontSize:
                                                                          2.8.t,
                                                                      color: ColorUtils
                                                                          .black)),
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
                                                  height: 31.h,
                                                ),
                                              ],
                                            )
                                          : model.selectionOfPages == 3
                                              ? Column(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        model.coachingSelect =
                                                            true;
                                                        model.TherapistSelect =
                                                            false;
                                                        // model.notifyListeners();
                                                        setState(() {});
                                                      },
                                                      child: Material(
                                                        elevation:
                                                            model.coachingSelect ==
                                                                    true
                                                                ? 10
                                                                : 0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      20.w,
                                                                  vertical:
                                                                      1.h),
                                                          decoration: BoxDecoration(
                                                              color: ColorUtils
                                                                  .white,
                                                              border: Border.all(
                                                                  color: model.coachingSelect ==
                                                                          true
                                                                      ? ColorUtils
                                                                          .green
                                                                      : ColorUtils
                                                                          .silver),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          child: Text(
                                                            "Coaching",
                                                            // "AppLocalizations.of(context)!
                                                            //     .translate('other_text_84')!",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    FontUtils
                                                                        .montserratMedium,
                                                                color: model.coachingSelect ==
                                                                        true
                                                                    ? ColorUtils
                                                                        .green
                                                                    : ColorUtils
                                                                        .black,
                                                                fontSize: 2.5.t,
                                                                height: 0.2.h),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        model.coachingSelect =
                                                            false;
                                                        model.TherapistSelect =
                                                            true;
                                                        // model.notifyListeners();
                                                        setState(() {});
                                                      },
                                                      child: Material(
                                                        elevation:
                                                            model.TherapistSelect ==
                                                                    true
                                                                ? 10
                                                                : 0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      22.w,
                                                                  vertical:
                                                                      1.h),
                                                          decoration: BoxDecoration(
                                                              color: ColorUtils
                                                                  .white,
                                                              border: Border.all(
                                                                  color: model.TherapistSelect ==
                                                                          true
                                                                      ? ColorUtils
                                                                          .green
                                                                      : ColorUtils
                                                                          .silver),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          child: Text(
                                                            "Therapy",
                                                            // "AppLocalizations.of(context)!
                                                            //     .translate('other_text_84')!",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    FontUtils
                                                                        .montserratMedium,
                                                                color: model.TherapistSelect ==
                                                                        true
                                                                    ? ColorUtils
                                                                        .green
                                                                    : ColorUtils
                                                                        .black,
                                                                fontSize: 2.5.t,
                                                                height: 0.2.h),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30.h,
                                                    ),
                                                  ],
                                                )
                                              : model.selectionOfPages == 4
                                                  ? Column(
                                                      children: [
                                                        Form(
                                                          key: model.formKey,
                                                          child: Column(
                                                              children: [
                                                                // Row(
                                                                //   children: [
                                                                //     Text(
                                                                //       "What’s your name:",
                                                                //       style: TextStyle(
                                                                //           fontSize: 2.t,
                                                                //           fontFamily: FontUtils.montserratMedium,
                                                                //           color: model.nameFocus.hasFocus
                                                                //               ? ColorUtils.purple
                                                                //               : ColorUtils.black),
                                                                //     )
                                                                //   ],
                                                                // ),
                                                                SizedBox(
                                                                  height: 2.h,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              5.w),
                                                                  child:
                                                                      Material(
                                                                    // color: ColorUtils.almond,
                                                                    elevation: model
                                                                            .nameFocus
                                                                            .hasFocus
                                                                        ? 10
                                                                        : 0,
                                                                    shadowColor: ColorUtils
                                                                        .border
                                                                        .withOpacity(
                                                                            0.4),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            24),
                                                                    child:
                                                                        TextFormField(
                                                                      onTap:
                                                                          () {
                                                                        model
                                                                            .notifyListeners();
                                                                      },
                                                                      validator:
                                                                          (text) {
                                                                        if (text ==
                                                                                null ||
                                                                            text.isEmpty) {
                                                                          return 'Please fill this field';
                                                                        }
                                                                        return null;
                                                                      },
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .name,
                                                                      controller:
                                                                          model
                                                                              .name,
                                                                      focusNode:
                                                                          model
                                                                              .nameFocus,
                                                                      style: TextStyle(
                                                                          color: model.nameFocus.hasFocus
                                                                              ? ColorUtils.green
                                                                              : ColorUtils.black),
                                                                      decoration: InputDecoration(
                                                                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide(color: model.nameFocus.hasFocus ? ColorUtils.green : ColorUtils.black)),
                                                                          // errorText: model.validate
                                                                          //     ? "Please fill this field"
                                                                          //     : null,
                                                                          border: OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(24),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: model.nameFocus.hasFocus ? ColorUtils.green : ColorUtils.black,
                                                                            ),
                                                                          ),
                                                                          // InputDecoration(
                                                                          //     focusedBorder: OutlineInputBorder(
                                                                          //         borderRadius: BorderRadius.circular(24),
                                                                          //         borderSide: BorderSide(
                                                                          //           width: 2,
                                                                          //           color: model.nameFocus.hasFocus
                                                                          //               ? ColorUtils.green
                                                                          //               : ColorUtils.black,
                                                                          //         )),
                                                                          //     border: OutlineInputBorder(
                                                                          //       borderRadius: BorderRadius.circular(24),
                                                                          //       borderSide: BorderSide(
                                                                          //           width: 1,
                                                                          //           color: model.nameFocus.hasFocus
                                                                          //               ? ColorUtils.green
                                                                          //               : ColorUtils.black),
                                                                          //     ),
                                                                          hintText: 'Name',
                                                                          //  AppLocalizations.of(context)!
                                                                          //     .translate('other_text_17')!,
                                                                          hintStyle: TextStyle(color: model.nameFocus.hasFocus ? ColorUtils.green : ColorUtils.black),
                                                                          // errorText: model.validate ? "Please fill this field" :  null,
                                                                          prefixIcon: SvgPicture.asset(
                                                                            ImageUtils.name,
                                                                            height:
                                                                                0.1.i,
                                                                            width:
                                                                                0.1,
                                                                            fit:
                                                                                BoxFit.scaleDown,
                                                                            color: model.nameFocus.hasFocus
                                                                                ? ColorUtils.green
                                                                                : ColorUtils.black,
                                                                          )),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 3.h,
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    // Row(
                                                                    //   children: [
                                                                    //     Text(
                                                                    //       "What’s your age:",
                                                                    //       style: TextStyle(
                                                                    //           fontSize: 2.t,
                                                                    //           fontFamily:
                                                                    //               FontUtils.montserratMedium,
                                                                    //           color: model.ageFocus.hasFocus
                                                                    //               ? ColorUtils.purple
                                                                    //               : ColorUtils.black),
                                                                    //     )
                                                                    //   ],
                                                                    // ),
                                                                    SizedBox(
                                                                      height:
                                                                          5.h,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              5.w),
                                                                      child:
                                                                          Material(
                                                                        // color: ColorUtils.almond,
                                                                        elevation: model.ageFocus.hasFocus
                                                                            ? 10
                                                                            : 0,
                                                                        shadowColor: ColorUtils
                                                                            .border
                                                                            .withOpacity(0.4),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                        child:
                                                                            TextFormField(
                                                                          onTap:
                                                                              () {
                                                                            model.notifyListeners();
                                                                          },
                                                                          validator:
                                                                              (text) {
                                                                            if (text == null ||
                                                                                text.isEmpty) {
                                                                              return 'Please fill this field';
                                                                            }
                                                                            return null;
                                                                          },
                                                                          focusNode:
                                                                              model.ageFocus,
                                                                          controller:
                                                                              model.age,
                                                                          style:
                                                                              TextStyle(
                                                                            color: model.ageFocus.hasFocus
                                                                                ? ColorUtils.green
                                                                                : ColorUtils.black,
                                                                          ),
                                                                          decoration:
                                                                              InputDecoration(
                                                                            focusedBorder:
                                                                                OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide(color: model.ageFocus.hasFocus ? ColorUtils.green : ColorUtils.black)),
                                                                            // errorText: model.validate
                                                                            //     ? "Please fill this field"
                                                                            //     : null,
                                                                            border:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(24),
                                                                              borderSide: BorderSide(
                                                                                color: model.ageFocus.hasFocus ? ColorUtils.green : ColorUtils.black,
                                                                              ),
                                                                            ),
                                                                            hintText:
                                                                                'Age',
                                                                            //  AppLocalizations.of(context)!
                                                                            //     .translate('other_text_19')!,
                                                                            hintStyle:
                                                                                TextStyle(color: model.ageFocus.hasFocus ? ColorUtils.green : ColorUtils.black),
                                                                            prefixIcon:
                                                                                SvgPicture.asset(
                                                                              ImageUtils.age,
                                                                              color: model.ageFocus.hasFocus ? ColorUtils.green : ColorUtils.black,
                                                                              height: 5.i,
                                                                              width: 5.i,
                                                                              fit: BoxFit.scaleDown,
                                                                            ),
                                                                            prefixStyle:
                                                                                TextStyle(
                                                                              color: model.ageFocus.hasFocus ? ColorUtils.green : ColorUtils.black,
                                                                            ),
                                                                          ),
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                          inputFormatters: [
                                                                            FilteringTextInputFormatter.digitsOnly,
                                                                            LengthLimitingTextInputFormatter(2)
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          3.h,
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        // Row(
                                                                        //   children: [
                                                                        //     Text(
                                                                        //       "Phone Number:",
                                                                        //       style: TextStyle(
                                                                        //           fontSize: 2.t,
                                                                        //           fontFamily:
                                                                        //               FontUtils.montserratMedium,
                                                                        //           color: model.phoneFocus.hasFocus
                                                                        //               ? ColorUtils.purple
                                                                        //               : ColorUtils.black),
                                                                        //     )
                                                                        //   ],
                                                                        // ),
                                                                        SizedBox(
                                                                          height:
                                                                              5.h,
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.symmetric(horizontal: 5.w),
                                                                          child:
                                                                              Material(
                                                                            // color: ColorUtils.almond,
                                                                            elevation: model.phoneFocus.hasFocus
                                                                                ? 10
                                                                                : 0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(24),
                                                                            shadowColor:
                                                                                ColorUtils.border.withOpacity(0.4),
                                                                            child:
                                                                                TextFormField(
                                                                              onTap: () {
                                                                                model.notifyListeners();
                                                                              },
                                                                              focusNode: model.phoneFocus,
                                                                              controller: model.Phone,
                                                                              style: TextStyle(
                                                                                color: model.phoneFocus.hasFocus ? ColorUtils.green : ColorUtils.black,
                                                                              ),
                                                                              validator: (text) {
                                                                                if (text == null || text.isEmpty) {
                                                                                  return 'Please fill this field';
                                                                                }
                                                                                return null;
                                                                              },
                                                                              decoration: InputDecoration(
                                                                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide(color: model.phoneFocus.hasFocus ? ColorUtils.green : ColorUtils.black)),
                                                                                hintText: 'Phone number',
                                                                                hintStyle: TextStyle(color: model.nameFocus.hasFocus ? ColorUtils.green : ColorUtils.black),
                                                                                // AppLocalizations.of(context)!
                                                                                //     .translate('other_text_20')!,
                                                                                // errorText: model.validate ? "Please fill this field" :  null,

                                                                                border: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(24),
                                                                                  borderSide: BorderSide(
                                                                                    color: model.phoneFocus.hasFocus ? ColorUtils.green : ColorUtils.black,
                                                                                  ),
                                                                                ),
                                                                                prefixIcon: SvgPicture.asset(
                                                                                  ImageUtils.mobile,
                                                                                  color: model.phoneFocus.hasFocus ? ColorUtils.green : ColorUtils.black,
                                                                                  height: 5.i,
                                                                                  fit: BoxFit.scaleDown,
                                                                                ),
                                                                                prefixStyle: TextStyle(
                                                                                  color: model.phoneFocus.hasFocus ? ColorUtils.green : ColorUtils.black,
                                                                                ),
                                                                              ),
                                                                              keyboardType: TextInputType.phone,
                                                                              inputFormatters: [
                                                                                // FilteringTextInputFormatter.digitsOnly,
                                                                                LengthLimitingTextInputFormatter(15)
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ]),
                                                        ),
                                                        SizedBox(
                                                          height: 14.5.h,
                                                        ),
                                                      ],
                                                    )
                                                  : model.selectionOfPages == 5
                                                      ? Column(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                model.selectedGender =
                                                                    1;
                                                                model
                                                                    .notifyListeners();
                                                              },
                                                              child: Material(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24),
                                                                elevation:
                                                                    model.selectedGender ==
                                                                            1
                                                                        ? 10
                                                                        : 0,
                                                                shadowColor:
                                                                    ColorUtils
                                                                        .border
                                                                        .withOpacity(
                                                                            0.4),
                                                                child:
                                                                    Container(
                                                                  width: 50.w,
                                                                  height: 6.h,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: model.selectedGender == 1
                                                                              ? ColorUtils
                                                                                  .green
                                                                              : ColorUtils
                                                                                  .border),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24)),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      // SvgPicture.asset(ImageUtils.male,color: model.selectedGender== 1 ? ColorUtils.purple : ColorUtils.black),
                                                                      // SizedBox(width: 3.w,),
                                                                      Text(
                                                                        AppLocalizations.of(context)!
                                                                            .translate('select_your_gender_text_2')!,
                                                                        style: TextStyle(
                                                                            color: model.selectedGender == 1
                                                                                ? ColorUtils.green
                                                                                : ColorUtils.black,
                                                                            fontFamily: FontUtils.montserratMedium,
                                                                            fontSize: 2.t),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 3.h),
                                                            GestureDetector(
                                                              onTap: () {
                                                                model.selectedGender =
                                                                    2;
                                                                model
                                                                    .notifyListeners();
                                                              },
                                                              child: Material(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24),
                                                                elevation:
                                                                    model.selectedGender ==
                                                                            2
                                                                        ? 10
                                                                        : 0,
                                                                shadowColor:
                                                                    ColorUtils
                                                                        .border
                                                                        .withOpacity(
                                                                            0.4),
                                                                child:
                                                                    Container(
                                                                  width: 50.w,
                                                                  height: 6.h,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: model.selectedGender == 2
                                                                              ? ColorUtils
                                                                                  .green
                                                                              : ColorUtils
                                                                                  .border),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24)),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      // SvgPicture.asset(ImageUtils.female,color: model.selectedGender== 2 ? ColorUtils.purple : ColorUtils.black),
                                                                      // SizedBox(width: 3.w,),
                                                                      Text(
                                                                        AppLocalizations.of(context)!
                                                                            .translate('select_your_gender_text_3')!,
                                                                        style: TextStyle(
                                                                            color: model.selectedGender == 2
                                                                                ? ColorUtils.green
                                                                                : ColorUtils.black,
                                                                            fontFamily: FontUtils.montserratMedium,
                                                                            fontSize: 2.t),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 3.h),
                                                            GestureDetector(
                                                              onTap: () {
                                                                model.selectedGender =
                                                                    3;
                                                                model
                                                                    .notifyListeners();
                                                              },
                                                              child: Material(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24),
                                                                elevation:
                                                                    model.selectedGender ==
                                                                            3
                                                                        ? 10
                                                                        : 0,
                                                                shadowColor:
                                                                    ColorUtils
                                                                        .border
                                                                        .withOpacity(
                                                                            0.4),
                                                                child:
                                                                    Container(
                                                                  width: 50.w,
                                                                  height: 6.h,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: model.selectedGender == 3
                                                                              ? ColorUtils
                                                                                  .green
                                                                              : ColorUtils
                                                                                  .border),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24)),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      // SvgPicture.asset(ImageUtils.binary,color: model.selectedGender== 3 ? ColorUtils.purple : ColorUtils.black),
                                                                      // SizedBox(width: 3.w,),
                                                                      Text(
                                                                        AppLocalizations.of(context)!
                                                                            .translate('select_your_gender_text_4')!,
                                                                        style:
                                                                            TextStyle(
                                                                          color: model.selectedGender == 3
                                                                              ? ColorUtils.green
                                                                              : ColorUtils.black,
                                                                          fontFamily:
                                                                              FontUtils.montserratMedium,
                                                                          fontSize:
                                                                              2.t,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 3.h),
                                                            GestureDetector(
                                                              onTap: () {
                                                                model.selectedGender =
                                                                    4;
                                                                model
                                                                    .notifyListeners();
                                                              },
                                                              child: Material(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24),
                                                                elevation:
                                                                    model.selectedGender ==
                                                                            4
                                                                        ? 10
                                                                        : 0,
                                                                shadowColor:
                                                                    ColorUtils
                                                                        .border
                                                                        .withOpacity(
                                                                            0.4),
                                                                child: Container(
                                                                    width: 50.w,
                                                                    height: 6.h,
                                                                    decoration: BoxDecoration(border: Border.all(color: model.selectedGender == 4 ? ColorUtils.green : ColorUtils.border), borderRadius: BorderRadius.circular(24)),
                                                                    child: Center(
                                                                        child: Text(
                                                                      AppLocalizations.of(
                                                                              context)!
                                                                          .translate(
                                                                              'select_your_gender_text_5')!,
                                                                      style: TextStyle(
                                                                          color: model.selectedGender == 4
                                                                              ? ColorUtils
                                                                                  .green
                                                                              : ColorUtils
                                                                                  .black,
                                                                          fontFamily: FontUtils
                                                                              .montserratMedium,
                                                                          fontSize:
                                                                              2.t),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ))),
                                                              ),
                                                            ),
                                                            // SizedBox(
                                                            //   height: 6.5.h,
                                                            // ),

                                                            SizedBox(
                                                              height: 17.h,
                                                            ),
                                                          ],
                                                        )
                                                      : model.selectionOfPages ==
                                                              6
                                                          ? Column(
                                                              children: [
                                                                Material(
                                                                  elevation: 10,
                                                                  shadowColor:
                                                                      ColorUtils
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.3),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  child:
                                                                      Container(
                                                                    // padding: EdgeInsets.all(20),
                                                                    height: 8.h,
                                                                    // padding:
                                                                    //     EdgeInsets.symmetric(vertical: 2.h),
                                                                    // width: 100.w,
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(
                                                                            color: ColorUtils
                                                                                .green),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        model.dropDownPressed =
                                                                            !model.dropDownPressed;
                                                                        model
                                                                            .notifyListeners();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        padding:
                                                                            EdgeInsets.symmetric(horizontal: 4.w),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              model.selectedDropDownLang.isEmpty ? "Country" : model.selectedDropDownLang,
                                                                              style: TextStyle(color: ColorUtils.green, fontFamily: FontUtils.montserratSemiBold, fontSize: 2.t),
                                                                            ),
                                                                            Icon(Icons.keyboard_arrow_down_outlined)
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.h,
                                                                ),
                                                                model.dropDownPressed ==
                                                                        true
                                                                    ? Container(
                                                                        decoration: BoxDecoration(
                                                                            // boxShadow: [
                                                                            //   BoxShadow(
                                                                            //       color: ColorUtils.greyLight,
                                                                            //       blurRadius: 15,
                                                                            //       blurStyle: BlurStyle.outer)
                                                                            // ],
                                                                            border: Border.all(color: ColorUtils.green),
                                                                            borderRadius: BorderRadius.circular(15)),
                                                                        padding: EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                4.w,
                                                                            vertical: 1.h),
                                                                        child: ListView
                                                                            .separated(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          physics:
                                                                              NeverScrollableScrollPhysics(),
                                                                          shrinkWrap:
                                                                              true,
                                                                          itemCount: model
                                                                              .country
                                                                              .length,
                                                                          separatorBuilder: (context, index) =>
                                                                              SizedBox(height: 1.h),
                                                                          itemBuilder:
                                                                              (context, index) {
                                                                            return ListTile(
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                                                              tileColor: model.selectedDropDownItem == index ? ColorUtils.LightGrey : Colors.transparent,
                                                                              onTap: () {
                                                                                model.selectedDropDownItem = index;
                                                                                model.selectedDropDownLang = model.country[index]['name'];
                                                                                model.dropDownPressed = !model.dropDownPressed;

                                                                                model.notifyListeners();
                                                                              },
                                                                              minVerticalPadding: 0,
                                                                              title: Text(model.country[index]['name']),
                                                                            );
                                                                          },
                                                                        ),
                                                                      )
                                                                    : SizedBox(),
                                                                SizedBox(
                                                                  height: 2.h,
                                                                ),
                                                                Material(
                                                                  elevation: 10,
                                                                  shadowColor:
                                                                      ColorUtils
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.3),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  child:
                                                                      Container(
                                                                    // padding: EdgeInsets.all(20),
                                                                    height: 8.h,
                                                                    // padding:
                                                                    //     EdgeInsets.symmetric(vertical: 2.h),
                                                                    // width: 100.w,
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(
                                                                            color: ColorUtils
                                                                                .green),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        model.languageDropDownPressed =
                                                                            !model.languageDropDownPressed;
                                                                        model
                                                                            .notifyListeners();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        padding:
                                                                            EdgeInsets.symmetric(horizontal: 4.w),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              model.yourLanguage.isEmpty ? "Language" : model.yourLanguage,
                                                                              style: TextStyle(color: ColorUtils.green, fontFamily: FontUtils.montserratSemiBold, fontSize: 2.t),
                                                                            ),
                                                                            Icon(Icons.keyboard_arrow_down_outlined)
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.h,
                                                                ),
                                                                model.languageDropDownPressed ==
                                                                        true
                                                                    ? Container(
                                                                        decoration: BoxDecoration(
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                color: ColorUtils.greyLight,
                                                                                blurStyle: BlurStyle.outer,
                                                                                blurRadius: 15,
                                                                              )
                                                                            ],
                                                                            border:
                                                                                Border.all(color: ColorUtils.green),
                                                                            borderRadius: BorderRadius.circular(15)),
                                                                        padding: EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                4.w,
                                                                            vertical: 1.h),
                                                                        child: ListView
                                                                            .separated(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          physics:
                                                                              NeverScrollableScrollPhysics(),
                                                                          shrinkWrap:
                                                                              true,
                                                                          itemCount: model
                                                                              .language
                                                                              .length,
                                                                          separatorBuilder: (context, index) =>
                                                                              SizedBox(height: 1.h),
                                                                          itemBuilder:
                                                                              (context, index) {
                                                                            return ListTile(
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                                                              tileColor: model.selectedDropDownLanguage == index ? ColorUtils.LightGrey : Colors.transparent,
                                                                              onTap: () {
                                                                                model.selectedDropDownLanguage = index;
                                                                                model.yourLanguage = model.language[index]['name'];
                                                                                model.languageDropDownPressed = !model.languageDropDownPressed;

                                                                                model.notifyListeners();
                                                                              },
                                                                              minVerticalPadding: 0,
                                                                              title: Text(model.language[index]['name']),
                                                                            );
                                                                          },
                                                                        ),
                                                                      )
                                                                    : SizedBox(),
                                                                model.languageDropDownPressed ==
                                                                            true ||
                                                                        model.dropDownPressed ==
                                                                            true
                                                                    ? SizedBox(
                                                                        height:
                                                                            2.h,
                                                                      )
                                                                    : SizedBox(
                                                                        height:
                                                                            30.h,
                                                                      )
                                                              ],
                                                            )
                                                          : model.selectionOfPages ==
                                                                  7
                                                              ? Column(
                                                                  children: [
                                                                    Material(
                                                                      elevation:
                                                                          10,
                                                                      shadowColor: ColorUtils
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.3),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      child:
                                                                          Container(
                                                                        // padding: EdgeInsets.all(20),
                                                                        height:
                                                                            8.h,
                                                                        // padding:
                                                                        //     EdgeInsets.symmetric(vertical: 2.h),
                                                                        // width: 100.w,
                                                                        decoration: BoxDecoration(
                                                                            border:
                                                                                Border.all(color: ColorUtils.green),
                                                                            borderRadius: BorderRadius.circular(10)),
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            model.dropDownOfBringsYou =
                                                                                !model.dropDownOfBringsYou;
                                                                            model.notifyListeners();
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            padding:
                                                                                EdgeInsets.symmetric(horizontal: 4.w),
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: 70.w,
                                                                                  child: Text(
                                                                                    model.selectedNameofBring.isEmpty
                                                                                        ? 
                                                                                        // "Select one or multiple"
                                                                                        AppLocalizations.of(context)!
                                                                                            .translate('other_text_119')!
                                                                                        : model.selectedNameofBring.toString().replaceAll("[", "").replaceAll("]", ""),
                                                                                    style: TextStyle(color: ColorUtils.green, fontFamily: FontUtils.montserratSemiBold, fontSize: 2.t),
                                                                                    softWrap: true,
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                  ),
                                                                                ),
                                                                                Icon(Icons.keyboard_arrow_down_outlined)
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          2.h,
                                                                    ),
                                                                    model.dropDownOfBringsYou ==
                                                                            true
                                                                        ? Container(
                                                                            decoration: BoxDecoration(
                                                                                // boxShadow: [
                                                                                //   BoxShadow(
                                                                                //       color: ColorUtils.greyLight,
                                                                                //       blurRadius: 15,
                                                                                //       blurStyle: BlurStyle.outer)
                                                                                // ],
                                                                                border: Border.all(color: ColorUtils.green),
                                                                                borderRadius: BorderRadius.circular(15)),
                                                                            padding:
                                                                                EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                                                                            child:
                                                                                ListView.separated(
                                                                              padding: EdgeInsets.zero,
                                                                              physics: NeverScrollableScrollPhysics(),
                                                                              shrinkWrap: true,
                                                                              itemCount: model.brignsYou.length,
                                                                              separatorBuilder: (context, index) => SizedBox(height: 1.h),
                                                                              itemBuilder: (context, index) {
                                                                                return ListTile(
                                                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                                                                  tileColor:
                                                                                      // model.selectedDropDownItemWhatYouBring ==
                                                                                      //         index
                                                                                      model.selectedNameofBring.contains(model.brignsYou[index]['name']) ? ColorUtils.LightGrey : Colors.transparent,
                                                                                  onTap: () {
                                                                                    model.selectedDropDownItemWhatYouBring = index;

                                                                                    model.selectedNameofBring.contains(model.brignsYou[index]['name']) ? model.selectedNameofBring.remove(model.brignsYou[index]['name']) : model.selectedNameofBring.add(model.brignsYou[index]['name']);
                                                                                    // model.selectedDropDownLang =
                                                                                    //     model.brignsYou[index]
                                                                                    //         ['name'];
                                                                                    // model.dropDownPressed =
                                                                                    //     !model.dropDownPressed;

                                                                                    model.notifyListeners();
                                                                                  },
                                                                                  minVerticalPadding: 0,
                                                                                  title: Text(model.brignsYou[index]['name']),
                                                                                );
                                                                              },
                                                                            ),
                                                                          )
                                                                        : SizedBox(),
                                                                    model.dropDownOfBringsYou ==
                                                                            true
                                                                        ? SizedBox(
                                                                            height:
                                                                                4.h,
                                                                          )
                                                                        : SizedBox(
                                                                            height:
                                                                                42.h,
                                                                          ),
                                                                  ],
                                                                )
                                                              : model.selectionOfPages ==
                                                                      8
                                                                  ? Column(
                                                                      children: [
                                                                        Material(
                                                                          elevation:
                                                                              10,
                                                                          shadowColor: ColorUtils
                                                                              .grey
                                                                              .withOpacity(0.3),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          child:
                                                                              Container(
                                                                            // padding: EdgeInsets.all(20),
                                                                            height:
                                                                                8.h,
                                                                            // padding:
                                                                            //     EdgeInsets.symmetric(vertical: 2.h),
                                                                            // width: 100.w,
                                                                            decoration:
                                                                                BoxDecoration(border: Border.all(color: ColorUtils.green), borderRadius: BorderRadius.circular(10)),
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () {
                                                                                model.dropDownOfDescribtionForTherapist = !model.dropDownOfDescribtionForTherapist;
                                                                                model.notifyListeners();
                                                                              },
                                                                              child: Container(
                                                                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      width: 70.w,
                                                                                      child: Text(
                                                                                        model.selectedNameofDescribe.isEmpty
                                                                                            ? 
                                                                                            // "Select one or multiple"
                                                                                            AppLocalizations.of(context)!
                                                                                                .translate('other_text_119')!
                                                                                            : model.selectedNameofDescribe.toString().replaceAll("[", "").replaceAll("]", ""),
                                                                                        style: TextStyle(color: ColorUtils.green, fontFamily: FontUtils.montserratSemiBold, fontSize: 2.t),
                                                                                        softWrap: true,
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                      ),
                                                                                    ),
                                                                                    Icon(Icons.keyboard_arrow_down_outlined)
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              2.h,
                                                                        ),
                                                                        model.dropDownOfDescribtionForTherapist ==
                                                                                true
                                                                            ? Container(
                                                                                decoration: BoxDecoration(
                                                                                    // boxShadow: [
                                                                                    //   BoxShadow(
                                                                                    //       color: ColorUtils.greyLight,
                                                                                    //       blurRadius: 15,
                                                                                    //       blurStyle: BlurStyle.outer)
                                                                                    // ],
                                                                                    border: Border.all(color: ColorUtils.green),
                                                                                    borderRadius: BorderRadius.circular(15)),
                                                                                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                                                                                child: ListView.separated(
                                                                                  padding: EdgeInsets.zero,
                                                                                  physics: NeverScrollableScrollPhysics(),
                                                                                  shrinkWrap: true,
                                                                                  itemCount: model.bestDescribtionForTherapist.length,
                                                                                  separatorBuilder: (context, index) => SizedBox(height: 1.h),
                                                                                  itemBuilder: (context, index) {
                                                                                    return ListTile(
                                                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                                                                      tileColor:
                                                                                          // model.selectedDropDownItemWhatYouBring ==
                                                                                          //         index
                                                                                          model.selectedNameofDescribe.contains(model.bestDescribtionForTherapist[index]['name']) ? ColorUtils.LightGrey : Colors.transparent,
                                                                                      onTap: () {
                                                                                        model.selectedDropDownItemWhatYouBring = index;

                                                                                        model.selectedNameofDescribe.contains(model.bestDescribtionForTherapist[index]['name']) ? model.selectedNameofDescribe.remove(model.bestDescribtionForTherapist[index]['name']) : model.selectedNameofDescribe.add(model.bestDescribtionForTherapist[index]['name']);
                                                                                        // model.selectedDropDownLang =
                                                                                        //     model.brignsYou[index]
                                                                                        //         ['name'];
                                                                                        // model.dropDownPressed =
                                                                                        //     !model.dropDownPressed;

                                                                                        model.notifyListeners();
                                                                                      },
                                                                                      minVerticalPadding: 0,
                                                                                      title: Text(model.bestDescribtionForTherapist[index]['name']),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              )
                                                                            : SizedBox(),
                                                                        model.dropDownOfDescribtionForTherapist ==
                                                                                true
                                                                            ? SizedBox(
                                                                                height: 4.h,
                                                                              )
                                                                            : SizedBox(
                                                                                height: 35.h,
                                                                              ),
                                                                      ],
                                                                    )
                                                                  : model.selectionOfPages ==
                                                                          9
                                                                      ? Column(
                                                                          children: [
                                                                            Material(
                                                                              elevation: 10,
                                                                              shadowColor: ColorUtils.grey.withOpacity(0.3),
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              child: Container(
                                                                                // padding: EdgeInsets.all(20),
                                                                                height: 8.h,
                                                                                // padding:
                                                                                //     EdgeInsets.symmetric(vertical: 2.h),
                                                                                // width: 100.w,
                                                                                decoration: BoxDecoration(border: Border.all(color: ColorUtils.green), borderRadius: BorderRadius.circular(10)),
                                                                                child: InkWell(
                                                                                  onTap: () {
                                                                                    model.dropDownOfAnythingElse = !model.dropDownOfAnythingElse;
                                                                                    model.notifyListeners();
                                                                                  },
                                                                                  child: Container(
                                                                                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 70.w,
                                                                                          child: Text(
                                                                                            model.selectedNameofAnythingElse.isEmpty
                                                                                                ? 
                                                                                                //"Select one or multiple"
                                                                                                 AppLocalizations.of(context)!
                                                                                                                        .translate('other_text_119')!
                                                                                                : model.selectedNameofAnythingElse.toString().replaceAll("[", "").replaceAll("]", ""),
                                                                                            style: TextStyle(color: ColorUtils.green, fontFamily: FontUtils.montserratSemiBold, fontSize: 2.t),
                                                                                            softWrap: true,
                                                                                            overflow: TextOverflow.ellipsis,
                                                                                          ),
                                                                                        ),
                                                                                        Icon(Icons.keyboard_arrow_down_outlined)
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 2.h,
                                                                            ),
                                                                            model.dropDownOfAnythingElse == true
                                                                                ? Container(
                                                                                    decoration: BoxDecoration(
                                                                                        // boxShadow: [
                                                                                        //   BoxShadow(
                                                                                        //       color: ColorUtils.greyLight,
                                                                                        //       blurRadius: 15,
                                                                                        //       blurStyle: BlurStyle.outer)
                                                                                        // ],
                                                                                        border: Border.all(color: ColorUtils.green),
                                                                                        borderRadius: BorderRadius.circular(15)),
                                                                                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                                                                                    child: ListView.separated(
                                                                                      padding: EdgeInsets.zero,
                                                                                      physics: NeverScrollableScrollPhysics(),
                                                                                      shrinkWrap: true,
                                                                                      itemCount: model.anythingElse.length,
                                                                                      separatorBuilder: (context, index) => SizedBox(height: 1.h),
                                                                                      itemBuilder: (context, index) {
                                                                                        return ListTile(
                                                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                                                                          tileColor:
                                                                                              // model.selectedDropDownItemWhatYouBring ==
                                                                                              //         index
                                                                                              model.selectedNameofAnythingElse.contains(model.anythingElse[index]['name']) ? ColorUtils.LightGrey : Colors.transparent,
                                                                                          onTap: () {
                                                                                            model.selectedDropDownItemAnythingElse = index;

                                                                                            model.selectedNameofAnythingElse.contains(model.anythingElse[index]['name']) ? model.selectedNameofAnythingElse.remove(model.anythingElse[index]['name']) : model.selectedNameofAnythingElse.add(model.anythingElse[index]['name']);
                                                                                            // model.selectedDropDownLang =
                                                                                            //     model.brignsYou[index]
                                                                                            //         ['name'];
                                                                                            // model.dropDownPressed =
                                                                                            //     !model.dropDownPressed;

                                                                                            model.notifyListeners();
                                                                                          },
                                                                                          minVerticalPadding: 0,
                                                                                          title: Text(model.anythingElse[index]['name']),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  )
                                                                                : SizedBox(),
                                                                            model.dropDownOfAnythingElse == true
                                                                                ? SizedBox(
                                                                                    height: 4.h,
                                                                                  )
                                                                                : SizedBox(
                                                                                    height: 42.h,
                                                                                  ),
                                                                          ],
                                                                        )
                                                                      : model.selectionOfPages ==
                                                                              10
                                                                          ? Column(
                                                                              children: [
                                                                                GestureDetector(
                                                                                  onTap: () {
                                                                                    setState(() {
                                                                                      model.selectedCounsellor = 1;
                                                                                    });
                                                                                  },
                                                                                  child: Material(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    elevation: model.selectedCounsellor == 1 ? 10 : 0,
                                                                                    shadowColor: ColorUtils.border.withOpacity(0.4),
                                                                                    child: Container(
                                                                                      width: 50.w,
                                                                                      height: 6.h,
                                                                                      decoration: BoxDecoration(border: Border.all(color: model.selectedCounsellor == 1 ? ColorUtils.green : ColorUtils.border), borderRadius: BorderRadius.circular(15)),
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          // SvgPicture.asset(ImageUtils.male,color: model.selectedCounsellor== 1 ? ColorUtils.purple : ColorUtils.black),
                                                                                          // SizedBox(width: 3.w,),
                                                                                          Text(
                                                                                            AppLocalizations.of(context)!.translate('select_your_gender_text_2')!,
                                                                                            style: TextStyle(color: model.selectedCounsellor == 1 ? ColorUtils.green : ColorUtils.black, fontFamily: FontUtils.montserratMedium, fontSize: 2.t),
                                                                                            textAlign: TextAlign.center,
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(height: 4.h),
                                                                                GestureDetector(
                                                                                  onTap: () {
                                                                                    setState(() {
                                                                                      model.selectedCounsellor = 2;
                                                                                    });
                                                                                  },
                                                                                  child: Material(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    elevation: model.selectedCounsellor == 2 ? 10 : 0,
                                                                                    shadowColor: ColorUtils.border.withOpacity(0.4),
                                                                                    child: Container(
                                                                                      width: 50.w,
                                                                                      height: 6.h,
                                                                                      decoration: BoxDecoration(border: Border.all(color: model.selectedCounsellor == 2 ? ColorUtils.green : ColorUtils.border), borderRadius: BorderRadius.circular(15)),
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          // SvgPicture.asset(ImageUtils.female,color: model.selectedCounsellor== 2 ? ColorUtils.purple : ColorUtils.black),
                                                                                          // SizedBox(width: 3.w,),
                                                                                          Text(
                                                                                            AppLocalizations.of(context)!.translate('select_your_gender_text_3')!,
                                                                                            style: TextStyle(color: model.selectedCounsellor == 2 ? ColorUtils.green : ColorUtils.black, fontFamily: FontUtils.montserratMedium, fontSize: 2.t),
                                                                                            textAlign: TextAlign.center,
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(height: 4.h),
                                                                                GestureDetector(
                                                                                  onTap: () {
                                                                                    model.selectedCounsellor = 3;
                                                                                    model.notifyListeners();
                                                                                  },
                                                                                  child: Material(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    elevation: model.selectedCounsellor == 3 ? 10 : 0,
                                                                                    shadowColor: ColorUtils.border.withOpacity(0.4),
                                                                                    child: Container(
                                                                                        width: 50.w,
                                                                                        height: 6.h,
                                                                                        decoration: BoxDecoration(border: Border.all(color: model.selectedCounsellor == 3 ? ColorUtils.green : ColorUtils.border), borderRadius: BorderRadius.circular(15)),
                                                                                        child: Center(
                                                                                            child: Text(
                                                                                          AppLocalizations.of(context)!.translate('counsellor_lang_text_2')!,
                                                                                          style: TextStyle(color: model.selectedCounsellor == 3 ? ColorUtils.green : ColorUtils.black, fontFamily: FontUtils.montserratMedium, fontSize: 2.t),
                                                                                          textAlign: TextAlign.center,
                                                                                        ))),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(height: 21.h)
                                                                              ],
                                                                            )
                                                                          : model.selectionOfPages == 11
                                                                              ? Column(
                                                                                  children: [
                                                                                    GestureDetector(
                                                                                      onTap: () {
                                                                                        model.hadTherapistOrCoach = 1;
                                                                                        model.notifyListeners();
                                                                                      },
                                                                                      child: Material(
                                                                                        borderRadius: BorderRadius.circular(15),
                                                                                        elevation: model.hadTherapistOrCoach == 1 ? 10 : 0,
                                                                                        shadowColor: ColorUtils.border.withOpacity(0.4),
                                                                                        child: Container(
                                                                                          width: 50.w,
                                                                                          height: 6.h,
                                                                                          decoration: BoxDecoration(border: Border.all(color: model.hadTherapistOrCoach == 1 ? ColorUtils.green : ColorUtils.border), borderRadius: BorderRadius.circular(15)),
                                                                                          child: Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Text(
                                                                                                AppLocalizations.of(context)!.translate('other_text_23')!,
                                                                                                style: TextStyle(color: model.hadTherapistOrCoach == 1 ? ColorUtils.green : ColorUtils.black, fontFamily: FontUtils.montserratMedium, fontSize: 2.t),
                                                                                                textAlign: TextAlign.center,
                                                                                              )
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(height: 5.h),
                                                                                    GestureDetector(
                                                                                      onTap: () {
                                                                                        model.hadTherapistOrCoach = 2;
                                                                                        model.notifyListeners();
                                                                                      },
                                                                                      child: Material(
                                                                                        borderRadius: BorderRadius.circular(15),
                                                                                        shadowColor: ColorUtils.border.withOpacity(0.4),
                                                                                        elevation: model.hadTherapistOrCoach == 2 ? 10 : 0,
                                                                                        child: Container(
                                                                                          width: 50.w,
                                                                                          height: 6.h,
                                                                                          decoration: BoxDecoration(border: Border.all(color: model.hadTherapistOrCoach == 2 ? ColorUtils.green : ColorUtils.border), borderRadius: BorderRadius.circular(15)),
                                                                                          child: Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Text(
                                                                                                AppLocalizations.of(context)!.translate('other_text_24')!,
                                                                                                style: TextStyle(color: model.hadTherapistOrCoach == 2 ? ColorUtils.green : ColorUtils.black, fontFamily: FontUtils.montserratMedium, fontSize: 2.t),
                                                                                                textAlign: TextAlign.center,
                                                                                              )
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(height: 28.h)
                                                                                  ],
                                                                                )
                                                                              : model.selectionOfPages == 12
                                                                                  ? Column(
                                                                                      children: [
                                                                                        GestureDetector(
                                                                                          onTap: () {
                                                                                            model.selectedSuicidal = 1;
                                                                                            model.selectedSuicidalIdea = true;
                                                                                            model.selectedSuicidalHelp = false;
                                                                                            model.notifyListeners();
                                                                                          },
                                                                                          child: Material(
                                                                                            borderRadius: BorderRadius.circular(15),
                                                                                            elevation: model.selectedSuicidal == 1 ? 10 : 0,
                                                                                            shadowColor: ColorUtils.border.withOpacity(0.4),
                                                                                            child: Container(
                                                                                              width: 50.w,
                                                                                              height: 6.h,
                                                                                              decoration: BoxDecoration(border: Border.all(color: model.selectedSuicidal == 1 ? ColorUtils.green : ColorUtils.border), borderRadius: BorderRadius.circular(15)),
                                                                                              child: Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    AppLocalizations.of(context)!.translate('other_text_23')!,
                                                                                                    style: TextStyle(color: model.selectedSuicidal == 1 ? ColorUtils.green : ColorUtils.black, fontFamily: FontUtils.montserratMedium, fontSize: 2.t),
                                                                                                    textAlign: TextAlign.center,
                                                                                                  )
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(height: 4.h),
                                                                                        GestureDetector(
                                                                                          onTap: () {
                                                                                            model.selectedSuicidal = 2;
                                                                                            model.selectedSuicidalIdea = false;
                                                                                            model.selectedSuicidalHelp = true;
                                                                                            model.notifyListeners();
                                                                                          },
                                                                                          child: Material(
                                                                                            borderRadius: BorderRadius.circular(15),
                                                                                            shadowColor: ColorUtils.border.withOpacity(0.4),
                                                                                            elevation: model.selectedSuicidal == 2 ? 10 : 0,
                                                                                            child: Container(
                                                                                              width: 50.w,
                                                                                              height: 6.h,
                                                                                              decoration: BoxDecoration(border: Border.all(color: model.selectedSuicidal == 2 ? ColorUtils.green : ColorUtils.border), borderRadius: BorderRadius.circular(15)),
                                                                                              child: Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    AppLocalizations.of(context)!.translate('other_text_24')!,
                                                                                                    style: TextStyle(color: model.selectedSuicidal == 2 ? ColorUtils.green : ColorUtils.black, fontFamily: FontUtils.montserratMedium, fontSize: 2.t),
                                                                                                    textAlign: TextAlign.center,
                                                                                                  )
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(height: 25.h)
                                                                                      ],
                                                                                    )
                                                                                  : model.selectionOfPages == 13
                                                                                      ? Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                                                                                              // width: 100.w,
                                                                                              // padding: EdgeInsets.symmetric(horizontal: 10.w),
                                                                                              height: 24.h,
                                                                                              decoration: BoxDecoration(color: ColorUtils.white, border: Border.all(color: ColorUtils.border), borderRadius: BorderRadius.circular(15)),
                                                                                              child: TextField(
                                                                                                controller: model.tellUsMore,
                                                                                                maxLines: 10,
                                                                                                style: TextStyle(color: ColorUtils.green),
                                                                                                decoration: InputDecoration(
                                                                                                    // hintText: AppLocalizations.of(context)!.translate('tell_us_more_text_3')!,
                                                                                                    hintStyle: TextStyle(color: ColorUtils.border),
                                                                                                    border: OutlineInputBorder(
                                                                                                      borderSide: BorderSide.none,
                                                                                                    )),
                                                                                              ),
                                                                                            ),
                                                                                            SizedBox(height: 20.h)
                                                                                          ],
                                                                                        )
                                                                                      : model.selectionOfPages == 14
                                                                                          ? Column(
                                                                                              children: [
                                                                                                Material(
                                                                                                  elevation: 10,
                                                                                                  shadowColor: ColorUtils.grey.withOpacity(0.3),
                                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                                  child: Container(
                                                                                                    // padding: EdgeInsets.all(20),
                                                                                                    height: 8.h,
                                                                                                    // padding:
                                                                                                    //     EdgeInsets.symmetric(vertical: 2.h),
                                                                                                    // width: 100.w,
                                                                                                    decoration: BoxDecoration(border: Border.all(color: ColorUtils.green), borderRadius: BorderRadius.circular(10)),
                                                                                                    child: InkWell(
                                                                                                      onTap: () {
                                                                                                        model.dropDownOfHowDidYouHearAboutUs = !model.dropDownOfHowDidYouHearAboutUs;
                                                                                                        model.notifyListeners();
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                                                                                                        child: Row(
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            SizedBox(
                                                                                                              width: 70.w,
                                                                                                              child: Text(
                                                                                                                model.selectedNameofHowDidYouHear.isEmpty
                                                                                                                    ? 
                                                                                                                    //"Select one or multiple"
                                                                                                                    AppLocalizations.of(context)!
                                                                                                                        .translate('other_text_119')!
                                                                                                                    : model.selectedNameofHowDidYouHear.toString().replaceAll("[", "").replaceAll("]", ""),
                                                                                                                style: TextStyle(color: ColorUtils.green, fontFamily: FontUtils.montserratSemiBold, fontSize: 2.t),
                                                                                                                softWrap: true,
                                                                                                                overflow: TextOverflow.ellipsis,
                                                                                                              ),
                                                                                                            ),
                                                                                                            Icon(Icons.keyboard_arrow_down_outlined)
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  height: 2.h,
                                                                                                ),
                                                                                                model.dropDownOfHowDidYouHearAboutUs == true
                                                                                                    ? Container(
                                                                                                        decoration: BoxDecoration(
                                                                                                            // boxShadow: [
                                                                                                            //   BoxShadow(
                                                                                                            //       color: ColorUtils.greyLight,
                                                                                                            //       blurRadius: 15,
                                                                                                            //       blurStyle: BlurStyle.outer)
                                                                                                            // ],
                                                                                                            border: Border.all(color: ColorUtils.green),
                                                                                                            borderRadius: BorderRadius.circular(15)),
                                                                                                        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                                                                                                        child: ListView.separated(
                                                                                                          padding: EdgeInsets.zero,
                                                                                                          physics: NeverScrollableScrollPhysics(),
                                                                                                          shrinkWrap: true,
                                                                                                          itemCount: model.howDidYouHear.length,
                                                                                                          separatorBuilder: (context, index) => SizedBox(height: 1.h),
                                                                                                          itemBuilder: (context, index) {
                                                                                                            return ListTile(
                                                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                                                                                              tileColor:
                                                                                                                  // model.selectedDropDownItemWhatYouBring ==
                                                                                                                  //         index
                                                                                                                  model.selectedNameofHowDidYouHear.contains(model.howDidYouHear[index]['name']) ? ColorUtils.LightGrey : Colors.transparent,
                                                                                                              onTap: () {
                                                                                                                model.selectedDropDownItemHowDidYouhear = index;

                                                                                                                model.selectedNameofHowDidYouHear.contains(model.howDidYouHear[index]['name']) ? model.selectedNameofHowDidYouHear.remove(model.howDidYouHear[index]['name']) : model.selectedNameofHowDidYouHear.add(model.howDidYouHear[index]['name']);
                                                                                                                // model.selectedDropDownLang =
                                                                                                                //     model.brignsYou[index]
                                                                                                                //         ['name'];
                                                                                                                // model.dropDownPressed =
                                                                                                                //     !model.dropDownPressed;

                                                                                                                model.notifyListeners();
                                                                                                              },
                                                                                                              minVerticalPadding: 0,
                                                                                                              title: Text(model.howDidYouHear[index]['name']),
                                                                                                            );
                                                                                                          },
                                                                                                        ),
                                                                                                      )
                                                                                                    : SizedBox(),
                                                                                                model.dropDownOfHowDidYouHearAboutUs == true
                                                                                                    ? SizedBox(
                                                                                                        height: 3.h,
                                                                                                      )
                                                                                                    : SizedBox(
                                                                                                        height: 45.5.h,
                                                                                                      ),
                                                                                              ],
                                                                                            )
                                                                                          : model.selectionOfPages == 15
                                                                                              ? Column(
                                                                                                  children: [
                                                                                                    Container(
                                                                                                        // margin: EdgeInsets.symmetric(horizontal: 4.w),
                                                                                                        // width: 100.w,
                                                                                                        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                                                                                                        // height: 24.h,
                                                                                                        decoration: BoxDecoration(color: ColorUtils.white, border: Border.all(color: ColorUtils.border), borderRadius: BorderRadius.circular(15)),
                                                                                                        child: Column(
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  "Soulgood",
                                                                                                                  style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 1.8.t),
                                                                                                                ),
                                                                                                                SizedBox(
                                                                                                                  width: 2.w,
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  "Others",
                                                                                                                  style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 1.8.t),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            SizedBox(
                                                                                                              height: 1.h,
                                                                                                            ),
                                                                                                            Row(
                                                                                                              children: [
                                                                                                                SizedBox(
                                                                                                                  width: 50.w,
                                                                                                                  child: Text(
                                                                                                                    // "Online video \ncounselling anytime, anywhere",
                                                                                                                    AppLocalizations.of(context)!.translate('other_text_109')!,
                                                                                                                    style: TextStyle(height: 0.2.h, fontFamily: FontUtils.montserratMedium, fontSize: 2.t),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                SizedBox(
                                                                                                                  width: 10.w,
                                                                                                                ),
                                                                                                                SvgPicture.asset(ImageUtils.tick),
                                                                                                                SizedBox(
                                                                                                                  width: 11.w,
                                                                                                                ),
                                                                                                                SvgPicture.asset(ImageUtils.cross),
                                                                                                              ],
                                                                                                            ),
                                                                                                            SizedBox(
                                                                                                              height: 3.h,
                                                                                                            ),
                                                                                                            Row(
                                                                                                              children: [
                                                                                                                SizedBox(
                                                                                                                  width: 50.w,
                                                                                                                  child: Text(
                                                                                                                    // "Unlimited text \nmessaging with Coach / Therapist ",
                                                                                                                    AppLocalizations.of(context)!.translate('other_text_110')!,
                                                                                                                    style: TextStyle(height: 0.2.h, fontFamily: FontUtils.montserratMedium, fontSize: 2.t),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                SizedBox(
                                                                                                                  width: 10.w,
                                                                                                                ),
                                                                                                                SvgPicture.asset(ImageUtils.tick),
                                                                                                                SizedBox(
                                                                                                                  width: 11.w,
                                                                                                                ),
                                                                                                                SvgPicture.asset(ImageUtils.cross),
                                                                                                              ],
                                                                                                            ),
                                                                                                            SizedBox(
                                                                                                              height: 3.h,
                                                                                                            ),
                                                                                                            Row(
                                                                                                              children: [
                                                                                                                SizedBox(
                                                                                                                  width: 50.w,
                                                                                                                  child: Text(
                                                                                                                    // "Easy and flexible \nbooking as early as 1 \nday",
                                                                                                                    AppLocalizations.of(context)!.translate('other_text_111')!,
                                                                                                                    style: TextStyle(height: 0.2.h, fontFamily: FontUtils.montserratMedium, fontSize: 2.t),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                SizedBox(
                                                                                                                  width: 10.w,
                                                                                                                ),
                                                                                                                SvgPicture.asset(ImageUtils.tick),
                                                                                                                SizedBox(
                                                                                                                  width: 11.w,
                                                                                                                ),
                                                                                                                SvgPicture.asset(ImageUtils.cross),
                                                                                                              ],
                                                                                                            ),
                                                                                                            SizedBox(
                                                                                                              height: 3.h,
                                                                                                            ),
                                                                                                            Row(
                                                                                                              children: [
                                                                                                                SizedBox(
                                                                                                                  width: 50.w,
                                                                                                                  child: Text(
                                                                                                                    // "Accessible, Convenient, Saves time",
                                                                                                                    AppLocalizations.of(context)!.translate('other_text_112')!,
                                                                                                                    style: TextStyle(height: 0.2.h, fontFamily: FontUtils.montserratMedium, fontSize: 2.t),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                SizedBox(
                                                                                                                  width: 10.w,
                                                                                                                ),
                                                                                                                SvgPicture.asset(ImageUtils.tick),
                                                                                                                SizedBox(
                                                                                                                  width: 11.w,
                                                                                                                ),
                                                                                                                SvgPicture.asset(ImageUtils.cross),
                                                                                                              ],
                                                                                                            ),
                                                                                                            SizedBox(
                                                                                                              height: 3.h,
                                                                                                            ),
                                                                                                            Row(
                                                                                                              children: [
                                                                                                                SizedBox(
                                                                                                                  width: 50.w,
                                                                                                                  child: Text(
                                                                                                                    // "Largest network of qualified Coaches and Therapists ",
                                                                                                                    AppLocalizations.of(context)!.translate('other_text_113')!,
                                                                                                                    style: TextStyle(height: 0.2.h, fontFamily: FontUtils.montserratMedium, fontSize: 2.t),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                SizedBox(
                                                                                                                  width: 10.w,
                                                                                                                ),
                                                                                                                SvgPicture.asset(ImageUtils.tick),
                                                                                                                SizedBox(
                                                                                                                  width: 11.w,
                                                                                                                ),
                                                                                                                SvgPicture.asset(ImageUtils.cross),
                                                                                                              ],
                                                                                                            ),
                                                                                                            SizedBox(
                                                                                                              height: 3.h,
                                                                                                            ),
                                                                                                            Row(
                                                                                                              children: [
                                                                                                                SizedBox(
                                                                                                                  width: 50.w,
                                                                                                                  child: Text(
                                                                                                                    // "Easy to switch \nTherapists",
                                                                                                                    AppLocalizations.of(context)!.translate('other_text_114')!,
                                                                                                                    style: TextStyle(height: 0.2.h, fontFamily: FontUtils.montserratMedium, fontSize: 2.t),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                SizedBox(
                                                                                                                  width: 10.w,
                                                                                                                ),
                                                                                                                SvgPicture.asset(ImageUtils.tick),
                                                                                                                SizedBox(
                                                                                                                  width: 11.w,
                                                                                                                ),
                                                                                                                SvgPicture.asset(ImageUtils.cross),
                                                                                                              ],
                                                                                                            ),
                                                                                                            SizedBox(
                                                                                                              height: 3.h,
                                                                                                            ),
                                                                                                            Row(
                                                                                                              children: [
                                                                                                                SizedBox(
                                                                                                                  width: 50.w,
                                                                                                                  child: Text(
                                                                                                                    // "Cancel anytime",
                                                                                                                    AppLocalizations.of(context)!.translate('other_text_115')!,
                                                                                                                    style: TextStyle(height: 0.2.h, fontFamily: FontUtils.montserratMedium, fontSize: 2.t),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                SizedBox(
                                                                                                                  width: 10.w,
                                                                                                                ),
                                                                                                                SvgPicture.asset(ImageUtils.tick),
                                                                                                                SizedBox(
                                                                                                                  width: 11.w,
                                                                                                                ),
                                                                                                                SvgPicture.asset(ImageUtils.cross),
                                                                                                              ],
                                                                                                            ),
                                                                                                            SizedBox(
                                                                                                              height: 3.h,
                                                                                                            ),
                                                                                                            Row(
                                                                                                              children: [
                                                                                                                SizedBox(
                                                                                                                  width: 50.w,
                                                                                                                  child: Text(
                                                                                                                    // "Affordable",
                                                                                                                    AppLocalizations.of(context)!.translate('other_text_116')!,
                                                                                                                    style: TextStyle(height: 0.2.h, fontFamily: FontUtils.montserratMedium, fontSize: 2.t),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                SizedBox(
                                                                                                                  width: 1.w,
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  // "From HKD 33 \nper day",
                                                                                                                    AppLocalizations.of(context)!.translate('other_text_117')!,
                                                                                                                    style: TextStyle(height: 0.2.h, fontFamily: FontUtils.montserratMedium, fontSize: 1.5.t),
                                                                                                                    textAlign: TextAlign.center),
                                                                                                                SizedBox(
                                                                                                                  width: 5.w,
                                                                                                                ),
                                                                                                                SvgPicture.asset(ImageUtils.cross),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ],
                                                                                                        )),
                                                                                                    // SizedBox(height: 20.h)
                                                                                                  ],
                                                                                                )
                                                                                              : model.selectionOfPages == 16
                                                                                                  ? Column(
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                                                                                                          height: 50.h,
                                                                                                          width: double.infinity,
                                                                                                          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                                                                                                          decoration: BoxDecoration(color: ColorUtils.white, border: Border.all(color: ColorUtils.border), borderRadius: BorderRadius.circular(15)),
                                                                                                          child: SingleChildScrollView(
                                                                                                            child: Column(
                                                                                                              children: [
                                                                                                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.Donec eget nunc eu libero scelerisque lacinia.Aenean egestas tortor sit amet posuere rutrum.Sed sit amet tellus vel tellus pharetra bibendum.Mauris interdum nibh vitae aliquam rhoncus.Quisque dictum neque sed pharetra dictum.Praesent feugiat nisi sed felis gravida consequat.Cras molestie lectus ut interdum consequat.Pellentesque ut odio dignissim, elementum massa ac, pretium dolor.Duis sed nulla id lacus convallis euismod id eu sapien.Nunc fringilla mi nec dictum vehicula.Morbi eget turpis sit amet nisl dignissim pulvinar.Fusce pulvinar neque nec urna ornare pulvinar.Fusce non nunc hendrerit turpis sagittis rutrum.Mauris sed enim sed tortor euismod aliquam nec eget libero.Donec non ex ac sem malesuada blandit id quis orci.In id nisi posuere massa venenatis accumsan.Donec eget nisi sed sapien pulvinar mollis id sit amet ante.Vivamus tincidunt elit sed rhoncus elementum."),
                                                                                                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.Donec eget nunc eu libero scelerisque lacinia.Aenean egestas tortor sit amet posuere rutrum.Sed sit amet tellus vel tellus pharetra bibendum.Mauris interdum nibh vitae aliquam rhoncus.Quisque dictum neque sed pharetra dictum.Praesent feugiat nisi sed felis gravida consequat.Cras molestie lectus ut interdum consequat.Pellentesque ut odio dignissim, elementum massa ac, pretium dolor.Duis sed nulla id lacus convallis euismod id eu sapien.Nunc fringilla mi nec dictum vehicula.Morbi eget turpis sit amet nisl dignissim pulvinar.Fusce pulvinar neque nec urna ornare pulvinar.Fusce non nunc hendrerit turpis sagittis rutrum.Mauris sed enim sed tortor euismod aliquam nec eget libero.Donec non ex ac sem malesuada blandit id quis orci.In id nisi posuere massa venenatis accumsan.Donec eget nisi sed sapien pulvinar mollis id sit amet ante.Vivamus tincidunt elit sed rhoncus elementum."),
                                                                                                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.Donec eget nunc eu libero scelerisque lacinia.Aenean egestas tortor sit amet posuere rutrum.Sed sit amet tellus vel tellus pharetra bibendum.Mauris interdum nibh vitae aliquam rhoncus.Quisque dictum neque sed pharetra dictum.Praesent feugiat nisi sed felis gravida consequat.Cras molestie lectus ut interdum consequat.Pellentesque ut odio dignissim, elementum massa ac, pretium dolor.Duis sed nulla id lacus convallis euismod id eu sapien.Nunc fringilla mi nec dictum vehicula.Morbi eget turpis sit amet nisl dignissim pulvinar.Fusce pulvinar neque nec urna ornare pulvinar.Fusce non nunc hendrerit turpis sagittis rutrum.Mauris sed enim sed tortor euismod aliquam nec eget libero.Donec non ex ac sem malesuada blandit id quis orci.In id nisi posuere massa venenatis accumsan.Donec eget nisi sed sapien pulvinar mollis id sit amet ante.Vivamus tincidunt elit sed rhoncus elementum."),
                                                                                                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.Donec eget nunc eu libero scelerisque lacinia.Aenean egestas tortor sit amet posuere rutrum.Sed sit amet tellus vel tellus pharetra bibendum.Mauris interdum nibh vitae aliquam rhoncus.Quisque dictum neque sed pharetra dictum.Praesent feugiat nisi sed felis gravida consequat.Cras molestie lectus ut interdum consequat.Pellentesque ut odio dignissim, elementum massa ac, pretium dolor.Duis sed nulla id lacus convallis euismod id eu sapien.Nunc fringilla mi nec dictum vehicula.Morbi eget turpis sit amet nisl dignissim pulvinar.Fusce pulvinar neque nec urna ornare pulvinar.Fusce non nunc hendrerit turpis sagittis rutrum.Mauris sed enim sed tortor euismod aliquam nec eget libero.Donec non ex ac sem malesuada blandit id quis orci.In id nisi posuere massa venenatis accumsan.Donec eget nisi sed sapien pulvinar mollis id sit amet ante.Vivamus tincidunt elit sed rhoncus elementum."),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        )
                                                                                                      ],
                                                                                                    )
                                                                                                  : model.selectionOfPages == 17
                                                                                                      ? Column(
                                                                                                          children: [
                                                                                                            InkWell(
                                                                                                                onTap: () {
                                                                                                                  model.selectionOfPages++;
                                                                                                                  model.notifyListeners();
                                                                                                                },
                                                                                                                child: Image.asset(ImageUtils.splash)),
                                                                                                          ],
                                                                                                        )
                                                                                                      : model.selectionOfPages == 18
                                                                                                          ? Column(
                                                                                                              children: [
                                                                                                                SizedBox(
                                                                                                                  height: 3.h,
                                                                                                                ),
                                                                                                                Row(
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                                  children: [
                                                                                                                    InkWell(
                                                                                                                      onTap: () {
                                                                                                                        model.selectionOfTherapist = 1;
                                                                                                                        model.notifyListeners();
                                                                                                                      },
                                                                                                                      child: Container(
                                                                                                                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                                                                                                                        decoration: BoxDecoration(
                                                                                                                            borderRadius: BorderRadius.circular(15),
                                                                                                                            color: model.selectionOfTherapist == 1 ? ColorUtils.lightSilver : ColorUtils.white,
                                                                                                                            boxShadow: [
                                                                                                                              BoxShadow(color: ColorUtils.grey.withOpacity(model.selectionOfTherapist == 1 ? 0.4 : 0), offset: model.selectionOfTherapist == 1 ? Offset(0, 8) : Offset(0, 0), blurRadius: model.selectionOfTherapist == 1 ? 6 : 0)
                                                                                                                            ],
                                                                                                                            border: model.selectionOfTherapist == 1 ? null : Border.all(color: ColorUtils.border)),
                                                                                                                        child: Column(
                                                                                                                          children: [
                                                                                                                            Container(
                                                                                                                              padding: EdgeInsets.all(4),
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: Colors.grey.withOpacity(0.4),
                                                                                                                                shape: BoxShape.circle,
                                                                                                                              ),
                                                                                                                              child: Image.asset(ImageUtils.miniSupp, scale: 5, fit: BoxFit.fill),
                                                                                                                            ),
                                                                                                                            SizedBox(
                                                                                                                              height: 3.h,
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              "Ida",
                                                                                                                              style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 1.6.t),
                                                                                                                            )
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    InkWell(
                                                                                                                      onTap: () {
                                                                                                                        model.selectionOfTherapist = 2;
                                                                                                                        model.notifyListeners();
                                                                                                                      },
                                                                                                                      child: Container(
                                                                                                                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                                                                                                                        decoration: BoxDecoration(
                                                                                                                            borderRadius: BorderRadius.circular(15),
                                                                                                                            color: model.selectionOfTherapist == 2 ? ColorUtils.lightSilver : ColorUtils.white,
                                                                                                                            boxShadow: [
                                                                                                                              BoxShadow(color: ColorUtils.grey.withOpacity(model.selectionOfTherapist == 2 ? 0.4 : 0), offset: model.selectionOfTherapist == 2 ? Offset(0, 8) : Offset(0, 0), blurRadius: model.selectionOfTherapist == 2 ? 6 : 0)
                                                                                                                            ],
                                                                                                                            border: model.selectionOfTherapist == 2 ? null : Border.all(color: ColorUtils.border)),
                                                                                                                        child: Column(
                                                                                                                          children: [
                                                                                                                            Container(
                                                                                                                              padding: EdgeInsets.all(4),
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: Colors.grey.withOpacity(0.4),
                                                                                                                                shape: BoxShape.circle,
                                                                                                                              ),
                                                                                                                              child: Image.asset(ImageUtils.miniSupp, scale: 5, fit: BoxFit.fill),
                                                                                                                            ),
                                                                                                                            SizedBox(
                                                                                                                              height: 3.h,
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              "Alvis",
                                                                                                                              style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 1.6.t),
                                                                                                                            )
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    InkWell(
                                                                                                                      onTap: () {
                                                                                                                        model.selectionOfTherapist = 3;
                                                                                                                        model.notifyListeners();
                                                                                                                      },
                                                                                                                      child: Container(
                                                                                                                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                                                                                                                        decoration: BoxDecoration(
                                                                                                                            borderRadius: BorderRadius.circular(15),
                                                                                                                            color: model.selectionOfTherapist == 3 ? ColorUtils.lightSilver : ColorUtils.white,
                                                                                                                            boxShadow: [
                                                                                                                              BoxShadow(color: ColorUtils.grey.withOpacity(model.selectionOfTherapist == 3 ? 0.4 : 0), offset: model.selectionOfTherapist == 3 ? Offset(0, 8) : Offset(0, 0), blurRadius: model.selectionOfTherapist == 3 ? 6 : 0)
                                                                                                                            ],
                                                                                                                            border: model.selectionOfTherapist == 3 ? null : Border.all(color: ColorUtils.border)),
                                                                                                                        child: Column(
                                                                                                                          children: [
                                                                                                                            Container(
                                                                                                                              padding: EdgeInsets.all(4),
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: Colors.grey.withOpacity(0.4),
                                                                                                                                shape: BoxShape.circle,
                                                                                                                              ),
                                                                                                                              child: Image.asset(ImageUtils.miniSupp, scale: 5, fit: BoxFit.fill),
                                                                                                                            ),
                                                                                                                            SizedBox(
                                                                                                                              height: 3.h,
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              "Fion",
                                                                                                                              style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 1.6.t),
                                                                                                                            )
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                SizedBox(
                                                                                                                  height: 4.h,
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: double.infinity,
                                                                                                                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                                                                                                                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                                                                                                                  decoration: BoxDecoration(
                                                                                                                      borderRadius: BorderRadius.circular(15),
                                                                                                                      color: ColorUtils.white,
                                                                                                                      // boxShadow: [
                                                                                                                      //   BoxShadow(color: ColorUtils.grey.withOpacity(0.4), offset: Offset(0, 8), blurRadius: 6)
                                                                                                                      // ],
                                                                                                                      border: Border.all(color: ColorUtils.border)),
                                                                                                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                                                    Center(
                                                                                                                      child: Container(
                                                                                                                        padding: EdgeInsets.all(6),
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: Colors.grey.withOpacity(0.4),
                                                                                                                          shape: BoxShape.circle,
                                                                                                                        ),
                                                                                                                        child: Image.asset(ImageUtils.miniSupp, scale: 3, fit: BoxFit.fill),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    SizedBox(
                                                                                                                      height: 1.h,
                                                                                                                    ),
                                                                                                                    Center(
                                                                                                                      child: Text(
                                                                                                                        model.selectionOfTherapist == 1
                                                                                                                            ? "Ida Ng"
                                                                                                                            : model.selectionOfTherapist == 2
                                                                                                                                ? "Alvis"
                                                                                                                                : model.selectionOfTherapist == 3
                                                                                                                                    ? "Fion"
                                                                                                                                    : "",
                                                                                                                        style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 1.8.t),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    SizedBox(
                                                                                                                      height: 3.h,
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      // "Qualifications",
                                                                                                                      AppLocalizations.of(context)!.translate('user_db_therapist_chat_text_5')!,
                                                                                                                      style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 1.8.t),
                                                                                                                    ),
                                                                                                                    SizedBox(
                                                                                                                      height: 2.h,
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      "Master of Counselling \nMember of HKPCA",
                                                                                                                      style: TextStyle(fontFamily: FontUtils.montserratMedium, fontSize: 1.8.t),
                                                                                                                    ),
                                                                                                                    SizedBox(
                                                                                                                      height: 3.h,
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      // "About Me",
                                                                                                                      AppLocalizations.of(context)!.translate('other_text_102')!,
                                                                                                                      style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 1.8.t),
                                                                                                                    ),
                                                                                                                    SizedBox(
                                                                                                                      height: 2.h,
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      "I have 20 years of experience",
                                                                                                                      style: TextStyle(fontFamily: FontUtils.montserratMedium, fontSize: 1.8.t),
                                                                                                                    ),
                                                                                                                    SizedBox(
                                                                                                                      height: 3.h,
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      // "Areas of Focus",
                                                                                                                      AppLocalizations.of(context)!.translate('other_text_103')!,
                                                                                                                      style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 1.8.t),
                                                                                                                    ),
                                                                                                                    SizedBox(
                                                                                                                      height: 3.h,
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      "Stress, Mood problems, Career \nsupport, Family, PTSD",
                                                                                                                      style: TextStyle(fontFamily: FontUtils.montserratMedium, fontSize: 1.8.t),
                                                                                                                    ),
                                                                                                                    SizedBox(
                                                                                                                      height: 2.h,
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      // "Languages",
                                                                                                                      AppLocalizations.of(context)!.translate('other_text_104')!,
                                                                                                                      style: TextStyle(fontFamily: FontUtils.montserratBold, fontSize: 1.8.t),
                                                                                                                    ),
                                                                                                                    SizedBox(
                                                                                                                      height: 2.h,
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      "English, Cantonese",
                                                                                                                      style: TextStyle(fontFamily: FontUtils.montserratMedium, fontSize: 1.8.t),
                                                                                                                    ),
                                                                                                                  ]),
                                                                                                                )
                                                                                                              ],
                                                                                                            )
                                                                                                          : SizedBox(),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  model.selectionOfPages == 16
                                      ? InkWell(
                                          onTap: () {
                                            model.selectionOfPages++;
                                            model.notifyListeners();
                                          },
                                          child: Container(
                                            width: 40.w,
                                            height: 6.h,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: ColorUtils.grey
                                                          .withOpacity(0.3),
                                                      offset: Offset(0, 4),
                                                      // blurRadius: 0.1,
                                                      blurRadius: 2)
                                                ],
                                                color: ColorUtils.green,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                "Agree",
                                                style: TextStyle(
                                                    color: ColorUtils.white,
                                                    fontFamily: FontUtils
                                                        .montserratSemiBold),
                                              ),
                                            ),
                                          ),
                                        )
                                      : model.selectionOfPages == 17
                                          ? Container()
                                          : model.selectionOfPages == 18
                                              ? Column(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        model
                                                            .selectionOfPages++;
                                                        model.notifyListeners();
                                                      },
                                                      child: Container(
                                                        // width: 40.w,
                                                        // height: 6.h,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    13.w,
                                                                vertical: 2.h),
                                                        decoration: BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: ColorUtils
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.3),
                                                                  offset:
                                                                      Offset(
                                                                          0, 4),
                                                                  // blurRadius: 0.1,
                                                                  blurRadius: 2)
                                                            ],
                                                            color: ColorUtils
                                                                .green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: Text(
                                                          // "Confirm",
                                                          AppLocalizations.of(context)!.translate("user_db_video_session_text_8")!,
                                                          style: TextStyle(
                                                              color: ColorUtils
                                                                  .white,
                                                              fontFamily: FontUtils
                                                                  .montserratSemiBold),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    Text(
                                                        // "Can’t find what you want?",
                                                        AppLocalizations.of(context)!.translate('other_text_105')!,
                                                        style: TextStyle(
                                                            fontSize: 1.8.t,
                                                            fontFamily: FontUtils
                                                                .montserratRegular),
                                                        textAlign:
                                                            TextAlign.center),
                                                    SizedBox(
                                                      height: 0.5.h,
                                                    ),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: RichText(
                                                          text: TextSpan(
                                                              text:
                                                                  // "Talk to our ",
                                                              AppLocalizations.of(context)!.translate("other_text_106")!,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      1.6.t,
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .montserratRegular,
                                                                  color:
                                                                      ColorUtils
                                                                          .black),
                                                              children: [
                                                            TextSpan(
                                                                text:
                                                                    // "Customer Service",
                                                                AppLocalizations.of(context)!.translate('other_text_107')!,
                                                                style: TextStyle(
                                                                    color: ColorUtils
                                                                        .green,
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .montserratSemiBold))
                                                          ])),
                                                    )
                                                    // Text.rich(
                                                    //     TextSpan(
                                                    //         text:
                                                    //             "Talk to our Customer Service",
                                                    //         children: [
                                                    //           TextSpan(text: )
                                                    //         ]),
                                                    //     style: TextStyle(
                                                    //         fontSize: 1.8.t,
                                                    //         fontFamily: FontUtils
                                                    //             .montserratRegular),
                                                    //     textAlign:
                                                    //         TextAlign.center)
                                                  ],
                                                )
                                              : Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      // SizedBox(
                                                      //   width: 10.w,
                                                      // ),
                                                      model.selectionOfPages <=
                                                              1
                                                          ? Container()
                                                          : InkWell(
                                                              onTap: () {
                                                                if (model
                                                                        .selectionOfPages <=
                                                                    1) {
                                                                  model
                                                                      .navigateBack();
                                                                }
                                                                if (model.individualSelect ==
                                                                        true &&
                                                                    model.selectionOfPages ==
                                                                        3) {
                                                                  model.selectionOfPages =
                                                                      1;
                                                                  model
                                                                      .notifyListeners();
                                                                } else {
                                                                  model
                                                                      .selectionOfPages--;
                                                                }
                                                                // print(model.selectionOfPages);
                                                                model
                                                                    .notifyListeners();
                                                              },
                                                              child:
                                                                  Image.asset(
                                                                ImageUtils
                                                                    .backArrow,
                                                                height: 10.i,
                                                              )),
                                                      InkWell(
                                                          onTap: () {
                                                            if (model
                                                                    .selectionOfPages ==
                                                                1) {
                                                              model
                                                                  .checkForJoiningAs();
                                                            } else if (model
                                                                    .selectionOfPages ==
                                                                2) {
                                                              if (model
                                                                  .codeController
                                                                  .text
                                                                  .isEmpty) {
                                                                DialogUtils().showDialog(
                                                                    MyErrorWidget(
                                                                        error:
                                                                            "Please Enter Valid Code"));
                                                              } else {
                                                                model
                                                                    .selectionOfPages++;
                                                                model
                                                                    .notifyListeners();
                                                              }
                                                              model
                                                                  .notifyListeners();
                                                            } else if (model
                                                                    .selectionOfPages ==
                                                                3) {
                                                              model
                                                                  .checkForLookingFor();
                                                            } else if (model
                                                                    .selectionOfPages ==
                                                                4) {
                                                              if (model.formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                                model
                                                                    .selectionOfPages++;
                                                                model
                                                                    .notifyListeners();
                                                              }
                                                            } else if (model
                                                                    .selectionOfPages ==
                                                                5) {
                                                              if (model.selectedGender ==
                                                                      0 ||
                                                                  model.selectedGender <
                                                                      1) {
                                                                DialogUtils().showDialog(
                                                                    MyErrorWidget(
                                                                        error:
                                                                            "Please select your gender"));
                                                              } else {
                                                                model
                                                                    .selectionOfPages++;
                                                                model
                                                                    .notifyListeners();
                                                              }
                                                            } else if (model
                                                                    .selectionOfPages ==
                                                                6) {
                                                              if (model
                                                                  .yourLanguage
                                                                  .isEmpty) {
                                                                DialogUtils().showDialog(
                                                                    MyErrorWidget(
                                                                        error:
                                                                            "Please Select Your Language"));
                                                              } else if (model
                                                                  .selectedDropDownLang
                                                                  .isEmpty) {
                                                                DialogUtils().showDialog(
                                                                    MyErrorWidget(
                                                                        error:
                                                                            "Please Select Your Country"));
                                                              } else {
                                                                model
                                                                    .selectionOfPages++;
                                                                model
                                                                    .notifyListeners();
                                                                print(model
                                                                    .selectionOfPages);
                                                              }
                                                            } else if (model
                                                                    .selectionOfPages ==
                                                                7) {
                                                              if (model
                                                                  .selectedNameofBring
                                                                  .isEmpty) {
                                                                DialogUtils().showDialog(
                                                                    MyErrorWidget(
                                                                        error:
                                                                            "Please Select Atleast One"));
                                                              } else {
                                                                model
                                                                    .selectionOfPages++;
                                                                model
                                                                    .notifyListeners();
                                                                print(model
                                                                    .selectionOfPages);
                                                              }
                                                            } else if (model
                                                                    .selectionOfPages ==
                                                                8) {
                                                              if (model
                                                                  .selectedNameofDescribe
                                                                  .isEmpty) {
                                                                DialogUtils().showDialog(
                                                                    MyErrorWidget(
                                                                        error:
                                                                            "Please Select Atleast One"));
                                                              } else {
                                                                model
                                                                    .selectionOfPages++;
                                                                model
                                                                    .notifyListeners();
                                                              }
                                                            } else if (model
                                                                    .selectionOfPages ==
                                                                9) {
                                                              if (model
                                                                  .selectedNameofAnythingElse
                                                                  .isEmpty) {
                                                                DialogUtils().showDialog(
                                                                    MyErrorWidget(
                                                                        error:
                                                                            "Please Select Atleast One"));
                                                              } else {
                                                                model
                                                                    .selectionOfPages++;
                                                                model
                                                                    .notifyListeners();
                                                              }
                                                            } else if (model
                                                                    .selectionOfPages ==
                                                                10) {
                                                              if (model.selectedCounsellor ==
                                                                      0 ||
                                                                  model.selectedCounsellor <
                                                                      1) {
                                                                DialogUtils().showDialog(
                                                                    MyErrorWidget(
                                                                        error:
                                                                            "Please Select Atleast One"));
                                                              } else {
                                                                model
                                                                    .selectionOfPages++;
                                                                model
                                                                    .notifyListeners();
                                                              }
                                                            } else if (model
                                                                    .selectionOfPages ==
                                                                11) {
                                                              if (model.hadTherapistOrCoach ==
                                                                      0 ||
                                                                  model.hadTherapistOrCoach <
                                                                      1) {
                                                                DialogUtils().showDialog(
                                                                    MyErrorWidget(
                                                                        error:
                                                                            "Please Select Atleast One"));
                                                              } else {
                                                                model
                                                                    .selectionOfPages++;
                                                                model
                                                                    .notifyListeners();
                                                              }
                                                            } else if (model
                                                                    .selectionOfPages ==
                                                                12) {
                                                              if (model
                                                                      .selectedSuicidalIdea ==
                                                                  true) {
                                                                model
                                                                    .navigateToSuicidalHelp();
                                                              } else if (model
                                                                      .selectedSuicidalHelp ==
                                                                  true) {
                                                                model
                                                                    .selectionOfPages++;
                                                                model
                                                                    .notifyListeners();
                                                              } else {
                                                                DialogUtils().showDialog(
                                                                    MyErrorWidget(
                                                                        error:
                                                                            "PLease Select Any One!"));
                                                              }
                                                            } else if (model
                                                                    .selectionOfPages ==
                                                                13) {
                                                              if (model
                                                                      .tellUsMore
                                                                      .text
                                                                      .length <
                                                                  1) {
                                                                DialogUtils().showDialog(
                                                                    MyErrorWidget(
                                                                        error:
                                                                            "This field cannot be empty"));
                                                              } else {
                                                                model
                                                                    .selectionOfPages++;
                                                                model
                                                                    .notifyListeners();
                                                              }
                                                            } else if (model
                                                                    .selectionOfPages ==
                                                                14) {
                                                              if (model
                                                                  .selectedNameofHowDidYouHear
                                                                  .isEmpty) {
                                                                DialogUtils().showDialog(
                                                                    MyErrorWidget(
                                                                        error:
                                                                            "Please Select Atleast One"));
                                                              } else {
                                                                model
                                                                    .selectionOfPages++;
                                                                model
                                                                    .notifyListeners();
                                                              }
                                                            } else if (model
                                                                    .selectionOfPages ==
                                                                15) {
                                                              model
                                                                  .selectionOfPages++;
                                                              model
                                                                  .notifyListeners();
                                                            } else if (model
                                                                    .selectionOfPages ==
                                                                16) {
                                                            } else if (model
                                                                    .selectionOfPages ==
                                                                17) {
                                                            } else if (model
                                                                    .selectionOfPages ==
                                                                18) {}

                                                            model
                                                                .notifyListeners();
                                                          },
                                                          child: SvgPicture
                                                              .asset(ImageUtils
                                                                  .forwardArrow)),
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
