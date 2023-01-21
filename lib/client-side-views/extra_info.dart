import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';

class ExtraInformation extends StatefulWidget {
  const ExtraInformation({Key? key}) : super(key: key);

  @override
  _ExtraInformationState createState() => _ExtraInformationState();
}

class _ExtraInformationState extends State<ExtraInformation> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.age.clear();
        model.name.clear();
        model.Phone.clear();
      },
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
                  child: Stack(children: [
                    Column(
                      children: [
                        SizedBox(
                          height: Dimensions.topMargin,
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  model.navigateBack();
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: ColorUtils.black,
                                  size: 4.i,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('user_detail_text_1')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratBold,
                              fontSize: 3.1.t),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Form(
                          key: model.formKey,
                          child: Column(children: [
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
                            Material(
                              elevation: model.nameFocus.hasFocus ? 10 : 0,
                              shadowColor: ColorUtils.border.withOpacity(0.4),
                              child: TextFormField(
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Please fill this field';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                controller: model.name,
                                focusNode: model.nameFocus,
                                style: TextStyle(
                                    color: model.nameFocus.hasFocus
                                        ? ColorUtils.purple
                                        : ColorUtils.black),
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      width: 2,
                                      color: model.nameFocus.hasFocus
                                          ? ColorUtils.purple
                                          : ColorUtils.black,
                                    )),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: model.nameFocus.hasFocus
                                              ? ColorUtils.purple
                                              : ColorUtils.black),
                                    ),
                                    hintText: AppLocalizations.of(context)!
                                        .translate('other_text_17')!,
                                    // errorText: model.validate ? "Please fill this field" :  null,
                                    prefixIcon: SvgPicture.asset(
                                      ImageUtils.name,
                                      height: 0.1.i,
                                      width: 0.1,
                                      fit: BoxFit.scaleDown,
                                      color: model.nameFocus.hasFocus
                                          ? ColorUtils.purple
                                          : ColorUtils.black,
                                    )),
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
                                  height: 2.h,
                                ),
                                Material(
                                  elevation: model.ageFocus.hasFocus ? 10 : 0,
                                  shadowColor:
                                      ColorUtils.border.withOpacity(0.4),
                                  child: TextFormField(
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Please fill this field';
                                      }
                                      return null;
                                    },
                                    focusNode: model.ageFocus,
                                    controller: model.age,
                                    style: TextStyle(
                                      color: model.ageFocus.hasFocus
                                          ? ColorUtils.purple
                                          : ColorUtils.black,
                                    ),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: model.ageFocus.hasFocus
                                                  ? ColorUtils.purple
                                                  : ColorUtils.black)),
                                      // errorText: model.validate
                                      //     ? "Please fill this field"
                                      //     : null,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: model.ageFocus.hasFocus
                                              ? ColorUtils.purple
                                              : ColorUtils.black,
                                        ),
                                      ),
                                      hintText: AppLocalizations.of(context)!
                                          .translate('other_text_19')!,
                                      prefixIcon: SvgPicture.asset(
                                        ImageUtils.age,
                                        color: model.ageFocus.hasFocus
                                            ? ColorUtils.purple
                                            : ColorUtils.black,
                                        height: 5.i,
                                        width: 5.i,
                                        fit: BoxFit.scaleDown,
                                      ),
                                      prefixStyle: TextStyle(
                                        color: model.ageFocus.hasFocus
                                            ? ColorUtils.purple
                                            : ColorUtils.black,
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(2)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
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
                                      height: 2.h,
                                    ),
                                    Material(
                                      elevation:
                                          model.phoneFocus.hasFocus ? 10 : 0,
                                      shadowColor:
                                          ColorUtils.border.withOpacity(0.4),
                                      child: TextFormField(
                                        focusNode: model.phoneFocus,
                                        controller: model.Phone,
                                        style: TextStyle(
                                          color: model.phoneFocus.hasFocus
                                              ? ColorUtils.purple
                                              : ColorUtils.black,
                                        ),
                                        validator: (text) {
                                          if (text == null || text.isEmpty) {
                                            return 'Please fill this field';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      model.phoneFocus.hasFocus
                                                          ? ColorUtils.purple
                                                          : ColorUtils.black)),
                                          hintText:
                                              AppLocalizations.of(context)!
                                                  .translate('other_text_20')!,
                                          // errorText: model.validate ? "Please fill this field" :  null,

                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: model.phoneFocus.hasFocus
                                                  ? ColorUtils.purple
                                                  : ColorUtils.black,
                                            ),
                                          ),
                                          prefixIcon: SvgPicture.asset(
                                            ImageUtils.mobile,
                                            color: model.phoneFocus.hasFocus
                                                ? ColorUtils.purple
                                                : ColorUtils.black,
                                            height: 5.i,
                                            fit: BoxFit.scaleDown,
                                          ),
                                          prefixStyle: TextStyle(
                                            color: model.phoneFocus.hasFocus
                                                ? ColorUtils.purple
                                                : ColorUtils.black,
                                          ),
                                        ),
                                        keyboardType: TextInputType.phone,
                                        inputFormatters: [
                                          // FilteringTextInputFormatter.digitsOnly,
                                          LengthLimitingTextInputFormatter(15)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        InkWell(
                            onTap: () {
                              // model.phoneNumber();
                              if (model.formKey.currentState!.validate()) {
                                model.userExtraInfo();
                              }
                            },
                            child: Button(
                                AppLocalizations.of(context)!
                                    .translate('other_text_14')!,
                                15)),
                      ],
                    ),
                  ]),
                )),
              )),
        );
      },
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:soulgood/Widget/button.dart';
// import 'package:soulgood/utils/app_localization.dart';
// import 'package:soulgood/utils/color_utils.dart';
// import 'package:soulgood/utils/dimensions.dart';
// import 'package:soulgood/utils/extensions.dart';
// import 'package:soulgood/utils/font_utils.dart';
// import 'package:soulgood/utils/image_utils.dart';
// import 'package:soulgood/viewModels/main_view_model.dart';
// import 'package:stacked/stacked.dart';

// import '../Widget/error_widget.dart';
// import '../app/locator.dart';
// import '../utils/dialog_utils.dart';
// import 'looking_for.dart';

// class ExtraInformation extends StatefulWidget {
//   const ExtraInformation({Key? key}) : super(key: key);

//   @override
//   _ExtraInformationState createState() => _ExtraInformationState();
// }

// class _ExtraInformationState extends State<ExtraInformation> {
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<MainViewModel>.reactive(
//       viewModelBuilder: () => locator<MainViewModel>(),
//       disposeViewModel: false,
//       onModelReady: (model) {
//         model.age.clear();
//         model.name.clear();
//         model.Phone.clear();
//       },
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
//                   child: Stack(children: [
//                     Column(
//                       children: [
//                         SizedBox(
//                           height: Dimensions.topMargin,
//                         ),
//                         Align(
//                           alignment: Alignment.center,
//                           child: Image.asset(
//                             ImageUtils.soulgood,
//                             height: 10.i,
//                           ),
//                         ),
//                         SizedBox(height: 2.h),
//                         Row(
//                           children: [
//                             SizedBox(
//                               width: 5.w,
//                             ),
//                             SvgPicture.asset(
//                               ImageUtils.progressbar3,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 7.h,
//                         ),
//                         Text(
//                           'What’s your name?',
//                           // AppLocalizations.of(context)!
//                           //     .translate('user_detail_text_2')!,
//                           style: TextStyle(
//                               fontFamily: FontUtils.montserratBold,
//                               fontSize: 3.1.t),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(
//                           height: 5.h,
//                         ),
//                         Form(
//                           key: model.formKey,
//                           child: Column(children: [
//                             // Row(
//                             //   children: [
//                             //     Text(
//                             //       "What’s your name:",
//                             //       style: TextStyle(
//                             //           fontSize: 2.t,
//                             //           fontFamily: FontUtils.montserratMedium,
//                             //           color: model.nameFocus.hasFocus
//                             //               ? ColorUtils.purple
//                             //               : ColorUtils.black),
//                             //     )
//                             //   ],
//                             // ),
//                             SizedBox(
//                               height: 2.h,
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 5.w),
//                               child: Material(
//                                 // color: ColorUtils.almond,
//                                 elevation: model.nameFocus.hasFocus ? 10 : 0,
//                                 shadowColor: ColorUtils.border.withOpacity(0.4),
//                                 borderRadius: BorderRadius.circular(24),
//                                 child: TextFormField(
//                                   onTap: () {
//                                     model.notifyListeners();
//                                   },
//                                   validator: (text) {
//                                     if (text == null || text.isEmpty) {
//                                       return 'Please fill this field';
//                                     }
//                                     return null;
//                                   },
//                                   keyboardType: TextInputType.name,
//                                   controller: model.name,
//                                   focusNode: model.nameFocus,
//                                   style: TextStyle(
//                                       color: model.nameFocus.hasFocus
//                                           ? ColorUtils.green
//                                           : ColorUtils.black),
//                                   decoration: InputDecoration(
//                                       focusedBorder: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(24),
//                                           borderSide: BorderSide(
//                                               color: model.nameFocus.hasFocus
//                                                   ? ColorUtils.green
//                                                   : ColorUtils.black)),
//                                       // errorText: model.validate
//                                       //     ? "Please fill this field"
//                                       //     : null,
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(24),
//                                         borderSide: BorderSide(
//                                           color: model.nameFocus.hasFocus
//                                               ? ColorUtils.green
//                                               : ColorUtils.black,
//                                         ),
//                                       ),
//                                       // InputDecoration(
//                                       //     focusedBorder: OutlineInputBorder(
//                                       //         borderRadius: BorderRadius.circular(24),
//                                       //         borderSide: BorderSide(
//                                       //           width: 2,
//                                       //           color: model.nameFocus.hasFocus
//                                       //               ? ColorUtils.green
//                                       //               : ColorUtils.black,
//                                       //         )),
//                                       //     border: OutlineInputBorder(
//                                       //       borderRadius: BorderRadius.circular(24),
//                                       //       borderSide: BorderSide(
//                                       //           width: 1,
//                                       //           color: model.nameFocus.hasFocus
//                                       //               ? ColorUtils.green
//                                       //               : ColorUtils.black),
//                                       //     ),
//                                       hintText: 'Name',
//                                       //  AppLocalizations.of(context)!
//                                       //     .translate('other_text_17')!,
//                                       hintStyle: TextStyle(
//                                           color: model.nameFocus.hasFocus
//                                               ? ColorUtils.green
//                                               : ColorUtils.black),
//                                       // errorText: model.validate ? "Please fill this field" :  null,
//                                       prefixIcon: SvgPicture.asset(
//                                         ImageUtils.name,
//                                         height: 0.1.i,
//                                         width: 0.1,
//                                         fit: BoxFit.scaleDown,
//                                         color: model.nameFocus.hasFocus
//                                             ? ColorUtils.green
//                                             : ColorUtils.black,
//                                       )),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 3.h,
//                             ),
//                             Column(
//                               children: [
//                                 // Row(
//                                 //   children: [
//                                 //     Text(
//                                 //       "What’s your age:",
//                                 //       style: TextStyle(
//                                 //           fontSize: 2.t,
//                                 //           fontFamily:
//                                 //               FontUtils.montserratMedium,
//                                 //           color: model.ageFocus.hasFocus
//                                 //               ? ColorUtils.purple
//                                 //               : ColorUtils.black),
//                                 //     )
//                                 //   ],
//                                 // ),
//                                 SizedBox(
//                                   height: 5.h,
//                                 ),
//                                 Padding(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 5.w),
//                                   child: Material(
//                                     // color: ColorUtils.almond,
//                                     elevation: model.ageFocus.hasFocus ? 10 : 0,
//                                     shadowColor:
//                                         ColorUtils.border.withOpacity(0.4),
//                                     borderRadius: BorderRadius.circular(24),
//                                     child: TextFormField(
//                                       onTap: () {
//                                         model.notifyListeners();
//                                       },
//                                       validator: (text) {
//                                         if (text == null || text.isEmpty) {
//                                           return 'Please fill this field';
//                                         }
//                                         return null;
//                                       },
//                                       focusNode: model.ageFocus,
//                                       controller: model.age,
//                                       style: TextStyle(
//                                         color: model.ageFocus.hasFocus
//                                             ? ColorUtils.green
//                                             : ColorUtils.black,
//                                       ),
//                                       decoration: InputDecoration(
//                                         focusedBorder: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(24),
//                                             borderSide: BorderSide(
//                                                 color: model.ageFocus.hasFocus
//                                                     ? ColorUtils.green
//                                                     : ColorUtils.black)),
//                                         // errorText: model.validate
//                                         //     ? "Please fill this field"
//                                         //     : null,
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(24),
//                                           borderSide: BorderSide(
//                                             color: model.ageFocus.hasFocus
//                                                 ? ColorUtils.green
//                                                 : ColorUtils.black,
//                                           ),
//                                         ),
//                                         hintText: 'Age',
//                                         //  AppLocalizations.of(context)!
//                                         //     .translate('other_text_19')!,
//                                         hintStyle: TextStyle(
//                                             color: model.ageFocus.hasFocus
//                                                 ? ColorUtils.green
//                                                 : ColorUtils.black),
//                                         prefixIcon: SvgPicture.asset(
//                                           ImageUtils.age,
//                                           color: model.ageFocus.hasFocus
//                                               ? ColorUtils.green
//                                               : ColorUtils.black,
//                                           height: 5.i,
//                                           width: 5.i,
//                                           fit: BoxFit.scaleDown,
//                                         ),
//                                         prefixStyle: TextStyle(
//                                           color: model.ageFocus.hasFocus
//                                               ? ColorUtils.green
//                                               : ColorUtils.black,
//                                         ),
//                                       ),
//                                       keyboardType: TextInputType.number,
//                                       inputFormatters: [
//                                         FilteringTextInputFormatter.digitsOnly,
//                                         LengthLimitingTextInputFormatter(2)
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 3.h,
//                                 ),
//                                 Column(
//                                   children: [
//                                     // Row(
//                                     //   children: [
//                                     //     Text(
//                                     //       "Phone Number:",
//                                     //       style: TextStyle(
//                                     //           fontSize: 2.t,
//                                     //           fontFamily:
//                                     //               FontUtils.montserratMedium,
//                                     //           color: model.phoneFocus.hasFocus
//                                     //               ? ColorUtils.purple
//                                     //               : ColorUtils.black),
//                                     //     )
//                                     //   ],
//                                     // ),
//                                     SizedBox(
//                                       height: 5.h,
//                                     ),
//                                     Padding(
//                                       padding:
//                                           EdgeInsets.symmetric(horizontal: 5.w),
//                                       child: Material(
//                                         // color: ColorUtils.almond,
//                                         elevation:
//                                             model.phoneFocus.hasFocus ? 10 : 0,
//                                         borderRadius: BorderRadius.circular(24),
//                                         shadowColor:
//                                             ColorUtils.border.withOpacity(0.4),
//                                         child: TextFormField(
//                                           onTap: () {
//                                             model.notifyListeners();
//                                           },
//                                           focusNode: model.phoneFocus,
//                                           controller: model.Phone,
//                                           style: TextStyle(
//                                             color: model.phoneFocus.hasFocus
//                                                 ? ColorUtils.green
//                                                 : ColorUtils.black,
//                                           ),
//                                           validator: (text) {
//                                             if (text == null || text.isEmpty) {
//                                               return 'Please fill this field';
//                                             }
//                                             return null;
//                                           },
//                                           decoration: InputDecoration(
//                                             focusedBorder: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(24),
//                                                 borderSide: BorderSide(
//                                                     color: model
//                                                             .phoneFocus.hasFocus
//                                                         ? ColorUtils.green
//                                                         : ColorUtils.black)),
//                                             hintText: 'Phone number',
//                                             hintStyle: TextStyle(
//                                                 color: model.nameFocus.hasFocus
//                                                     ? ColorUtils.green
//                                                     : ColorUtils.black),
//                                             // AppLocalizations.of(context)!
//                                             //     .translate('other_text_20')!,
//                                             // errorText: model.validate ? "Please fill this field" :  null,

//                                             border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(24),
//                                               borderSide: BorderSide(
//                                                 color: model.phoneFocus.hasFocus
//                                                     ? ColorUtils.green
//                                                     : ColorUtils.black,
//                                               ),
//                                             ),
//                                             prefixIcon: SvgPicture.asset(
//                                               ImageUtils.mobile,
//                                               color: model.phoneFocus.hasFocus
//                                                   ? ColorUtils.green
//                                                   : ColorUtils.black,
//                                               height: 5.i,
//                                               fit: BoxFit.scaleDown,
//                                             ),
//                                             prefixStyle: TextStyle(
//                                               color: model.phoneFocus.hasFocus
//                                                   ? ColorUtils.green
//                                                   : ColorUtils.black,
//                                             ),
//                                           ),
//                                           keyboardType: TextInputType.phone,
//                                           inputFormatters: [
//                                             // FilteringTextInputFormatter.digitsOnly,
//                                             LengthLimitingTextInputFormatter(15)
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ]),
//                         ),
//                         SizedBox(
//                           height: 13.h,
//                         ),
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
//                                       model.userExtraInfo();
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
//                         // InkWell(
//                         //     onTap: () {
//                         //       // model.phoneNumber();
//                         //       if (model.formKey.currentState!.validate()) {
//                         //         model.userExtraInfo();
//                         //       }
//                         //     },
//                         //     child:
//                         //      Button(
//                         //         AppLocalizations.of(context)!
//                         //             .translate('other_text_14')!,
//                         //         15)
//                         //         ),
//                       ],
//                     ),
//                   ]),
//                 )),
//               )),
//         );
//       },
//     );
//   }
// }
