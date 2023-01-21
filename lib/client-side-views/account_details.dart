import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/Widget/error_widget.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/client-side-views/payment_success.dart';
import 'package:soulgood/main.dart';
import 'package:soulgood/utils/app_language.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dialog_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.emergencyContact();
        // model.changePassword();
      },
      builder: (context, model, child) {
        return SafeArea(
          top: false,
          bottom: false,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              model.changeName.clear();

              model.currentPassword.clear();
              model.newPassword.clear();
              model.confirmPassword.clear();
            },
            child: Scaffold(
              backgroundColor: ColorUtils.almond,
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimensions.topMargin,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.horizontalPadding),
                      child: Column(children: [
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
                            Text(
                              AppLocalizations.of(context)!
                                  .translate('user_acc_detail_text_1')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 2.5.t),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                      ]),
                    ),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       if (model.selectedAppLanguage == 0) {
                    //         model.appLanguage.changeLanguage(Locale('en'));

                    //       }
                    //       model.appLanguage.changeLanguage(Locale('en'));
                    //     },
                    //     child: Text("dsfa")),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.horizontalPadding,
                          vertical: 1.h),
                      decoration: BoxDecoration(
                          color: ColorUtils.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .translate('user_acc_detail_text_2')!,
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratMedium,
                                    fontSize: 1.5.t),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                model.username,
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratMedium,
                                    fontSize: 2.t),
                              )
                            ],
                          )),
                          InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 2.w, vertical: 1.h),
                                          content: SizedBox(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    model.changeName.clear();
                                                    model.navigateBack();
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      SvgPicture.asset(
                                                        ImageUtils.close,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5.w),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .translate(
                                                                'user_change_name_text_1')!,
                                                        style: TextStyle(
                                                          fontFamily: FontUtils
                                                              .montserratBold,
                                                          fontSize: 2.t,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Material(
                                                        elevation: 10,
                                                        shadowColor: ColorUtils
                                                            .grey
                                                            .withOpacity(0.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: ColorUtils
                                                                      .border),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)),
                                                          // padding: EdgeInsets.symmetric(horizontal: 0.5.w),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 5.w,
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    TextFormField(
                                                                  controller: model
                                                                      .changeName,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  // inputFormatters: [
                                                                  //   LengthLimitingTextInputFormatter(
                                                                  //       18)
                                                                  // ],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          2.5.t,
                                                                      fontFamily:
                                                                          FontUtils
                                                                              .montserratBold),
                                                                  decoration:
                                                                      const InputDecoration(
                                                                    border:
                                                                        InputBorder
                                                                            .none,
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
                                                      Text(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .translate(
                                                                'user_acc_detail_text_20')!,
                                                        style: TextStyle(
                                                            fontFamily: FontUtils
                                                                .montserratRegular,
                                                            fontSize: 1.5.t),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        height: 7.h,
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            model
                                                                .userChangeName();
                                                            model
                                                                .navigateBack();
                                                            model.changeName
                                                                .clear();
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    ColorUtils
                                                                        .green,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          1.7.h),
                                                              child: Center(
                                                                child: Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .translate(
                                                                          'user_db_journal_text_8')!,
                                                                  style: TextStyle(
                                                                      color: ColorUtils
                                                                          .white,
                                                                      fontFamily:
                                                                          FontUtils
                                                                              .montserratSemiBold),
                                                                ),
                                                              ),
                                                            ),
                                                          )),
                                                      SizedBox(
                                                        height: 2.h,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ));
                              },
                              child: Text(
                                AppLocalizations.of(context)!
                                    .translate('user_acc_detail_text_14')!,
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratBold,
                                    fontSize: 1.8.t,
                                    color: ColorUtils.cyan),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.horizontalPadding,
                          vertical: 1.h),
                      decoration: BoxDecoration(
                          color: ColorUtils.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .translate('user_acc_detail_text_4')!,
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratMedium,
                                    fontSize: 1.5.t),
                              ),
                              Text(
                                AppLocalizations.of(context)!
                                    .translate('user_acc_detail_text_19')!,
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratRegular,
                                    fontSize: 1.8.t,
                                    color: ColorUtils.cyan),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            model.userEmail,
                            style: TextStyle(
                                fontFamily: FontUtils.montserratBold,
                                fontSize: 2.t),
                          )
                        ],
                      )),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.horizontalPadding,
                          vertical: 1.h),
                      decoration: BoxDecoration(
                          color: ColorUtils.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .translate('user_acc_detail_text_5')!,
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratMedium,
                                    fontSize: 1.5.t),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "*****************",
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratBold,
                                    fontSize: 2.t),
                              )
                            ],
                          )),
                          InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 2.w, vertical: 1.h),
                                          content: Container(
                                            padding:
                                                EdgeInsets.only(bottom: 1.2.h),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    model.navigateBack();
                                                    // model.changePassword();
                                                    // model.currentPassword
                                                    //     .clear();
                                                    // model.newPassword.clear();
                                                    // model.confirmPassword
                                                    //     .clear();
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      SvgPicture.asset(
                                                        ImageUtils.close,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .translate(
                                                                  'user_change_pass_text_1')!,
                                                          style: TextStyle(
                                                            fontFamily: FontUtils
                                                                .montserratSemiBold,
                                                            fontSize: 2.t,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    // Text(
                                                    //   "Enter New Password:",
                                                    //   style: TextStyle(
                                                    //       fontFamily: FontUtils
                                                    //           .montserratMedium,
                                                    //       fontSize: 1.5.t),
                                                    // ),
                                                    // SizedBox(
                                                    //   height: 1.h,
                                                    // ),
                                                    // Material(
                                                    //   elevation: 10,
                                                    //   shadowColor: ColorUtils
                                                    //       .grey
                                                    //       .withOpacity(0.2),
                                                    //   borderRadius:
                                                    //       BorderRadius.circular(
                                                    //           5),
                                                    //   child: Container(
                                                    //     decoration: BoxDecoration(
                                                    //         border: Border.all(
                                                    //             color: ColorUtils
                                                    //                 .purple),
                                                    //         borderRadius:
                                                    //             BorderRadius
                                                    //                 .circular(
                                                    //                     5)),
                                                    //     // padding: EdgeInsets.symmetric(horizontal: 0.5.w),
                                                    //     child: Row(
                                                    //       crossAxisAlignment:
                                                    //           CrossAxisAlignment
                                                    //               .center,
                                                    //       children: [
                                                    //         SizedBox(
                                                    //           width: 5.w,
                                                    //         ),
                                                    //         Expanded(
                                                    //           child:
                                                    //               TextFormField(
                                                    //             controller: model
                                                    //                 .currentPassword,
                                                    //             obscureText: model
                                                    //                 .changeselectedpass,
                                                    //             keyboardType:
                                                    //                 TextInputType
                                                    //                     .text,
                                                    //             inputFormatters: [
                                                    //               LengthLimitingTextInputFormatter(
                                                    //                   18)
                                                    //             ],
                                                    //             style: TextStyle(
                                                    //                 fontSize:
                                                    //                     2.5.t,
                                                    //                 fontFamily:
                                                    //                     FontUtils
                                                    //                         .montserratSemiBold),
                                                    //             decoration:
                                                    //                 InputDecoration(
                                                    //               hintText: AppLocalizations.of(
                                                    //                       context)!
                                                    //                   .translate(
                                                    //                       'user_change_pass_text_2')!,
                                                    //               hintStyle:
                                                    //                   TextStyle(
                                                    //                       fontSize:
                                                    //                           2.t),
                                                    //               border:
                                                    //                   InputBorder
                                                    //                       .none,
                                                    //             ),
                                                    //           ),
                                                    //         ),
                                                    //       ],
                                                    //     ),
                                                    //   ),
                                                    // ),

                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    Material(
                                                      elevation: 10,
                                                      shadowColor: ColorUtils
                                                          .grey
                                                          .withOpacity(0.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: ColorUtils
                                                                    .border),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        // padding: EdgeInsets.symmetric(horizontal: 0.5.w),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  TextFormField(
                                                                controller: model
                                                                    .newPassword,
                                                                obscureText: model
                                                                    .changeselectedpass,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                inputFormatters: [
                                                                  LengthLimitingTextInputFormatter(
                                                                      18)
                                                                ],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        2.5.t,
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .montserratSemiBold),
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText: AppLocalizations.of(
                                                                          context)!
                                                                      .translate(
                                                                          'user_change_pass_text_3')!,
                                                                  hintStyle: TextStyle(
                                                                      fontSize:
                                                                          1.8.t,
                                                                      color: ColorUtils
                                                                          .border),
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    // Text(
                                                    //   "Confirm New Password:",
                                                    //   style: TextStyle(
                                                    //       fontFamily: FontUtils
                                                    //           .montserratMedium,
                                                    //       fontSize: 1.5.t),
                                                    // ),
                                                    // SizedBox(
                                                    //   height: 1.h,
                                                    // ),
                                                    Material(
                                                      elevation: 10,
                                                      shadowColor: ColorUtils
                                                          .grey
                                                          .withOpacity(0.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: ColorUtils
                                                                    .border),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        // padding: EdgeInsets.symmetric(horizontal: 0.5.w),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  TextFormField(
                                                                controller: model
                                                                    .confirmPassword,
                                                                obscureText:
                                                                    true,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                inputFormatters: [
                                                                  LengthLimitingTextInputFormatter(
                                                                      18)
                                                                ],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        2.5.t,
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .montserratSemiBold),
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText: AppLocalizations.of(
                                                                          context)!
                                                                      .translate(
                                                                          'user_change_pass_text_4')!,
                                                                  hintStyle: TextStyle(
                                                                      fontSize:
                                                                          1.8.t,
                                                                      color: ColorUtils
                                                                          .border),
                                                                  border:
                                                                      InputBorder
                                                                          .none,
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
                                                    InkWell(
                                                        onTap: () {
                                                          model
                                                              .changePassword();
                                                          // model.currentPassword
                                                          //     .clear();
                                                          model.newPassword
                                                              .clear();
                                                          model.confirmPassword
                                                              .clear();
                                                          model.navigateBack();
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration: BoxDecoration(
                                                              color: ColorUtils
                                                                  .green,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        1.7.h),
                                                            child: Center(
                                                              child: Text(
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .translate(
                                                                        'other_text_28')!,
                                                                style: TextStyle(
                                                                    color: ColorUtils
                                                                        .white,
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .montserratSemiBold),
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ));
                              },
                              child: Text(
                                AppLocalizations.of(context)!
                                    .translate('user_change_name_text_2')!,
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratBold,
                                    fontSize: 1.8.t,
                                    color: ColorUtils.cyan),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 2.w, vertical: 1.h),
                                  content: SizedBox(
                                    height: 28.h,
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            model.navigateBack();
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SvgPicture.asset(
                                                ImageUtils.close,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Column(
                                            children: [
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .translate(
                                                        'user_acc_detail_text_13')!,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FontUtils.montserratBold,
                                                  fontSize: 2.t,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Material(
                                                elevation: 10,
                                                shadowColor: ColorUtils.grey
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                child: Container(
                                                  // padding: EdgeInsets.all(20),
                                                  height: 8.h,
                                                  // width: 100.w,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: ColorUtils
                                                              .purple),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7)),
                                                  child: DropdownFormField<
                                                      Map<String, dynamic>>(
                                                    onEmptyActionPressed:
                                                        () async {},
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      suffixIcon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        color: ColorUtils.black,
                                                      ),
                                                    ),
                                                    onSaved: (dynamic str) {
                                                      //print("onSaved" + str);
                                                    },
                                                    onChanged:
                                                        (dynamic str) async {
                                                      //print("onChanged" + str);
                                                      model.selectedrole = str;
                                                      print(str);
                                                      model.checkLang = str;
                                                      if (model.checkLang ==
                                                          model.roles[1]) {
                                                        model.selectedAppLanguage =
                                                            1;
                                                        model.sharedPreferences!.setInt(
                                                            'selectedAppLanguage',
                                                            model
                                                                .selectedAppLanguage);
                                                        model.notifyListeners();
                                                      } else {
                                                        model.selectedAppLanguage =
                                                            0;
                                                        model.sharedPreferences!.setInt(
                                                            'selectedAppLanguage',
                                                            model
                                                                .selectedAppLanguage);
                                                        model.notifyListeners();
                                                      }
                                                    },
                                                    validator: (dynamic str) {},
                                                    findFn:
                                                        (dynamic str) async =>
                                                            model.roles,
                                                    displayItemFn:
                                                        (dynamic item) => Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        Image.asset(
                                                          (item ?? {})[
                                                                  'image'] ??
                                                              model.roles[0]
                                                                  ["image"],
                                                          scale: 5,
                                                        ),
                                                        SizedBox(
                                                          width: 2.w,
                                                          height: 20.h,
                                                        ),
                                                        Text(
                                                          (item ??
                                                                  {})['name'] ??
                                                              model.roles[0]
                                                                  ["name"],
                                                          style: TextStyle(
                                                              fontSize: 2.t,
                                                              fontFamily: FontUtils
                                                                  .montserratMedium),
                                                        ),
                                                      ],
                                                    ),
                                                    selectedFn: (dynamic item1,
                                                        dynamic item2) {
                                                      if (item1 != null &&
                                                          item2 != null) {
                                                        return item1['name'] ==
                                                            item2['name'];
                                                      }
                                                      return false;
                                                    },

// filterFn: (dynamic item, str) => item['name'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
                                                    dropdownItemFn: (dynamic
                                                                item,
                                                            int position,
                                                            bool focused,
                                                            bool selected,
                                                            Function() onTap) =>
                                                        ListTile(
                                                      title: Row(
                                                        children: [
                                                          Image.asset(
                                                            (item ?? {})[
                                                                    'image'] ??
                                                                '',
                                                            scale: 5,
                                                          ),
                                                          SizedBox(
                                                            width: 3.w,
                                                          ),
                                                          Text(item['name']),
                                                        ],
                                                      ),
                                                      tileColor: focused
                                                          ? ColorUtils
                                                              .purplelight
                                                          : Colors.transparent,
                                                      onTap: onTap,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    print(model.checkLang);
                                                    print(model
                                                        .selectedAppLanguage);
                                                    if (model.selectedAppLanguage ==
                                                            1 &&
                                                        model.sharedPreferences!
                                                                .getInt(
                                                                    'selectedAppLanguage') ==
                                                            1) {
                                                      model.appLanguage
                                                          .changeLanguage(
                                                              Locale('zh'));
                                                    } else {
                                                      model.appLanguage
                                                          .changeLanguage(
                                                              Locale('en'));
                                                    }
                                                    model.navigateBack();
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        color: ColorUtils.green,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.7.h),
                                                      child: Center(
                                                        child: Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .translate(
                                                                  'user_db_journal_text_8')!,
                                                          style: TextStyle(
                                                              color: ColorUtils
                                                                  .white,
                                                              fontFamily: FontUtils
                                                                  .montserratSemiBold),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                  //  Button(
                                                  //     AppLocalizations.of(
                                                  //             context)!
                                                  //         .translate(
                                                  //             'user_change_name_text_2')!,
                                                  //     15)
                                                  ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.horizontalPadding,
                            vertical: 1.h),
                        decoration: BoxDecoration(
                            color: ColorUtils.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate('user_acc_detail_text_7')!,
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratMedium,
                                      fontSize: 1.5.t),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                if (model.selectedAppLanguage == 1)
                                  Text(
                                    model.roles[1]['name'],
                                    style: TextStyle(
                                        fontFamily: FontUtils.montserratBold,
                                        fontSize: 2.t),
                                  )
                                else if (model.sharedPreferences!
                                        .getInt('selectedAppLanguage') ==
                                    1)
                                  Text(
                                    model.roles[1]['name'],
                                    style: TextStyle(
                                        fontFamily: FontUtils.montserratBold,
                                        fontSize: 2.t),
                                  )
                                else
                                  Text(
                                    model.roles[0]['name'],
                                    style: TextStyle(
                                        fontFamily: FontUtils.montserratBold,
                                        fontSize: 2.t),
                                  )
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: ColorUtils.black,
                              size: 4.i,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.horizontalPadding),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate('user_acc_detail_text_8')!,
                                    style: TextStyle(
                                        fontFamily: FontUtils.montserratBold,
                                        fontSize: 2.t),
                                  ),
                                  // Text(
                                  //   "Information",
                                  //   style: TextStyle(
                                  //       fontFamily: FontUtils.montserratBold,
                                  //       fontSize: 2.5.t),
                                  // ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate('user_acc_detail_text_9')!,
                                    style: TextStyle(
                                        color: ColorUtils.grey,
                                        fontSize: 1.5.t),
                                  )
                                ],
                              ),
                              model.emergency == true
                                  ? Container()
                                  : InkWell(
                                      onTap: () {
                                        model.emergency = true;
                                        model.notifyListeners();
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)!.translate(
                                            'user_acc_detail_text_14')!,
                                        style: TextStyle(
                                            fontFamily:
                                                FontUtils.montserratRegular,
                                            fontSize: 1.8.t,
                                            color: ColorUtils.cyan),
                                      )),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .translate('user_acc_detail_text_10')!,
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratMedium,
                                    fontSize: 1.5.t),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: model.LpasswordFocus.hasFocus
                                          ? ColorUtils.purple
                                          : ColorUtils.border),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    SvgPicture.asset(ImageUtils.person),
                                    SizedBox(
                                      width: 2.5.w,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                          controller: model.emergencyName,
                                          readOnly: model.emergency == true
                                              ? false
                                              : true,
                                          style: TextStyle(
                                            fontSize: 2.5.t,
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: AppLocalizations.of(
                                                    context)!
                                                .translate(
                                                    'user_acc_detail_text_11')!,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate('user_acc_detail_text_12')!,
                                    style: TextStyle(
                                        fontFamily: FontUtils.montserratMedium,
                                        fontSize: 1.5.t),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: ColorUtils.border),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    SvgPicture.asset(ImageUtils.person),
                                    SizedBox(
                                      width: 2.5.w,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                          controller: model.emergencyRelation,
                                          readOnly: model.emergency == true
                                              ? false
                                              : true,
                                          style: TextStyle(
                                            fontSize: 2.5.t,
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: AppLocalizations.of(
                                                    context)!
                                                .translate(
                                                    'user_acc_detail_text_12')!,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate('user_acc_detail_text_15')!,
                                    style: TextStyle(
                                        fontFamily: FontUtils.montserratMedium,
                                        fontSize: 1.5.t),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: ColorUtils.border),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    SvgPicture.asset(ImageUtils.mobile),
                                    SizedBox(
                                      width: 2.5.w,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                          controller:
                                              model.emergencyPhoneNumber,
                                          readOnly: model.emergency == true
                                              ? false
                                              : true,
                                          keyboardType: TextInputType.phone,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(15)
                                          ],
                                          style: TextStyle(
                                            fontSize: 2.5.t,
                                          ),
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: '+1-341-123456',
                                              helperStyle: TextStyle(
                                                  color: ColorUtils.black))),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              if (model.emergency == true)
                                InkWell(
                                  onTap: () {
                                    if (model.emergencyName.text.isEmpty) {
                                      DialogUtils().showDialog(MyErrorWidget(
                                          error: AppLocalizations.of(context)!
                                              .translate(
                                                  'user_acc_detail_text_16')!));
                                    } else if (model
                                        .emergencyRelation.text.isEmpty) {
                                      DialogUtils().showDialog(MyErrorWidget(
                                          error: AppLocalizations.of(context)!
                                              .translate(
                                                  'user_acc_detail_text_17')!));
                                    } else if (model
                                        .emergencyPhoneNumber.text.isEmpty) {
                                      DialogUtils().showDialog(MyErrorWidget(
                                          error: AppLocalizations.of(context)!
                                              .translate(
                                                  'user_acc_detail_text_18')!));
                                    } else {
                                      model.emergency = false;
                                      model.notifyListeners();
                                      model.emergencyContact();
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 25.w, vertical: 1.5.h),
                                    decoration: BoxDecoration(
                                        color: ColorUtils.green,
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 6,
                                              offset: Offset(0, 10),
                                              color: ColorUtils.grey
                                                  .withOpacity(0.4))
                                        ],
                                        borderRadius: BorderRadius.circular(7)),
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .translate('other_text_28')!,
                                      style: TextStyle(
                                          color: ColorUtils.white,
                                          fontFamily:
                                              FontUtils.montserratSemiBold),
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: 2.h,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
