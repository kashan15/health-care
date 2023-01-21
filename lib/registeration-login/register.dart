import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        model.isEmailInFocus = false;
        model.isPasswordInFocus = false;
        model.email.clear();
        model.cpassword.clear();
        model.password.clear();
        SharedPreferences prefs = await SharedPreferences.getInstance();
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
                  child: Column(children: [
                    SizedBox(
                      height: Dimensions.topMargin,
                    ),
                    Image.asset(
                      ImageUtils.soulgood,
                      height: 10.i,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    // SizedBox(height: 5.h,),
                    // Container(
                    //   decoration: BoxDecoration(color: ColorUtils.baby),
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: Dimensions.horizontalPadding,
                    //       vertical: 1.h),
                    //   child: Row(
                    //     children: [
                    //       GestureDetector(
                    //         onTap: () {
                    //           model.selectedBtn = !model.selectedBtn;
                    //           model.notifyListeners();
                    //         },
                    //         child: Container(
                    //           width: 46.w,
                    //           height: 5.5.h,
                    //           decoration: BoxDecoration(
                    //               border: Border.all(
                    //                   color: model.selectedBtn == true
                    //                       ? ColorUtils.purple
                    //                       : Colors.transparent),
                    //               color: model.selectedBtn == true
                    //                   ? ColorUtils.white
                    //                   : Colors.transparent,
                    //               borderRadius: BorderRadius.circular(4)),
                    //           child: Center(
                    //               child: Text(
                    //             AppLocalizations.of(context)!
                    //                 .translate('other_text_65')!,
                    //             style: TextStyle(
                    //                 fontFamily: FontUtils.montserratBold,
                    //                 color: model.selectedBtn == true
                    //                     ? ColorUtils.purple
                    //                     : ColorUtils.greyLight,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 2.t),
                    //           )),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 10.w,
                    //       ),
                    //       GestureDetector(
                    //         onTap: () {
                    //           setState(() {
                    //             model.selectedBtn;
                    //           });
                    //           model.navigateToLoginTabBar();
                    //         },
                    //         child: Container(
                    //           width: 25.w,
                    //           height: 5.h,
                    //           decoration: BoxDecoration(
                    //               border: Border.all(
                    //                   color: model.selectedBtn == false
                    //                       ? ColorUtils.purple
                    //                       : Colors.transparent),
                    //               color: model.selectedBtn == false
                    //                   ? ColorUtils.white
                    //                   : Colors.transparent,
                    //               borderRadius: BorderRadius.circular(4)),
                    //           child: Center(
                    //               child: Text(
                    //             AppLocalizations.of(context)!
                    //                 .translate('login_text_6')!,
                    //             style: TextStyle(
                    //                 fontFamily: FontUtils.montserratBold,
                    //                 color: model.selectedBtn == false
                    //                     ? ColorUtils.purple
                    //                     : ColorUtils.greyLight,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 2.t),
                    //           )),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 5.h,
                    // ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.horizontalPadding),
                      child: Column(
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .translate('other_text_1')!,
                            style: TextStyle(
                                fontFamily: FontUtils.montserratBold,
                                fontSize: 3.t),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .translate('signup_text_2')!,
                            style: TextStyle(
                                fontFamily: FontUtils.montserratMedium,
                                fontSize: 2.t),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          InkWell(
                            onTap: () {
                              model.navigateToLoginTabBar();
                            },
                            child: Text(
                              AppLocalizations.of(context)!
                                  .translate('other_text_73')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratMedium,
                                  color: ColorUtils.green,
                                  fontSize: 2.t),
                            ),
                          ),
                          // ElevatedButton(
                          //     onPressed: () {
                          //       model.registerUser();
                          //     },
                          //     child: Text("get")),
                          SizedBox(
                            height: 5.h,
                          ),
                          Column(children: [
                            // Row(
                            //   children: [
                            //     Text(
                            //       "Email:",
                            //       style: TextStyle(
                            //           fontSize: 2.t,
                            //           fontFamily: FontUtils.montserratMedium,
                            //           color: model.emailFocus.hasFocus
                            //               ? ColorUtils.purple
                            //               : ColorUtils.black),
                            //     )
                            //   ],
                            // ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Material(
                              elevation: model.emailFocus.hasFocus ? 10 : 0,
                              shadowColor: ColorUtils.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: model.emailFocus.hasFocus
                                            ? ColorUtils.green
                                            : ColorUtils.border),
                                    borderRadius: BorderRadius.circular(20)),
                                // padding: EdgeInsets.symmetric(horizontal: 0.5.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    SvgPicture.asset(
                                      ImageUtils.email,
                                      color: model.emailFocus.hasFocus
                                          ? ColorUtils.green
                                          : ColorUtils.black,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        onTap: () {
                                          model.notifyListeners();
                                        },
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller: model.email,
                                        focusNode: model.emailFocus,
                                        style: TextStyle(
                                            fontSize: 2.5.t,
                                            color: model.emailFocus.hasFocus
                                                ? ColorUtils.green
                                                : ColorUtils.black),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: AppLocalizations.of(
                                                    context)!
                                                .translate('other_text_71')!,
                                            hintStyle: TextStyle(
                                                color: model.emailFocus.hasFocus
                                                    ? ColorUtils.green
                                                    : ColorUtils.black)
                                            // AppLocalizations.of(context)!
                                            //     .translate('other_text_6')!,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
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
                                //       "Password:",
                                //       style: TextStyle(
                                //           fontSize: 2.t,
                                //           fontFamily:
                                //               FontUtils.montserratMedium,
                                //           color: model.passwordFocus.hasFocus
                                //               ? ColorUtils.purple
                                //               : ColorUtils.black),
                                //     )
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 2.h,
                                // ),
                                Material(
                                  borderRadius: BorderRadius.circular(20),
                                  elevation:
                                      model.passwordFocus.hasFocus ? 10 : 0,
                                  shadowColor:
                                      ColorUtils.border.withOpacity(0.3),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: model.passwordFocus.hasFocus
                                              ? ColorUtils.green
                                              : ColorUtils.border),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        SvgPicture.asset(
                                          ImageUtils.lock,
                                          color: model.passwordFocus.hasFocus
                                              ? ColorUtils.green
                                              : ColorUtils.black,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            onTap: () {
                                              model.notifyListeners();
                                            },

                                            focusNode: model.passwordFocus,
                                            controller: model.password,
                                            style: TextStyle(
                                              fontSize: 2.5.t,
                                              color:
                                                  model.passwordFocus.hasFocus
                                                      ? ColorUtils.green
                                                      : ColorUtils.black,
                                            ),
                                            obscureText: model.selectedpass,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: AppLocalizations.of(
                                                        context)!
                                                    .translate(
                                                        'other_text_72')!,
                                                hintStyle: TextStyle(
                                                    color: model.passwordFocus
                                                            .hasFocus
                                                        ? ColorUtils.green
                                                        : ColorUtils.black)
                                                // AppLocalizations.of(
                                                //         context)!
                                                //     .translate('other_text_8')!
                                                ,
                                                suffixIcon: GestureDetector(
                                                    onTap: () {
                                                      model.selectedpass =
                                                          !model.selectedpass;
                                                      model.notifyListeners();
                                                    },
                                                    child: model.selectedpass ==
                                                            true
                                                        ? Icon(
                                                            Icons
                                                                .visibility_off,
                                                            color: model
                                                                    .passwordFocus
                                                                    .hasFocus
                                                                ? ColorUtils
                                                                    .green
                                                                : ColorUtils
                                                                    .black,
                                                          )
                                                        : Icon(
                                                            Icons.visibility,
                                                            color: model
                                                                    .passwordFocus
                                                                    .hasFocus
                                                                ? ColorUtils
                                                                    .green
                                                                : ColorUtils
                                                                    .black,
                                                          ))),
                                            // validator: (text) {
                                            //   if (text == null ||
                                            //       text.isEmpty) {
                                            //     return 'Please fill this field';
                                            //   }
                                            //   return null;
                                            // },
                                          ),
                                        ),
                                      ],
                                    ),
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
                                    //       "Confirm Password:",
                                    //       style: TextStyle(
                                    //           fontSize: 2.t,
                                    //           fontFamily:
                                    //               FontUtils.montserratMedium,
                                    //           color:
                                    //               model.CpasswordFocus.hasFocus
                                    //                   ? ColorUtils.purple
                                    //                   : ColorUtils.black),
                                    //     )
                                    //   ],
                                    // ),
                                    // SizedBox(
                                    //   height: 2.h,
                                    // ),
                                    Material(
                                      borderRadius: BorderRadius.circular(20),
                                      elevation: model.CpasswordFocus.hasFocus
                                          ? 10
                                          : 0,
                                      shadowColor:
                                          ColorUtils.border.withOpacity(0.3),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  model.CpasswordFocus.hasFocus
                                                      ? ColorUtils.green
                                                      : ColorUtils.border),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            SvgPicture.asset(
                                              ImageUtils.lock,
                                              color:
                                                  model.CpasswordFocus.hasFocus
                                                      ? ColorUtils.green
                                                      : ColorUtils.black,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Expanded(
                                              child: TextFormField(
                                                onTap: () {
                                                  model.notifyListeners();
                                                },
                                                focusNode: model.CpasswordFocus,
                                                controller: model.cpassword,
                                                style: TextStyle(
                                                  fontSize: 2.5.t,
                                                  color: model.CpasswordFocus
                                                          .hasFocus
                                                      ? ColorUtils.green
                                                      : ColorUtils.black,
                                                ),
                                                obscureText:
                                                    model.cselectedpass,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: AppLocalizations
                                                            .of(context)!
                                                        .translate(
                                                            'other_text_76')!,
                                                    hintStyle: TextStyle(
                                                        color: model
                                                                .CpasswordFocus
                                                                .hasFocus
                                                            ? ColorUtils.green
                                                            : ColorUtils.black)
                                                    // AppLocalizations.of(
                                                    //         context)!
                                                    //     .translate(
                                                    //         'other_text_11')!
                                                    ,
                                                    suffixIcon: GestureDetector(
                                                        onTap: () {
                                                          model.cselectedpass =
                                                              !model
                                                                  .cselectedpass;
                                                          model
                                                              .notifyListeners();
                                                        },
                                                        child:
                                                            model.cselectedpass ==
                                                                    true
                                                                ? Icon(
                                                                    Icons
                                                                        .visibility_off,
                                                                    color: model
                                                                            .CpasswordFocus
                                                                            .hasFocus
                                                                        ? ColorUtils
                                                                            .green
                                                                        : ColorUtils
                                                                            .black,
                                                                  )
                                                                : Icon(
                                                                    Icons
                                                                        .visibility,
                                                                    color: model
                                                                            .CpasswordFocus
                                                                            .hasFocus
                                                                        ? ColorUtils
                                                                            .green
                                                                        : ColorUtils
                                                                            .black,
                                                                  ))),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 5.h,
                                      child: Center(
                                        child: model.errorMessage != null
                                            ? Text(
                                                model.errorMessage!,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FontUtils.montserratBold,
                                                  color: ColorUtils.text_red,
                                                  fontSize: 1.8.t,
                                                ),
                                                maxLines: null,
                                                textAlign: TextAlign.center,
                                              )
                                            : Container(),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 3.h,
                                    // ),
                                    model.isLoading == true
                                        ? SizedBox(
                                            height: 4.h,
                                            child: CircularProgressIndicator(
                                              color: ColorUtils.green,
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              model.createAccount();
                                              // setState(() {
                                              //   model.email.text.isEmpty ? model.validate = true : model.validate = false;
                                              // });
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 6,
                                                        offset: Offset(0, 10),
                                                        color: ColorUtils.grey
                                                            .withOpacity(0.2))
                                                  ],
                                                  color: ColorUtils.navy,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 2.h),
                                                child: Center(
                                                  child: Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .translate(
                                                            'signup_text_4')!,
                                                    style: TextStyle(
                                                        color: ColorUtils.white,
                                                        fontFamily: FontUtils
                                                            .montserratSemiBold),
                                                  ),
                                                ),
                                              ),
                                            ))
                                  ],
                                ),
                              ],
                            ),
                          ]),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .translate('other_text_75')!,
                            style: TextStyle(
                                fontFamily: FontUtils.montserratMedium,
                                fontSize: 2.t),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              model.googleLoading == true
                                  ? SizedBox(
                                      height: 4.h,
                                      child: CircularProgressIndicator(
                                        color: ColorUtils.purple,
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        model.googleLogin();
                                      },
                                      child: Image.asset(
                                        ImageUtils.google,
                                        scale: 0.6.i,
                                      ),
                                    ),
                              SizedBox(
                                width: 8.w,
                              ),
                              InkWell(
                                onTap: () {
                                  // setState(() {
                                  //   // model.email.text.isEmpty
                                  //   //     ? model.validate = true
                                  //   //     : model.validate = false;
                                  // });
                                  model.logInwithFacebook();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.w, vertical: 0.7.h),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.blue,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Image.asset(
                                    ImageUtils.facebook,
                                    scale: 0.7.i,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 4.h,
                          // ),
                          // Container(
                          //   padding: EdgeInsets.symmetric(horizontal: 5),
                          //   child: Row(
                          //     children: [
                          //       Expanded(
                          //           child: Divider(
                          //         color: ColorUtils.greyLight,
                          //         thickness: 2,
                          //       )),
                          //       SizedBox(
                          //         width: 4.w,
                          //       ),
                          //       Text(
                          //         AppLocalizations.of(context)!
                          //             .translate('login_text_5')!,
                          //         style: TextStyle(color: ColorUtils.border),
                          //       ),
                          //       SizedBox(
                          //         width: 4.w,
                          //       ),
                          //       Expanded(
                          //           child: Divider(
                          //         color: ColorUtils.greyLight,
                          //         thickness: 2,
                          //       )),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 5.h,
                          // ),
                          // Container(
                          //   padding: EdgeInsets.symmetric(
                          //     horizontal: 5,
                          //   ),
                          //   child: Column(
                          //     children: [
                          //       model.googleLoading == true
                          //           ? SizedBox(
                          //               height: 4.h,
                          //               child: CircularProgressIndicator(
                          //                 color: ColorUtils.purple,
                          //               ),
                          //             )
                          //           : InkWell(
                          //               onTap: () {
                          //                 model.googleLogin();
                          //               },
                          //               child: Container(
                          //                 padding: EdgeInsets.symmetric(
                          //                     horizontal: 20.w, vertical: 2.h),
                          //                 decoration: BoxDecoration(
                          //                   border: Border.all(
                          //                       color: ColorUtils.greyLight),
                          //                   borderRadius:
                          //                       BorderRadius.circular(7),
                          //                 ),
                          //                 child: Row(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.center,
                          //                   children: [
                          //                     Image.asset(
                          //                       ImageUtils.google,
                          //                       scale: 1.5.i,
                          //                     ),
                          //                     SizedBox(
                          //                       width: 3.w,
                          //                     ),
                          //                     Text(
                          //                       AppLocalizations.of(context)!
                          //                           .translate(
                          //                               'other_text_31')!,
                          //                       style: TextStyle(
                          //                           color: ColorUtils.black,
                          //                           fontFamily: FontUtils
                          //                               .montserratMedium),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //       SizedBox(
                          //         height: 3.h,
                          //       ),
                          //       InkWell(
                          //         onTap: () {
                          //           // setState(() {
                          //           //   model.email.text.isEmpty
                          //           //       ? model.validate = true
                          //           //       : model.validate = false;
                          //           // });
                          //           model.logInwithFacebook();
                          //         },
                          //         child: Container(
                          //           padding: EdgeInsets.symmetric(
                          //               horizontal: 11.w, vertical: 2.h),
                          //           decoration: BoxDecoration(
                          //               color: ColorUtils.blue,
                          //               borderRadius: BorderRadius.circular(7)),
                          //           child: Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.center,
                          //             children: [
                          //               Image.asset(
                          //                 ImageUtils.facebook,
                          //                 scale: 1.5.i,
                          //               ),
                          //               SizedBox(
                          //                 width: 3.w,
                          //               ),
                          //               Text(
                          //                 AppLocalizations.of(context)!
                          //                     .translate('other_text_32')!,
                          //                 style: TextStyle(
                          //                     color: ColorUtils.white,
                          //                     fontFamily:
                          //                         FontUtils.montserratMedium,
                          //                     fontWeight: FontWeight.bold),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 2.h,
                          // )
                        ],
                      ),
                    ),
                  ]),
                ),
              )),
        );
      },
    );
  }
}

/// OLD CODE

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:soulgood/Widget/button.dart';
// import 'package:soulgood/app/locator.dart';
// import 'package:soulgood/utils/app_localization.dart';
// import 'package:soulgood/utils/color_utils.dart';
// import 'package:soulgood/utils/dimensions.dart';
// import 'package:soulgood/utils/extensions.dart';
// import 'package:soulgood/utils/font_utils.dart';
// import 'package:soulgood/utils/image_utils.dart';
// import 'package:soulgood/viewModels/main_view_model.dart';
// import 'package:stacked/stacked.dart';

// class Register extends StatefulWidget {
//   @override
//   _RegisterState createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<MainViewModel>.reactive(
//       viewModelBuilder: () => locator<MainViewModel>(),
//       disposeViewModel: false,
//       onModelReady: (model) async {
//         model.isEmailInFocus = false;
//         model.isPasswordInFocus = false;
//         model.email.clear();
//         model.cpassword.clear();
//         model.password.clear();
//         SharedPreferences prefs = await SharedPreferences.getInstance();
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
//                 backgroundColor: Colors.white,
//                 body: SingleChildScrollView(
//                   child: Column(children: [
//                     SizedBox(
//                       height: Dimensions.topMargin,
//                     ),

//                     // SizedBox(height: 5.h,),
//                     Container(
//                       decoration: BoxDecoration(color: ColorUtils.baby),
//                       padding: EdgeInsets.symmetric(
//                           horizontal: Dimensions.horizontalPadding,
//                           vertical: 1.h),
//                       child: Row(
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               model.selectedBtn = !model.selectedBtn;
//                               model.notifyListeners();
//                             },
//                             child: Container(
//                               width: 46.w,
//                               height: 5.5.h,
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: model.selectedBtn == true
//                                           ? ColorUtils.purple
//                                           : Colors.transparent),
//                                   color: model.selectedBtn == true
//                                       ? ColorUtils.white
//                                       : Colors.transparent,
//                                   borderRadius: BorderRadius.circular(4)),
//                               child: Center(
//                                   child: Text(
//                                 "Register",
//                                 style: TextStyle(
//                                     fontFamily: FontUtils.montserratBold,
//                                     color: model.selectedBtn == true
//                                         ? ColorUtils.purple
//                                         : ColorUtils.greyLight,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 2.t),
//                               )),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10.w,
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 model.selectedBtn;
//                               });
//                               model.navigateToLoginTabBar();
//                             },
//                             child: Container(
//                               width: 25.w,
//                               height: 5.h,
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: model.selectedBtn == false
//                                           ? ColorUtils.purple
//                                           : Colors.transparent),
//                                   color: model.selectedBtn == false
//                                       ? ColorUtils.white
//                                       : Colors.transparent,
//                                   borderRadius: BorderRadius.circular(4)),
//                               child: Center(
//                                   child: Text(
//                                 "Login",
//                                 style: TextStyle(
//                                     fontFamily: FontUtils.montserratBold,
//                                     color: model.selectedBtn == false
//                                         ? ColorUtils.purple
//                                         : ColorUtils.greyLight,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 2.t),
//                               )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5.h,
//                     ),
//                     Container(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: Dimensions.horizontalPadding),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 AppLocalizations.of(context)!
//                                     .translate('signup_text_1')!,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontFamily: FontUtils.montserratBold,
//                                     fontSize: 4.t),
//                               ),
//                             ],
//                           ),
//                           // ElevatedButton(
//                           //     onPressed: () {
//                           //       model.registerUser();
//                           //     },
//                           //     child: Text("get")),
//                           SizedBox(
//                             height: 5.h,
//                           ),
//                           Column(children: [
//                             // Row(
//                             //   children: [
//                             //     Text(
//                             //       "Email:",
//                             //       style: TextStyle(
//                             //           fontSize: 2.t,
//                             //           fontFamily: FontUtils.montserratMedium,
//                             //           color: model.emailFocus.hasFocus
//                             //               ? ColorUtils.purple
//                             //               : ColorUtils.black),
//                             //     )
//                             //   ],
//                             // ),
//                             SizedBox(
//                               height: 2.h,
//                             ),
//                             Material(
//                               elevation: model.emailFocus.hasFocus ? 10 : 0,
//                               shadowColor: ColorUtils.grey.withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(7),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: model.emailFocus.hasFocus
//                                             ? ColorUtils.purple
//                                             : ColorUtils.border),
//                                     borderRadius: BorderRadius.circular(7)),
//                                 // padding: EdgeInsets.symmetric(horizontal: 0.5.w),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     SizedBox(
//                                       width: 5.w,
//                                     ),
//                                     SvgPicture.asset(
//                                       ImageUtils.email,
//                                       color: model.emailFocus.hasFocus
//                                           ? ColorUtils.purple
//                                           : ColorUtils.black,
//                                     ),
//                                     SizedBox(
//                                       width: 5.w,
//                                     ),
//                                     Expanded(
//                                       child: TextFormField(
//                                         onTap: () {
//                                           model.notifyListeners();
//                                         },
//                                         keyboardType:
//                                             TextInputType.emailAddress,
//                                         controller: model.email,
//                                         focusNode: model.emailFocus,
//                                         style: TextStyle(
//                                             fontSize: 2.5.t,
//                                             color: model.emailFocus.hasFocus
//                                                 ? ColorUtils.purple
//                                                 : ColorUtils.black),
//                                         decoration: const InputDecoration(
//                                           border: InputBorder.none,
//                                           hintText: 'Enter your Email Address',
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 4.h,
//                             ),
//                             Column(
//                               children: [
//                                 // Row(
//                                 //   children: [
//                                 //     Text(
//                                 //       "Password:",
//                                 //       style: TextStyle(
//                                 //           fontSize: 2.t,
//                                 //           fontFamily:
//                                 //               FontUtils.montserratMedium,
//                                 //           color: model.passwordFocus.hasFocus
//                                 //               ? ColorUtils.purple
//                                 //               : ColorUtils.black),
//                                 //     )
//                                 //   ],
//                                 // ),
//                                 // SizedBox(
//                                 //   height: 2.h,
//                                 // ),
//                                 Material(
//                                   borderRadius: BorderRadius.circular(7),
//                                   elevation:
//                                       model.passwordFocus.hasFocus ? 10 : 0,
//                                   shadowColor:
//                                       ColorUtils.border.withOpacity(0.3),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: model.passwordFocus.hasFocus
//                                               ? ColorUtils.purple
//                                               : ColorUtils.border),
//                                       borderRadius: BorderRadius.circular(7),
//                                     ),
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         SizedBox(
//                                           width: 5.w,
//                                         ),
//                                         SvgPicture.asset(
//                                           ImageUtils.lock,
//                                           color: model.passwordFocus.hasFocus
//                                               ? ColorUtils.purple
//                                               : ColorUtils.black,
//                                         ),
//                                         SizedBox(
//                                           width: 5.w,
//                                         ),
//                                         Expanded(
//                                           child: TextFormField(
//                                             onTap: () {
//                                               model.notifyListeners();
//                                             },

//                                             focusNode: model.passwordFocus,
//                                             controller: model.password,
//                                             style: TextStyle(
//                                               fontSize: 2.5.t,
//                                               color:
//                                                   model.passwordFocus.hasFocus
//                                                       ? ColorUtils.purple
//                                                       : ColorUtils.black,
//                                             ),
//                                             obscureText: model.selectedpass,
//                                             decoration: InputDecoration(
//                                                 border: InputBorder.none,
//                                                 hintText: AppLocalizations.of(
//                                                         context)!
//                                                     .translate('other_text_8')!,
//                                                 suffixIcon: GestureDetector(
//                                                     onTap: () {
//                                                       model.selectedpass =
//                                                           !model.selectedpass;
//                                                       model.notifyListeners();
//                                                     },
//                                                     child: model.selectedpass ==
//                                                             true
//                                                         ? Icon(
//                                                             Icons
//                                                                 .visibility_off,
//                                                             color: model
//                                                                     .passwordFocus
//                                                                     .hasFocus
//                                                                 ? ColorUtils
//                                                                     .purple
//                                                                 : ColorUtils
//                                                                     .black,
//                                                           )
//                                                         : Icon(
//                                                             Icons.visibility,
//                                                             color: model
//                                                                     .passwordFocus
//                                                                     .hasFocus
//                                                                 ? ColorUtils
//                                                                     .purple
//                                                                 : ColorUtils
//                                                                     .black,
//                                                           ))),
//                                             // validator: (text) {
//                                             //   if (text == null ||
//                                             //       text.isEmpty) {
//                                             //     return 'Please fill this field';
//                                             //   }
//                                             //   return null;
//                                             // },
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 4.h,
//                                 ),
//                                 Column(
//                                   children: [
//                                     // Row(
//                                     //   children: [
//                                     //     Text(
//                                     //       "Confirm Password:",
//                                     //       style: TextStyle(
//                                     //           fontSize: 2.t,
//                                     //           fontFamily:
//                                     //               FontUtils.montserratMedium,
//                                     //           color:
//                                     //               model.CpasswordFocus.hasFocus
//                                     //                   ? ColorUtils.purple
//                                     //                   : ColorUtils.black),
//                                     //     )
//                                     //   ],
//                                     // ),
//                                     // SizedBox(
//                                     //   height: 2.h,
//                                     // ),
//                                     Material(
//                                       borderRadius: BorderRadius.circular(7),
//                                       elevation: model.CpasswordFocus.hasFocus
//                                           ? 10
//                                           : 0,
//                                       shadowColor:
//                                           ColorUtils.border.withOpacity(0.3),
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           border: Border.all(
//                                               color:
//                                                   model.CpasswordFocus.hasFocus
//                                                       ? ColorUtils.purple
//                                                       : ColorUtils.border),
//                                           borderRadius:
//                                               BorderRadius.circular(7),
//                                         ),
//                                         child: Row(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             SizedBox(
//                                               width: 5.w,
//                                             ),
//                                             SvgPicture.asset(
//                                               ImageUtils.lock,
//                                               color:
//                                                   model.CpasswordFocus.hasFocus
//                                                       ? ColorUtils.purple
//                                                       : ColorUtils.black,
//                                             ),
//                                             SizedBox(
//                                               width: 5.w,
//                                             ),
//                                             Expanded(
//                                               child: TextFormField(
//                                                 onTap: () {
//                                                   model.notifyListeners();
//                                                 },
//                                                 focusNode: model.CpasswordFocus,
//                                                 controller: model.cpassword,
//                                                 style: TextStyle(
//                                                   fontSize: 2.5.t,
//                                                   color: model.CpasswordFocus
//                                                           .hasFocus
//                                                       ? ColorUtils.purple
//                                                       : ColorUtils.black,
//                                                 ),
//                                                 obscureText:
//                                                     model.cselectedpass,
//                                                 decoration: InputDecoration(
//                                                     border: InputBorder.none,
//                                                     hintText:
//                                                         // 'Enter your Confirm Password',
//                                                         AppLocalizations.of(
//                                                                 context)!
//                                                             .translate(
//                                                                 'other_text_11')!,
//                                                     suffixIcon: GestureDetector(
//                                                         onTap: () {
//                                                           model.cselectedpass =
//                                                               !model
//                                                                   .cselectedpass;
//                                                           model
//                                                               .notifyListeners();
//                                                         },
//                                                         child:
//                                                             model.cselectedpass ==
//                                                                     true
//                                                                 ? Icon(
//                                                                     Icons
//                                                                         .visibility_off,
//                                                                     color: model
//                                                                             .CpasswordFocus
//                                                                             .hasFocus
//                                                                         ? ColorUtils
//                                                                             .purple
//                                                                         : ColorUtils
//                                                                             .black,
//                                                                   )
//                                                                 : Icon(
//                                                                     Icons
//                                                                         .visibility,
//                                                                     color: model
//                                                                             .CpasswordFocus
//                                                                             .hasFocus
//                                                                         ? ColorUtils
//                                                                             .purple
//                                                                         : ColorUtils
//                                                                             .black,
//                                                                   ))),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     Container(
//                                       height: 5.h,
//                                       child: Center(
//                                         child: model.errorMessage != null
//                                             ? Text(
//                                                 model.errorMessage!,
//                                                 style: TextStyle(
//                                                   fontFamily:
//                                                       FontUtils.montserratBold,
//                                                   color: ColorUtils.text_red,
//                                                   fontSize: 1.8.t,
//                                                 ),
//                                                 maxLines: null,
//                                                 textAlign: TextAlign.center,
//                                               )
//                                             : Container(),
//                                       ),
//                                     ),
//                                     // SizedBox(
//                                     //   height: 3.h,
//                                     // ),
//                                     model.isLoading == true
//                                         ? SizedBox(
//                                             height: 4.h,
//                                             child: CircularProgressIndicator(
//                                               color: ColorUtils.purple,
//                                             ),
//                                           )
//                                         : InkWell(
//                                             onTap: () {
//                                               model.createAccount();
//                                               // setState(() {
//                                               //   model.email.text.isEmpty ? model.validate = true : model.validate = false;
//                                               // });
//                                             },
//                                             child: Button(
//                                                 AppLocalizations.of(context)!
//                                                     .translate(
//                                                         'signup_text_4')!,
//                                                 10)),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ]),
//                           SizedBox(
//                             height: 4.h,
//                           ),
//                           Container(
//                             padding: EdgeInsets.symmetric(horizontal: 5),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                     child: Divider(
//                                   color: ColorUtils.greyLight,
//                                   thickness: 2,
//                                 )),
//                                 SizedBox(
//                                   width: 4.w,
//                                 ),
//                                 Text(
//                                   AppLocalizations.of(context)!
//                                       .translate('login_text_5')!,
//                                   style: TextStyle(color: ColorUtils.border),
//                                 ),
//                                 SizedBox(
//                                   width: 4.w,
//                                 ),
//                                 Expanded(
//                                     child: Divider(
//                                   color: ColorUtils.greyLight,
//                                   thickness: 2,
//                                 )),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5.h,
//                           ),
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 5,
//                             ),
//                             child: Column(
//                               children: [
//                                 model.googleLoading == true
//                                     ? SizedBox(
//                                         height: 4.h,
//                                         child: CircularProgressIndicator(
//                                           color: ColorUtils.purple,
//                                         ),
//                                       )
//                                     : InkWell(
//                                         onTap: () {
//                                           model.googleLogin();
//                                         },
//                                         child: Container(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 20.w, vertical: 2.h),
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 color: ColorUtils.greyLight),
//                                             borderRadius:
//                                                 BorderRadius.circular(7),
//                                           ),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Image.asset(
//                                                 ImageUtils.google,
//                                                 scale: 1.5.i,
//                                               ),
//                                               SizedBox(
//                                                 width: 3.w,
//                                               ),
//                                               Text(
//                                                 AppLocalizations.of(context)!
//                                                     .translate(
//                                                         'other_text_31')!,
//                                                 style: TextStyle(
//                                                     color: ColorUtils.black,
//                                                     fontFamily: FontUtils
//                                                         .montserratMedium),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                 SizedBox(
//                                   height: 3.h,
//                                 ),
//                                 InkWell(
//                                   onTap: () {
//                                     model.facebookLogin();
//                                   },
//                                   child: Container(
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 11.w, vertical: 2.h),
//                                     decoration: BoxDecoration(
//                                         color: ColorUtils.blue,
//                                         borderRadius: BorderRadius.circular(7)),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Image.asset(
//                                           ImageUtils.facebook,
//                                           scale: 1.5.i,
//                                         ),
//                                         SizedBox(
//                                           width: 3.w,
//                                         ),
//                                         Text(
//                                           AppLocalizations.of(context)!
//                                               .translate('other_text_32')!,
//                                           style: TextStyle(
//                                               color: ColorUtils.white,
//                                               fontFamily:
//                                                   FontUtils.montserratMedium,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 2.h,
//                           )
//                         ],
//                       ),
//                     ),
//                   ]),
//                 ),
//               )),
//         );
//       },
//     );
//   }
// }
