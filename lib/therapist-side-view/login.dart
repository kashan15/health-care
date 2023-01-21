import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/forgetpasss/forget_pass_for_therapist.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:soulgood/viewModels/navigation_service.dart';
import 'package:stacked/stacked.dart';

class TherapistLogin extends StatefulWidget {
  const TherapistLogin({Key? key}) : super(key: key);

  @override
  _TherapistLoginState createState() => _TherapistLoginState();
}

class _TherapistLoginState extends State<TherapistLogin> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        // model.isEmailInFocus = false;
        // model.isPasswordInFocus = false;
        model.therapistEmail.clear();
        model.therapistPassword.clear();
        model.sharedPreferences = await SharedPreferences.getInstance();
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: Dimensions.topMargin,
                        ),

                        // DefaultTabController(
                        //   length: 2,
                        //   child: Container(
                        //     decoration: BoxDecoration(color: ColorUtils.baby),
                        //     padding: EdgeInsets.symmetric(
                        //         horizontal: Dimensions.horizontalPadding,
                        //         vertical: 1.h),
                        //     child: Row(
                        //       children: [
                        // Expanded(
                        //   child: TabBar(
                        //       indicatorColor: Colors.transparent,

                        //       // indicatorSize: TabBarIndicatorSize.label,
                        //       // labelPadding:
                        //       // EdgeInsets.symmetric(horizontal: 2.w),
                        //       labelColor: ColorUtils.purple,
                        //       unselectedLabelColor: ColorUtils.border,
                        //       indicator: BoxDecoration(

                        //           color: Colors.white,
                        //           border: Border.all(
                        //               color: ColorUtils.purple)),
                        //       tabs: [
                        //         Tab(
                        //           child: Text("Client"),
                        //         ),
                        //         Tab(
                        //           child: Text("Therapist"),
                        //         ),
                        //       ]),
                        // ),
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: Container(
                        //     width: 25.w,
                        //     height: 5.h,
                        //     decoration: BoxDecoration(
                        //         border:
                        //             Border.all(color: ColorUtils.purple),
                        //         color: ColorUtils.white,
                        //         borderRadius: BorderRadius.circular(4)),
                        //     child: Center(
                        //         child: Text(
                        //       "Client",
                        //       style: TextStyle(
                        //           fontFamily: FontUtils.montserratBold,
                        //           color: ColorUtils.purple,
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: 2.t),
                        //     )),
                        //   ),
                        // ),
                        // SizedBox(
                        //   width: 10.w,
                        // ),
                        // GestureDetector(
                        //   onTap: () {
                        //     // setState(() {
                        //     //   model.selectedBtn1 = !model.selectedBtn1;
                        //     // });
                        //     model.navigateToTherapistLogin();
                        //   },
                        //   child: Container(
                        //     width: 25.w,
                        //     height: 5.h,
                        //     decoration: BoxDecoration(
                        //         border:
                        //             Border.all(color: Colors.transparent),
                        //         color: Colors.transparent,
                        //         borderRadius: BorderRadius.circular(4)),
                        //     child: Center(
                        //         child: Text(
                        //       "Therapist",
                        //       style: TextStyle(
                        //           fontFamily: FontUtils.montserratBold,
                        //           color: ColorUtils.border,
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: 2.t),
                        //     )),
                        //   ),
                        // ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 5.h,
                        // ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.horizontalPadding),
                            child: Column(children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .translate('other_text_73')!,
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratBold,
                                    fontSize: 3.t),
                              ),
                              SizedBox(
                                height: 8.2.h,
                              ),
                              // Text(
                              //   AppLocalizations.of(context)!
                              //       .translate('other_text_69')!,
                              //   style: TextStyle(
                              //       fontFamily: FontUtils.montserratMedium,
                              //       fontSize: 2.t),
                              // ),
                              // SizedBox(
                              //   height: 1.h,
                              // ),
                              // InkWell(
                              //   onTap: () {
                              //     model
                              //         .navigateToOnBoardAppointmentnavigateToOnBoardAppointmentToRegister();
                              //     model.problems = [];
                              //     model.selectedCounsellor = 4;
                              //     model.selectedGender = 5;
                              //     model.tellUsMore.clear();
                              //     model.selectedSuicidalHelp = false;
                              //     model.selectedSuicidalIdea = false;
                              //     model.selectedSuicidal = 3;
                              //     model.notifyListeners();
                              //   },
                              //   child: Text(
                              //     AppLocalizations.of(context)!
                              //         .translate('other_text_70')!,
                              //     style: TextStyle(
                              //         fontFamily: FontUtils.montserratMedium,
                              //         color: ColorUtils.green,
                              //         fontSize: 2.t),
                              //   ),
                              // ),
                              Column(
                                children: [
                                  // Row(
                                  //   children: [
                                  //     Text(
                                  //       "Email:",
                                  //       style: TextStyle(
                                  //           fontSize: 2.t,
                                  //           fontFamily:
                                  //               FontUtils.montserratMedium,
                                  //           color: model.LemailFocus.hasFocus
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
                                        model.therapistEmailFocus.hasFocus
                                            ? 10
                                            : 0,
                                    shadowColor:
                                        ColorUtils.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: model.therapistEmailFocus
                                                      .hasFocus
                                                  ? ColorUtils.green
                                                  : ColorUtils.border),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      // padding: EdgeInsets.symmetric(horizontal: 0.5.w),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          SvgPicture.asset(
                                            ImageUtils.email,
                                            color: model.therapistEmailFocus
                                                    .hasFocus
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
                                              controller: model.therapistEmail,
                                              focusNode:
                                                  model.therapistEmailFocus,
                                              style: TextStyle(
                                                  fontSize: 2.5.t,
                                                  color: model
                                                          .therapistEmailFocus
                                                          .hasFocus
                                                      ? ColorUtils.green
                                                      : ColorUtils.black),
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: AppLocalizations.of(
                                                          context)!
                                                      .translate(
                                                          'other_text_71')!,
                                                  hintStyle: TextStyle(
                                                      color: model
                                                              .therapistEmailFocus
                                                              .hasFocus
                                                          ? ColorUtils.green
                                                          : ColorUtils.black)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
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
                                      //           color:
                                      //               model.LpasswordFocus.hasFocus
                                      //                   ? ColorUtils.purple
                                      //                   : ColorUtils.black),
                                      //     )
                                      //   ],
                                      // ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Material(
                                        borderRadius: BorderRadius.circular(20),
                                        elevation: model
                                                .therapistPasswordFocus.hasFocus
                                            ? 10
                                            : 0,
                                        shadowColor:
                                            ColorUtils.border.withOpacity(0.3),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: model
                                                        .therapistPasswordFocus
                                                        .hasFocus
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
                                                color: model
                                                        .therapistPasswordFocus
                                                        .hasFocus
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

                                                  focusNode: model
                                                      .therapistPasswordFocus,
                                                  controller:
                                                      model.therapistPassword,
                                                  style: TextStyle(
                                                    fontSize: 2.5.t,
                                                    color: model
                                                            .therapistPasswordFocus
                                                            .hasFocus
                                                        ? ColorUtils.green
                                                        : ColorUtils.black,
                                                  ),
                                                  obscureText:
                                                      model.selectedpass,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: AppLocalizations
                                                              .of(context)!
                                                          .translate(
                                                              'other_text_72')!,
                                                      hintStyle: TextStyle(
                                                          color: model
                                                                  .therapistPasswordFocus
                                                                  .hasFocus
                                                              ? ColorUtils.green
                                                              : ColorUtils
                                                                  .black),
                                                      suffixIcon:
                                                          GestureDetector(
                                                              onTap: () {
                                                                model.selectedpass =
                                                                    !model
                                                                        .selectedpass;
                                                                model
                                                                    .notifyListeners();
                                                              },
                                                              child:
                                                                  model.selectedpass ==
                                                                          true
                                                                      ? Icon(
                                                                          Icons
                                                                              .visibility_off,
                                                                          color: model.therapistPasswordFocus.hasFocus
                                                                              ? ColorUtils.green
                                                                              : ColorUtils.black,
                                                                        )
                                                                      : Icon(
                                                                          Icons
                                                                              .visibility,
                                                                          color: model.therapistPasswordFocus.hasFocus
                                                                              ? ColorUtils.green
                                                                              : ColorUtils.black,
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
                                    ],
                                  ),
                                ],
                              ),
                            ])),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: Dimensions.horizontalPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    model.navigation_Service.navigateTo(
                                        to: ForgetPasswordForTherapist());
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .translate('login_text_4')!,
                                    style: TextStyle(
                                        color: ColorUtils.green,
                                        fontFamily: FontUtils.montserratMedium),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          height: 5.h,
                          child: Center(
                            child: model.errorMessage != null
                                ? Text(
                                    model.errorMessage!,
                                    style: TextStyle(
                                      fontFamily: FontUtils.montserratBold,
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
                        //   height: 2.h,
                        // ),
                        model.isLoading3 == true
                            ? SizedBox(
                                height: 4.h,
                                child: CircularProgressIndicator(
                                  color: ColorUtils.green,
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: Dimensions.horizontalPadding),
                                child: InkWell(
                                    onTap: () {
                                      // if (model.clientloginKey.currentState!.validate()) {
                                      //   model.loginAccount();
                                      // }
                                      // model.istherapist = true;
                                      // model.notifyListeners();
                                      model.therapistLoginAccount();
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
                                          color: ColorUtils.green,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 2.h),
                                        child: Center(
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .translate('other_text_73')!,
                                            style: TextStyle(
                                                color: ColorUtils.white,
                                                fontFamily: FontUtils
                                                    .montserratSemiBold),
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                        SizedBox(
                          height: 3.h,
                        ),
                        // Text(
                        //   AppLocalizations.of(context)!
                        //       .translate('other_text_74')!,
                        //   style: TextStyle(
                        //       fontFamily: FontUtils.montserratMedium,
                        //       fontSize: 2.t),
                        // ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     model.googleLoading == true
                        //         ? SizedBox(
                        //             height: 4.h,
                        //             child: CircularProgressIndicator(
                        //               color: ColorUtils.purple,
                        //             ),
                        //           )
                        //         : InkWell(
                        //             onTap: () {
                        //               model.googleLogin();
                        //             },
                        //             child: Image.asset(
                        //               ImageUtils.google,
                        //               scale: 0.6.i,
                        //             ),
                        //           ),
                        //     SizedBox(
                        //       width: 8.w,
                        //     ),
                        //     InkWell(
                        //       onTap: () {
                        //         // setState(() {
                        //         //   // model.email.text.isEmpty
                        //         //   //     ? model.validate = true
                        //         //   //     : model.validate = false;
                        //         // });
                        //         model.logInwithFacebook();
                        //       },
                        //       child: Container(
                        //         padding: EdgeInsets.symmetric(
                        //             horizontal: 4.w, vertical: 0.7.h),
                        //         decoration: BoxDecoration(
                        //             color: ColorUtils.blue,
                        //             borderRadius: BorderRadius.circular(7)),
                        //         child: Image.asset(
                        //           ImageUtils.facebook,
                        //           scale: 0.7.i,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //         AppLocalizations.of(context)!
                        //           .translate('login_text_1')!),
                        //     InkWell(
                        //         onTap: () {
                        //           model
                        //               .navigateToOnBoardAppointmentnavigateToOnBoardAppointmentToRegister();
                        //           model.problems = [];
                        //           model.selectedCounsellor = 4;
                        //           model.selectedGender = 5;
                        //           model.tellUsMore.clear();
                        //           model.selectedSuicidalHelp = false;
                        //           model.selectedSuicidalIdea = false;
                        //           model.selectedSuicidal = 3;
                        //           model.notifyListeners();
                        //         },
                        //         child: Text(
                        //           AppLocalizations.of(context)!
                        //               .translate('other_text_1')!,
                        //           style: TextStyle(
                        //               color: ColorUtils.purple,
                        //               fontFamily: FontUtils.montserratSemiBold),
                        //         )),
                        //   ],
                        // ),

                        // SizedBox(
                        //   height: 4.h,
                        // ),
                        // Container(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: Dimensions.horizontalPadding),
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
                        //       horizontal: Dimensions.horizontalPadding,
                        //       vertical: Dimensions.verticalBtnPadding),
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
                        //                     horizontal: 20.w, vertical: 1.6.h),
                        //                 decoration: BoxDecoration(
                        //                   border: Border.all(
                        //                       color: ColorUtils.greyLight),
                        //                   borderRadius: BorderRadius.circular(7),
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
                        //                           .translate('other_text_9')!,
                        //                       style: TextStyle(
                        //                           color: ColorUtils.black,
                        //                           fontFamily:
                        //                               FontUtils.montserratMedium),
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
                        //           //   // model.email.text.isEmpty
                        //           //   //     ? model.validate = true
                        //           //   //     : model.validate = false;
                        //           // });
                        //           model.logInwithFacebook();
                        //         },
                        //         child: Container(
                        //           padding: EdgeInsets.symmetric(
                        //               horizontal: 20.w, vertical: 1.6.h),
                        //           decoration: BoxDecoration(
                        //               color: ColorUtils.blue,
                        //               borderRadius: BorderRadius.circular(7)),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               Image.asset(
                        //                 ImageUtils.facebook,
                        //                 scale: 1.5.i,
                        //               ),
                        //               SizedBox(
                        //                 width: 2.w,
                        //               ),
                        //               Text(
                        //                 AppLocalizations.of(context)!
                        //                     .translate('other_text_10')!,
                        //                 style: TextStyle(
                        //                     color: ColorUtils.white,
                        //                     fontFamily:
                        //                         FontUtils.montserratMedium),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}

                //   child: Column(
                //     children: [
                //       SizedBox(
                //         height: 2.h,
                //       ),
                //       // ElevatedButton(
                //       //     onPressed: () {
                //       //       model.initForAgora();
                //       //     },
                //       //     child: Text("click me")),
                //       // Container(
                //       //   decoration: BoxDecoration(color: ColorUtils.baby),
                //       //   padding: EdgeInsets.symmetric(
                //       //       horizontal: Dimensions.horizontalPadding,
                //       //       vertical: 1.h),
                //       //   child: Row(
                //       //     children: [
                //       //       GestureDetector(
                //       //         onTap: () {},
                //       //         child: Container(
                //       //           width: 25.w,
                //       //           height: 5.h,
                //       //           decoration: BoxDecoration(
                //       //               border: Border.all(color: ColorUtils.purple),
                //       //               color: ColorUtils.white,
                //       //               borderRadius: BorderRadius.circular(4)),
                //       //           child: Center(
                //       //               child: Text(
                //       //             "Therapist",
                //       //             style: TextStyle(
                //       //                 fontFamily: FontUtils.montserratBold,
                //       //                 color: ColorUtils.purple,
                //       //                 fontWeight: FontWeight.bold,
                //       //                 fontSize: 2.t),
                //       //           )),
                //       //         ),
                //       //       ),
                //       //       SizedBox(
                //       //         width: 10.w,
                //       //       ),
                //       //       GestureDetector(
                //       //         onTap: () {
                //       //           model.navigateToLogin();
                //       //         },
                //       //         child: Container(
                //       //           width: 25.w,
                //       //           height: 5.h,
                //       //           decoration: BoxDecoration(
                //       //               border: Border.all(color: Colors.transparent),
                //       //               color: Colors.transparent,
                //       //               borderRadius: BorderRadius.circular(4)),
                //       //           child: Center(
                //       //               child: Text(
                //       //             "Client",
                //       //             style: TextStyle(
                //       //                 fontFamily: FontUtils.montserratBold,
                //       //                 color: ColorUtils.border,
                //       //                 fontWeight: FontWeight.bold,
                //       //                 fontSize: 2.t),
                //       //           )),
                //       //         ),
                //       //       ),
                //       //     ],
                //       //   ),
                //       // ),
                //       // SizedBox(
                //       //   height: 5.h,
                //       // ),
                //       Container(
                //           padding: EdgeInsets.symmetric(
                //               horizontal: Dimensions.horizontalPadding),
                //           child: Column(children: [
                //             Text(
                //               AppLocalizations.of(context)!
                //                   .translate('login_text_7')!,
                //               style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontFamily: FontUtils.montserratBold,
                //                   fontSize: 3.t),
                //             ),
                //             SizedBox(
                //               height: 5.h,
                //             ),
                //             Column(
                //               children: [
                //                 // Row(
                //                 //   children: [
                //                 //     Text(
                //                 //       "Email:",
                //                 //       style: TextStyle(
                //                 //           fontSize: 2.t,
                //                 //           fontFamily:
                //                 //               FontUtils.montserratMedium,
                //                 //           color:
                //                 //               model.therapistEmailFocus.hasFocus
                //                 //                   ? ColorUtils.purple
                //                 //                   : ColorUtils.black),
                //                 //     )
                //                 //   ],
                //                 // ),
                //                 SizedBox(
                //                   height: 2.h,
                //                 ),
                //                 Material(
                //                   elevation: model.therapistEmailFocus.hasFocus
                //                       ? 10
                //                       : 0,
                //                   shadowColor: ColorUtils.grey.withOpacity(0.3),
                //                   borderRadius: BorderRadius.circular(7),
                //                   child: Container(
                //                     decoration: BoxDecoration(
                //                         border: Border.all(
                //                             color: model.therapistEmailFocus
                //                                     .hasFocus
                //                                 ? ColorUtils.purple
                //                                 : ColorUtils.border),
                //                         borderRadius: BorderRadius.circular(7)),
                //                     // padding: EdgeInsets.symmetric(horizontal: 0.5.w),
                //                     child: Row(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.center,
                //                       children: [
                //                         SizedBox(
                //                           width: 5.w,
                //                         ),
                //                         SvgPicture.asset(
                //                           ImageUtils.email,
                //                           color:
                //                               model.therapistEmailFocus.hasFocus
                //                                   ? ColorUtils.purple
                //                                   : ColorUtils.black,
                //                         ),
                //                         SizedBox(
                //                           width: 5.w,
                //                         ),
                //                         Expanded(
                //                           child: TextFormField(
                //                             onTap: () {
                //                               model.notifyListeners();
                //                             },
                //                             // key: model.sectionFormKey,
                //                             keyboardType:
                //                                 TextInputType.emailAddress,
                //                             controller: model.therapistEmail,
                //                             focusNode:
                //                                 model.therapistEmailFocus,
                //                             style: TextStyle(
                //                                 fontSize: 2.5.t,
                //                                 color: model.therapistEmailFocus
                //                                         .hasFocus
                //                                     ? ColorUtils.purple
                //                                     : ColorUtils.black),
                //                             decoration: InputDecoration(
                //                                 border: InputBorder.none,
                //                                 hintText:
                //                                     // 'Enter your Email Address',
                //                                     AppLocalizations.of(
                //                                             context)!
                //                                         .translate(
                //                                             'other_text_6')!
                //                                 // hintStyle: TextStyle(
                //                                 //     color: ColorUtils.border),
                //                                 ),
                //                             // validator: (value) {
                //                             //   if (value == null || value.isEmpty) {
                //                             //     return 'Please Enter Your Email Address';
                //                             //   }else if(!value.isEmail){
                //                             //     return "Please Enter Correct Email Address";
                //                             //   }
                //                             //   return null;
                //                             // },
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 5.h,
                //                 ),
                //                 Column(
                //                   children: [
                //                     // Row(
                //                     //   children: [
                //                     //     Text(
                //                     //       "Password:",
                //                     //       style: TextStyle(
                //                     //           fontSize: 2.t,
                //                     //           fontFamily:
                //                     //               FontUtils.montserratMedium,
                //                     //           color: model
                //                     //                   .therapistPasswordFocus
                //                     //                   .hasFocus
                //                     //               ? ColorUtils.purple
                //                     //               : ColorUtils.black),
                //                     //     )
                //                     //   ],
                //                     // ),
                //                     SizedBox(
                //                       height: 2.h,
                //                     ),
                //                     Material(
                //                       borderRadius: BorderRadius.circular(7),
                //                       elevation:
                //                           model.therapistPasswordFocus.hasFocus
                //                               ? 10
                //                               : 0,
                //                       shadowColor:
                //                           ColorUtils.border.withOpacity(0.3),
                //                       child: Container(
                //                         decoration: BoxDecoration(
                //                           border: Border.all(
                //                               color: model
                //                                       .therapistPasswordFocus
                //                                       .hasFocus
                //                                   ? ColorUtils.purple
                //                                   : ColorUtils.border),
                //                           borderRadius:
                //                               BorderRadius.circular(7),
                //                         ),
                //                         child: Row(
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.center,
                //                           children: [
                //                             SizedBox(
                //                               width: 5.w,
                //                             ),
                //                             SvgPicture.asset(
                //                               ImageUtils.lock,
                //                               color: model
                //                                       .therapistPasswordFocus
                //                                       .hasFocus
                //                                   ? ColorUtils.purple
                //                                   : ColorUtils.black,
                //                             ),
                //                             SizedBox(
                //                               width: 5.w,
                //                             ),
                //                             Expanded(
                //                               child: TextFormField(
                //                                 onTap: () {
                //                                   model.notifyListeners();
                //                                 },
                //                                 focusNode: model
                //                                     .therapistPasswordFocus,
                //                                 controller:
                //                                     model.therapistPassword,
                //                                 style: TextStyle(
                //                                   fontSize: 2.5.t,
                //                                   color: model
                //                                           .therapistPasswordFocus
                //                                           .hasFocus
                //                                       ? ColorUtils.purple
                //                                       : ColorUtils.black,
                //                                 ),
                //                                 obscureText: model.selectedpass,
                //                                 decoration: InputDecoration(
                //                                     border: InputBorder.none,
                //                                     hintText: AppLocalizations
                //                                             .of(context)!
                //                                         .translate(
                //                                             'other_text_8')!,
                //                                     // hintStyle: TextStyle(
                //                                     //     color:
                //                                     //         ColorUtils.border),
                //                                     suffixIcon: GestureDetector(
                //                                         onTap: () {
                //                                           model.selectedpass =
                //                                               !model
                //                                                   .selectedpass;
                //                                           model
                //                                               .notifyListeners();
                //                                         },
                //                                         child:
                //                                             model.selectedpass ==
                //                                                     true
                //                                                 ? Icon(
                //                                                     Icons
                //                                                         .visibility_off,
                //                                                     color: model
                //                                                             .therapistPasswordFocus
                //                                                             .hasFocus
                //                                                         ? ColorUtils
                //                                                             .purple
                //                                                         : ColorUtils
                //                                                             .black,
                //                                                   )
                //                                                 : Icon(
                //                                                     Icons
                //                                                         .visibility,
                //                                                     color: model
                //                                                             .therapistPasswordFocus
                //                                                             .hasFocus
                //                                                         ? ColorUtils
                //                                                             .purple
                //                                                         : ColorUtils
                //                                                             .black,
                //                                                   ))),
                //                                 // validator: (value) {
                //                                 //   if (value == null || value.isEmpty) {
                //                                 //     return 'Please Enter Your Password';
                //                                 //   }else if(value.){
                //                                 //     return "Your Password Must Have One Capital Letter And One Special Character";
                //                                 //   }
                //                                 //   return null;
                //                                 // },
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ],
                //             ),
                //           ])),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         children: [
                //           TextButton(
                //               onPressed: () {
                //                 model.navigation_Service.navigateTo(
                //                     to: ForgetPasswordForTherapist());
                //               },
                //               child: Text(
                //                 AppLocalizations.of(context)!
                //                     .translate('login_text_4')!,
                //                 style: TextStyle(
                //                     color: ColorUtils.purple,
                //                     fontFamily: FontUtils.montserratRegular),
                //               ))
                //         ],
                //       ),
                //       Container(
                //         height: 5.h,
                //         child: Center(
                //           child: model.errorMessage != null
                //               ? Text(
                //                   model.errorMessage!,
                //                   style: TextStyle(
                //                     fontFamily: FontUtils.montserratBold,
                //                     color: ColorUtils.text_red,
                //                     fontSize: 1.8.t,
                //                   ),
                //                   maxLines: null,
                //                   textAlign: TextAlign.center,
                //                 )
                //               : Container(),
                //         ),
                //       ),
                //       // SizedBox(
                //       //   height: 5.h,
                //       // ),
                //       model.isLoading3 == true
                //           ? SizedBox(
                //               height: 4.h,
                //               child: CircularProgressIndicator(
                //                 color: ColorUtils.purple,
                //               ),
                //             )
                //           : Container(
                //               margin: EdgeInsets.symmetric(
                //                   horizontal: Dimensions.horizontalPadding),
                //               child: InkWell(
                //                   onTap: () {
                //                     model.therapistLoginAccount();
                //                   },
                //                   child: Button(
                //                       'Log In'
                //                       // AppLocalizations.of(context)!.translate('login_text_6')!
                //                       ,
                //                       10)),
                //             ),
                //     ],
                //   ),
                // )),