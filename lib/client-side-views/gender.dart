import 'package:flutter/material.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
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
                      Row(children: [
                        IconButton(
                            onPressed: () {
                              model.navigateBack();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: ColorUtils.black,
                              size: 4.i,
                            )),
                      ]),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        // "Select your gender",
                        AppLocalizations.of(context)!
                            .translate('select_your_gender_text_1')!,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.montserratBold,
                            fontSize: 3.t),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 7.5.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          model.selectedGender = 1;
                          model.notifyListeners();
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(15),
                          elevation: model.selectedGender == 1 ? 10 : 0,
                          shadowColor: ColorUtils.border.withOpacity(0.4),
                          child: Container(
                            width: 50.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: model.selectedGender == 1
                                        ? ColorUtils.green
                                        : ColorUtils.border),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      GestureDetector(
                        onTap: () {
                          model.selectedGender = 2;
                          model.notifyListeners();
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(15),
                          elevation: model.selectedGender == 2 ? 10 : 0,
                          shadowColor: ColorUtils.border.withOpacity(0.4),
                          child: Container(
                            width: 50.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: model.selectedGender == 2
                                        ? ColorUtils.green
                                        : ColorUtils.border),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      GestureDetector(
                        onTap: () {
                          model.selectedGender = 3;
                          model.notifyListeners();
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(15),
                          elevation: model.selectedGender == 3 ? 10 : 0,
                          shadowColor: ColorUtils.border.withOpacity(0.4),
                          child: Container(
                            width: 50.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: model.selectedGender == 3
                                        ? ColorUtils.green
                                        : ColorUtils.border),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SvgPicture.asset(ImageUtils.binary,color: model.selectedGender== 3 ? ColorUtils.purple : ColorUtils.black),
                                // SizedBox(width: 3.w,),
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate('select_your_gender_text_4')!,
                                  style: TextStyle(
                                    color: model.selectedGender == 3
                                        ? ColorUtils.green
                                        : ColorUtils.black,
                                    fontFamily: FontUtils.montserratMedium,
                                    fontSize: 2.t,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      GestureDetector(
                        onTap: () {
                          model.selectedGender = 4;
                          model.notifyListeners();
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(15),
                          elevation: model.selectedGender == 4 ? 10 : 0,
                          shadowColor: ColorUtils.border.withOpacity(0.4),
                          child: Container(
                              width: 50.w,
                              height: 6.h,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: model.selectedGender == 4
                                          ? ColorUtils.green
                                          : ColorUtils.border),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                  child: Text(
                                AppLocalizations.of(context)!
                                    .translate('select_your_gender_text_5')!,
                                style: TextStyle(
                                    color: model.selectedGender == 4
                                        ? ColorUtils.green
                                        : ColorUtils.black,
                                    fontFamily: FontUtils.montserratMedium,
                                    fontSize: 2.t),
                                textAlign: TextAlign.center,
                              ))),
                        ),
                      ),
                      SizedBox(
                        height: 6.5.h,
                      ),
                      InkWell(
                          onTap: () {
                            model.userGender();
                          },
                          child: Button(
                              AppLocalizations.of(context)!
                                  .translate('other_text_14')!,
                              15)),
                    ],
                  ),
                )),
              )),
        );
      },
    );
  }
}






















// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:soulgood/Widget/button.dart';
// import 'package:soulgood/app/locator.dart';
// import 'package:soulgood/utils/app_localization.dart';
// import 'package:soulgood/utils/color_utils.dart';
// import 'package:soulgood/utils/dimensions.dart';
// import 'package:soulgood/utils/extensions.dart';
// import 'package:soulgood/utils/font_utils.dart';
// import 'package:soulgood/viewModels/main_view_model.dart';
// import 'package:stacked/stacked.dart';

// import '../utils/image_utils.dart';

// class Gender extends StatefulWidget {
//   const Gender({Key? key}) : super(key: key);

//   @override
//   _GenderState createState() => _GenderState();
// }

// class _GenderState extends State<Gender> {
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<MainViewModel>.reactive(
//       viewModelBuilder: () => locator<MainViewModel>(),
//       disposeViewModel: false,
//       onModelReady: (model) {},
//       builder: (context, model, child) {
//         return SafeArea(
//           top: false,
//           bottom: false,
//           child: GestureDetector(
//               onTap: () {
//                 FocusScope.of(context).unfocus();
//               },
//               child: Scaffold(
//                 backgroundColor: Colors.white,
//                 body: SingleChildScrollView(
//                     child: Container(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: Dimensions.horizontalPadding),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: Dimensions.topMargin,
//                       ),
//                       Row(children: [
//                         IconButton(
//                             onPressed: () {
//                               model.navigateBack();
//                             },
//                             icon: Icon(
//                               Icons.arrow_back_ios,
//                               color: ColorUtils.black,
//                               size: 4.i,
//                             )),
//                       ]),
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       Text(
//                         // "Select your gender",
//                         AppLocalizations.of(context)!
//                             .translate('select_your_gender_text_1')!,
//                         style: TextStyle(
//                             color: ColorUtils.black,
//                             fontFamily: FontUtils.montserratBold,
//                             fontSize: 3.t),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(
//                         height: 7.5.h,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           model.selectedGender = 1;
//                           model.notifyListeners();
//                         },
//                         child: Material(
//                           borderRadius: BorderRadius.circular(15),
//                           elevation: model.selectedGender == 1 ? 10 : 0,
//                           shadowColor: ColorUtils.border.withOpacity(0.4),
//                           child: Container(
//                             width: 50.w,
//                             height: 6.h,
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                     color: model.selectedGender == 1
//                                         ? ColorUtils.green
//                                         : ColorUtils.border),
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 // SvgPicture.asset(ImageUtils.male,color: model.selectedGender== 1 ? ColorUtils.purple : ColorUtils.black),
//                                 // SizedBox(width: 3.w,),
//                                 Text(
//                                   AppLocalizations.of(context)!
//                                       .translate('select_your_gender_text_2')!,
//                                   style: TextStyle(
//                                       color: model.selectedGender == 1
//                                           ? ColorUtils.green
//                                           : ColorUtils.black,
//                                       fontFamily: FontUtils.montserratMedium,
//                                       fontSize: 2.t),
//                                   textAlign: TextAlign.center,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 3.h),
//                       GestureDetector(
//                         onTap: () {
//                           model.selectedGender = 2;
//                           model.notifyListeners();
//                         },
//                         child: Material(
//                           borderRadius: BorderRadius.circular(15),
//                           elevation: model.selectedGender == 2 ? 10 : 0,
//                           shadowColor: ColorUtils.border.withOpacity(0.4),
//                           child: Container(
//                             width: 50.w,
//                             height: 6.h,
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                     color: model.selectedGender == 2
//                                         ? ColorUtils.green
//                                         : ColorUtils.border),
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 // SvgPicture.asset(ImageUtils.female,color: model.selectedGender== 2 ? ColorUtils.purple : ColorUtils.black),
//                                 // SizedBox(width: 3.w,),
//                                 Text(
//                                   AppLocalizations.of(context)!
//                                       .translate('select_your_gender_text_3')!,
//                                   style: TextStyle(
//                                       color: model.selectedGender == 2
//                                           ? ColorUtils.green
//                                           : ColorUtils.black,
//                                       fontFamily: FontUtils.montserratMedium,
//                                       fontSize: 2.t),
//                                   textAlign: TextAlign.center,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 3.h),
//                       GestureDetector(
//                         onTap: () {
//                           model.selectedGender = 3;
//                           model.notifyListeners();
//                         },
//                         child: Material(
//                           borderRadius: BorderRadius.circular(15),
//                           elevation: model.selectedGender == 3 ? 10 : 0,
//                           shadowColor: ColorUtils.border.withOpacity(0.4),
//                           child: Container(
//                             width: 50.w,
//                             height: 6.h,
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                     color: model.selectedGender == 3
//                                         ? ColorUtils.green
//                                         : ColorUtils.border),
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 // SvgPicture.asset(ImageUtils.binary,color: model.selectedGender== 3 ? ColorUtils.purple : ColorUtils.black),
//                                 // SizedBox(width: 3.w,),
//                                 Text(
//                                   AppLocalizations.of(context)!
//                                       .translate('select_your_gender_text_4')!,
//                                   style: TextStyle(
//                                     color: model.selectedGender == 3
//                                         ? ColorUtils.green
//                                         : ColorUtils.black,
//                                     fontFamily: FontUtils.montserratMedium,
//                                     fontSize: 2.t,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 3.h),
//                       GestureDetector(
//                         onTap: () {
//                           model.selectedGender = 4;
//                           model.notifyListeners();
//                         },
//                         child: Material(
//                           borderRadius: BorderRadius.circular(15),
//                           elevation: model.selectedGender == 4 ? 10 : 0,
//                           shadowColor: ColorUtils.border.withOpacity(0.4),
//                           child: Container(
//                               width: 50.w,
//                               height: 6.h,
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: model.selectedGender == 4
//                                           ? ColorUtils.green
//                                           : ColorUtils.border),
//                                   borderRadius: BorderRadius.circular(15)),
//                               child: Center(
//                                   child: Text(
//                                 AppLocalizations.of(context)!
//                                     .translate('select_your_gender_text_5')!,
//                                 style: TextStyle(
//                                     color: model.selectedGender == 4
//                                         ? ColorUtils.green
//                                         : ColorUtils.black,
//                                     fontFamily: FontUtils.montserratMedium,
//                                     fontSize: 2.t),
//                                 textAlign: TextAlign.center,
//                               ))),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 13.h,
//                       ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 10.w),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // SizedBox(
//                               //   width: 10.w,
//                               // ),
//                               InkWell(
//                                   onTap: () {
//                                     model.navigateBack();
//                                   },
//                                   child: Image.asset(
//                                     ImageUtils.backArrow,
//                                     height: 10.i,
//                                   )),
//                               InkWell(
//                                   onTap: () {
//                                     if (model.formKey.currentState!
//                                         .validate()) {
//                                       model.userGender();
//                                     }
//                                     // if (model.codeController.text.isEmpty) {
//                                     //   DialogUtils().showDialog(MyErrorWidget(
//                                     //       error: "Please Enter Valid Code"));
//                                     // } else {
//                                     //   model.navigation_Service
//                                     //       .navigateTo(to: LookingFor());
//                                     // }
//                                     model.notifyListeners();
//                                   },
//                                   child: SvgPicture.asset(
//                                       ImageUtils.forwardArrow)),
//                               // SizedBox(
//                               //   width: 10.w,
//                               // )
//                             ],
//                           ),
//                         )
                        
//                       // InkWell(
//                       //     onTap: () {
//                       //       model.userGender();
//                       //     },
//                       //     child: Button(
//                       //         AppLocalizations.of(context)!
//                       //             .translate('other_text_14')!,
//                       //         15)),
//                     ],
//                   ),
//                 )),
//               )),
//         );
//       },
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:soulgood/Widget/button.dart';
// import 'package:soulgood/app/locator.dart';
// import 'package:soulgood/utils/app_localization.dart';
// import 'package:soulgood/utils/color_utils.dart';
// import 'package:soulgood/utils/dimensions.dart';
// import 'package:soulgood/utils/extensions.dart';
// import 'package:soulgood/utils/font_utils.dart';
// import 'package:soulgood/viewModels/main_view_model.dart';
// import 'package:stacked/stacked.dart';

// import '../utils/image_utils.dart';

// class Gender extends StatefulWidget {
//   const Gender({Key? key}) : super(key: key);

//   @override
//   _GenderState createState() => _GenderState();
// }

// class _GenderState extends State<Gender> {
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<MainViewModel>.reactive(
//       viewModelBuilder: () => locator<MainViewModel>(),
//       disposeViewModel: false,
//       onModelReady: (model) {},
//       builder: (context, model, child) {
//         return SafeArea(
//           top: false,
//           bottom: false,
//           child: GestureDetector(
//               onTap: () {
//                 FocusScope.of(context).unfocus();
//               },
//               child: Scaffold(
//                 backgroundColor: ColorUtils.almond,
//                 body: SingleChildScrollView(
//                     child: Container(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: Dimensions.horizontalPadding),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: Dimensions.topMargin,
//                       ),
//                       Align(
//                         alignment: Alignment.center,
//                         child: Image.asset(
//                           ImageUtils.soulgood,
//                           height: 10.i,
//                         ),
//                       ),
//                       SizedBox(height: 2.h),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: 5.w,
//                           ),
//                           SvgPicture.asset(
//                             ImageUtils.progressbar4,
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 2.h,
//                       ),
//                       // Row(children: [
//                       //   IconButton(
//                       //       onPressed: () {
//                       //         model.navigateBack();
//                       //       },
//                       //       icon: Icon(
//                       //         Icons.arrow_back_ios,
//                       //         color: ColorUtils.black,
//                       //         size: 4.i,
//                       //       )),
//                       // ]),
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20.w),
//                         child: Text(
//                           // "Select your gender",
//                           AppLocalizations.of(context)!
//                               .translate('select_your_gender_text_1')!,
//                           style: TextStyle(
//                               color: ColorUtils.black,
//                               fontFamily: FontUtils.montserratBold,
//                               fontSize: 3.t),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 4.h,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           model.selectedGender = 1;
//                           model.notifyListeners();
//                         },
//                         child: Material(
//                           borderRadius: BorderRadius.circular(24),
//                           elevation: model.selectedGender == 1 ? 10 : 0,
//                           shadowColor: ColorUtils.border.withOpacity(0.4),
//                           child: Container(
//                             width: 50.w,
//                             height: 6.h,
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                     color: model.selectedGender == 1
//                                         ? ColorUtils.green
//                                         : ColorUtils.border),
//                                 borderRadius: BorderRadius.circular(24)),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 // SvgPicture.asset(ImageUtils.male,color: model.selectedGender== 1 ? ColorUtils.purple : ColorUtils.black),
//                                 // SizedBox(width: 3.w,),
//                                 Text(
//                                   AppLocalizations.of(context)!
//                                       .translate('select_your_gender_text_2')!,
//                                   style: TextStyle(
//                                       color: model.selectedGender == 1
//                                           ? ColorUtils.green
//                                           : ColorUtils.black,
//                                       fontFamily: FontUtils.montserratMedium,
//                                       fontSize: 2.t),
//                                   textAlign: TextAlign.center,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 3.h),
//                       GestureDetector(
//                         onTap: () {
//                           model.selectedGender = 2;
//                           model.notifyListeners();
//                         },
//                         child: Material(
//                           borderRadius: BorderRadius.circular(24),
//                           elevation: model.selectedGender == 2 ? 10 : 0,
//                           shadowColor: ColorUtils.border.withOpacity(0.4),
//                           child: Container(
//                             width: 50.w,
//                             height: 6.h,
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                     color: model.selectedGender == 2
//                                         ? ColorUtils.green
//                                         : ColorUtils.border),
//                                 borderRadius: BorderRadius.circular(24)),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 // SvgPicture.asset(ImageUtils.female,color: model.selectedGender== 2 ? ColorUtils.purple : ColorUtils.black),
//                                 // SizedBox(width: 3.w,),
//                                 Text(
//                                   AppLocalizations.of(context)!
//                                       .translate('select_your_gender_text_3')!,
//                                   style: TextStyle(
//                                       color: model.selectedGender == 2
//                                           ? ColorUtils.green
//                                           : ColorUtils.black,
//                                       fontFamily: FontUtils.montserratMedium,
//                                       fontSize: 2.t),
//                                   textAlign: TextAlign.center,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 3.h),
//                       GestureDetector(
//                         onTap: () {
//                           model.selectedGender = 3;
//                           model.notifyListeners();
//                         },
//                         child: Material(
//                           borderRadius: BorderRadius.circular(24),
//                           elevation: model.selectedGender == 3 ? 10 : 0,
//                           shadowColor: ColorUtils.border.withOpacity(0.4),
//                           child: Container(
//                             width: 50.w,
//                             height: 6.h,
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                     color: model.selectedGender == 3
//                                         ? ColorUtils.green
//                                         : ColorUtils.border),
//                                 borderRadius: BorderRadius.circular(24)),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 // SvgPicture.asset(ImageUtils.binary,color: model.selectedGender== 3 ? ColorUtils.purple : ColorUtils.black),
//                                 // SizedBox(width: 3.w,),
//                                 Text(
//                                   AppLocalizations.of(context)!
//                                       .translate('select_your_gender_text_4')!,
//                                   style: TextStyle(
//                                     color: model.selectedGender == 3
//                                         ? ColorUtils.green
//                                         : ColorUtils.black,
//                                     fontFamily: FontUtils.montserratMedium,
//                                     fontSize: 2.t,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 3.h),
//                       GestureDetector(
//                         onTap: () {
//                           model.selectedGender = 4;
//                           model.notifyListeners();
//                         },
//                         child: Material(
//                           borderRadius: BorderRadius.circular(24),
//                           elevation: model.selectedGender == 4 ? 10 : 0,
//                           shadowColor: ColorUtils.border.withOpacity(0.4),
//                           child: Container(
//                               width: 50.w,
//                               height: 6.h,
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: model.selectedGender == 4
//                                           ? ColorUtils.green
//                                           : ColorUtils.border),
//                                   borderRadius: BorderRadius.circular(24)),
//                               child: Center(
//                                   child: Text(
//                                 AppLocalizations.of(context)!
//                                     .translate('select_your_gender_text_5')!,
//                                 style: TextStyle(
//                                     color: model.selectedGender == 4
//                                         ? ColorUtils.green
//                                         : ColorUtils.black,
//                                     fontFamily: FontUtils.montserratMedium,
//                                     fontSize: 2.t),
//                                 textAlign: TextAlign.center,
//                               ))),
//                         ),
//                       ),
//                       // SizedBox(
//                       //   height: 6.5.h,
//                       // ),

//                       SizedBox(
//                         height: 15.5.h,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10.w),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             // SizedBox(
//                             //   width: 10.w,
//                             // ),
//                             InkWell(
//                                 onTap: () {
//                                   model.navigateBack();
//                                 },
//                                 child: Image.asset(
//                                   ImageUtils.backArrow,
//                                   height: 10.i,
//                                 )),
//                             InkWell(
//                                 onTap: () {
//                                   if (model.formKey.currentState!.validate()) {
//                                     model.userGender();
//                                   }
//                                   // if (model.codeController.text.isEmpty) {
//                                   //   DialogUtils().showDialog(MyErrorWidget(
//                                   //       error: "Please Enter Valid Code"));
//                                   // } else {
//                                   //   model.navigation_Service
//                                   //       .navigateTo(to: LookingFor());
//                                   // }
//                                   model.notifyListeners();
//                                 },
//                                 child:
//                                     SvgPicture.asset(ImageUtils.forwardArrow)),
//                             // SizedBox(
//                             //   width: 10.w,
//                             // )
//                           ],
//                         ),
//                       )
//                       // InkWell(
//                       //     onTap: () {
//                       //       model.userGender();
//                       //     },
//                       //     child: Button(
//                       //         AppLocalizations.of(context)!
//                       //             .translate('other_text_14')!,
//                       //         15)),
//                     ],
//                   ),
//                 )),
//               )),
//         );
//       },
//     );
//   }
// }
