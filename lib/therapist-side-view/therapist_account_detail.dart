import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class TherapistAccountDetails extends StatefulWidget {
  const TherapistAccountDetails({Key? key}) : super(key: key);

  @override
  _TherapistAccountDetailsState createState() =>
      _TherapistAccountDetailsState();
}

class _TherapistAccountDetailsState extends State<TherapistAccountDetails> {
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
              model.therapistCurrentPassword.clear();
              model.theNewPassword.clear();
              model.therapaistConfirmPassword.clear();
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
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
                              "Account Details",
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
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.horizontalPadding,
                          vertical: 1.h),
                      color: ColorUtils.purplelight.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              // Text(
                              //   "Nickname",
                              //   style: TextStyle(
                              //       fontFamily: FontUtils.montserratMedium,
                              //       fontSize: 1.5.t),
                              // ),
                              Text(
                                model.selectedAppLanguage != 1
                                    ? model.therapistData!.name.toString()
                                    : model.therapistData!.nameChinese
                                        .toString(),
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratBold,
                                    fontSize: 2.t),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                            ],
                          )),
                          // InkWell(
                          //     onTap: () {
                          //       showDialog(
                          //           context: context,
                          //           builder: (context) => AlertDialog(
                          //                 shape: RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.all(
                          //                         Radius.circular(10))),
                          //                 contentPadding: EdgeInsets.symmetric(
                          //                     horizontal: 2.w, vertical: 1.h),
                          //                 content: SizedBox(
                          //                   child: Column(
                          //                     mainAxisSize: MainAxisSize.min,
                          //                     children: [
                          //                       InkWell(
                          //                         onTap: () {
                          //                           model.navigateBack();
                          //                         },
                          //                         child: Row(
                          //                           mainAxisAlignment:
                          //                               MainAxisAlignment.end,
                          //                           children: [
                          //                             SvgPicture.asset(
                          //                               ImageUtils.close,
                          //                             ),
                          //                           ],
                          //                         ),
                          //                       ),
                          //                       SizedBox(
                          //                         height: 1.h,
                          //                       ),
                          //                       Container(
                          //                         padding: EdgeInsets.symmetric(
                          //                             horizontal: 5.w),
                          //                         child: Column(
                          //                           children: [
                          //                             Text(
                          //                               "Change Nickname",
                          //                               style: TextStyle(
                          //                                 fontFamily: FontUtils
                          //                                     .montserratBold,
                          //                                 fontSize: 2.t,
                          //                               ),
                          //                             ),
                          //                             SizedBox(
                          //                               height: 3.h,
                          //                             ),
                          //                             Material(
                          //                               elevation: 10,
                          //                               shadowColor: ColorUtils
                          //                                   .grey
                          //                                   .withOpacity(0.2),
                          //                               borderRadius:
                          //                                   BorderRadius.circular(
                          //                                       5),
                          //                               child: Container(
                          //                                 decoration: BoxDecoration(
                          //                                     border: Border.all(
                          //                                         color: ColorUtils
                          //                                             .purple),
                          //                                     borderRadius:
                          //                                         BorderRadius
                          //                                             .circular(
                          //                                                 5)),
                          //                                 // padding: EdgeInsets.symmetric(horizontal: 0.5.w),
                          //                                 child: Row(
                          //                                   crossAxisAlignment:
                          //                                       CrossAxisAlignment
                          //                                           .center,
                          //                                   children: [
                          //                                     SizedBox(
                          //                                       width: 5.w,
                          //                                     ),
                          //                                     Expanded(
                          //                                       child:
                          //                                           TextFormField(
                          //                                         keyboardType:
                          //                                             TextInputType
                          //                                                 .text,
                          //                                         inputFormatters: [
                          //                                           LengthLimitingTextInputFormatter(
                          //                                               18)
                          //                                         ],
                          //                                         style: TextStyle(
                          //                                             fontSize:
                          //                                                 2.5.t,
                          //                                             fontFamily:
                          //                                                 FontUtils
                          //                                                     .montserratBold),
                          //                                         decoration:
                          //                                             const InputDecoration(
                          //                                           border:
                          //                                               InputBorder
                          //                                                   .none,
                          //                                         ),
                          //                                       ),
                          //                                     ),
                          //                                   ],
                          //                                 ),
                          //                               ),
                          //                             ),
                          //                             SizedBox(
                          //                               height: 1.h,
                          //                             ),
                          //                             Text(
                          //                               "Must be between 2-18 characters starting with a letter.",
                          //                               style: TextStyle(
                          //                                   fontFamily: FontUtils
                          //                                       .montserratRegular,
                          //                                   fontSize: 1.5.t),
                          //                               textAlign:
                          //                                   TextAlign.center,
                          //                             ),
                          //                             SizedBox(
                          //                               height: 4.h,
                          //                             ),
                          //                             InkWell(
                          //                                 onTap: () {
                          //                                   model.navigateBack();
                          //                                 },
                          //                                 child:
                          //                                     Button("Change")),
                          //                           ],
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //               ));
                          //     },
                          //     child: Text(
                          //       "change nickname",
                          //       style: TextStyle(
                          //           fontFamily: FontUtils.montserratBold,
                          //           fontSize: 1.8.t,
                          //           color: ColorUtils.green),
                          //     ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.horizontalPadding,
                          vertical: 1.h),
                      color: ColorUtils.purplelight.withOpacity(0.5),
                      child: Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // /
                              // Text(
                              //   "Verified",
                              //   style: TextStyle(
                              //       fontFamily: FontUtils.montserratRegular,
                              //       fontSize: 1.8.t,
                              //       color: ColorUtils.green),
                              // )
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            model.therapistData!.email.toString(),
                            style: TextStyle(
                                fontFamily: FontUtils.montserratBold,
                                fontSize: 2.t),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                        ],
                      )),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.horizontalPadding,
                          vertical: 1.h),
                      color: ColorUtils.purplelight.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Password",
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
                          ),
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
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  model.navigateBack();
                                                  model.therapistCurrentPassword
                                                      .clear();
                                                  model.theNewPassword.clear();
                                                  model
                                                      .therapaistConfirmPassword
                                                      .clear();
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
                                                        "Change Password",
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
                                                  Material(
                                                    elevation: 10,
                                                    shadowColor: ColorUtils.grey
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: ColorUtils
                                                                  .purple),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
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
                                                                  .therapistCurrentPassword,
                                                              obscureText: model
                                                                  .changeselectedpass,
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
                                                                          .montserratSemiBold),
                                                              decoration:
                                                                  InputDecoration(
                                                                hintStyle: TextStyle(
                                                                    fontSize:
                                                                        2.t,
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .montserratMedium),
                                                                hintText:
                                                                    "Current Password:",
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
                                                    height: 3.h,
                                                  ),
                                                  // SizedBox(
                                                  //   height: 1.h,
                                                  // ),
                                                  Material(
                                                    elevation: 10,
                                                    shadowColor: ColorUtils.grey
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: ColorUtils
                                                                  .purple),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
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
                                                                  .theNewPassword,
                                                              obscureText: model
                                                                  .changeselectedpass,
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
                                                                          .montserratSemiBold),
                                                              decoration:
                                                                  InputDecoration(
                                                                hintStyle: TextStyle(
                                                                    fontSize:
                                                                        2.t,
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .montserratMedium),
                                                                hintText:
                                                                    "Enter New Password:",
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
                                                    height: 3.h,
                                                  ),
                                                  // Text(
                                                  //   ,
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
                                                    shadowColor: ColorUtils.grey
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: ColorUtils
                                                                  .purple),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
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
                                                                  .therapaistConfirmPassword,
                                                              obscureText: true,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                              // inputFormatters: [
                                                              // LengthLimitingTextInputFormatter(
                                                              //     18)
                                                              // ],
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      2.5.t,
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .montserratBold),
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    "Confirm New Password:",
                                                                hintStyle: TextStyle(
                                                                    fontSize:
                                                                        2.t,
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .montserratMedium),
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
                                                        model.navigateBack();
                                                        model
                                                            .therapistChangePassword();
                                                      },
                                                      child: Button("Save",15)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ));
                              },
                              child: Text(
                                "change password",
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratBold,
                                    fontSize: 1.8.t,
                                    color: ColorUtils.green),
                              ))
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 2.5.h,
                    // ),
                    // InkWell(
                    //   onTap: () {
                    //     showDialog(
                    //         context: context,
                    //         builder: (context) => AlertDialog(
                    //               shape: RoundedRectangleBorder(
                    //                   borderRadius: BorderRadius.all(
                    //                       Radius.circular(10))),
                    //               contentPadding: EdgeInsets.symmetric(
                    //                   horizontal: 2.w, vertical: 1.h),
                    //               content: SizedBox(
                    //                 height: 28.h,
                    //                 child: Column(
                    //                   children: [
                    //                     InkWell(
                    //                       onTap: () {
                    //                         model.navigateBack();
                    //                       },
                    //                       child: Row(
                    //                         mainAxisAlignment:
                    //                             MainAxisAlignment.end,
                    //                         children: [
                    //                           SvgPicture.asset(
                    //                             ImageUtils.close,
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     SizedBox(
                    //                       height: 1.h,
                    //                     ),
                    //                     Container(
                    //                       padding: EdgeInsets.symmetric(
                    //                           horizontal: 5.w),
                    //                       child: Column(
                    //                         children: [
                    //                           Text(
                    //                             "Change Language",
                    //                             style: TextStyle(
                    //                               fontFamily:
                    //                                   FontUtils.montserratBold,
                    //                               fontSize: 2.t,
                    //                             ),
                    //                           ),
                    //                           SizedBox(
                    //                             height: 3.h,
                    //                           ),
                    //                           Material(
                    //                             elevation: 10,
                    //                             shadowColor: ColorUtils.grey
                    //                                 .withOpacity(0.3),
                    //                             borderRadius:
                    //                                 BorderRadius.circular(7),
                    //                             child: Container(
                    //                               height: 8.h,
                    //                               // width: 100.w,
                    //                               decoration: BoxDecoration(
                    //                                   border: Border.all(
                    //                                       color: ColorUtils
                    //                                           .purple),
                    //                                   borderRadius:
                    //                                       BorderRadius.circular(
                    //                                           5)),
                    //                               child: Center(
                    //                                 child: DropdownFormField<
                    //                                     Map<String, dynamic>>(
                    //                                   onEmptyActionPressed:
                    //                                       () async {},
                    //                                   decoration:
                    //                                       InputDecoration(
                    //                                     border:
                    //                                         InputBorder.none,
                    //                                     suffixIcon: Icon(
                    //                                       Icons
                    //                                           .keyboard_arrow_down,
                    //                                       color:
                    //                                           ColorUtils.black,
                    //                                     ),
                    //                                   ),
                    //                                   onSaved: (dynamic str) {},
                    //                                   onChanged:
                    //                                       (dynamic str) {},
                    //                                   validator:
                    //                                       (dynamic str) {},
                    //                                   displayItemFn:
                    //                                       (dynamic item) => Row(
                    //                                     crossAxisAlignment:
                    //                                         CrossAxisAlignment
                    //                                             .center,
                    //                                     children: [
                    //                                       SizedBox(
                    //                                         width: 5.w,
                    //                                       ),
                    //                                       Image.asset(
                    //                                         (item ?? {})[
                    //                                                 'image'] ??
                    //                                             model.roles[0]
                    //                                                 ['image'],
                    //                                         scale: 5,
                    //                                       ),
                    //                                       SizedBox(
                    //                                         width: 2.w,
                    //                                         height: 20.h,
                    //                                       ),
                    //                                       Text(
                    //                                         (item ?? {})[
                    //                                                 'name'] ??
                    //                                             model.roles[0]
                    //                                                 ['name'],
                    //                                         style: TextStyle(
                    //                                             fontSize: 2.t,
                    //                                             fontFamily:
                    //                                                 FontUtils
                    //                                                     .montserratMedium),
                    //                                       ),
                    //                                     ],
                    //                                   ),
                    //                                   findFn:
                    //                                       (dynamic str) async =>
                    //                                           model.roles,
                    //                                   selectedFn:
                    //                                       (dynamic item1,
                    //                                           dynamic item2) {
                    //                                     if (item1 != null &&
                    //                                         item2 != null) {
                    //                                       return item1[
                    //                                               'name'] ==
                    //                                           item2['name'];
                    //                                     }
                    //                                     return false;
                    //                                   },
                    //                                   filterFn: (dynamic item,
                    //                                           str) =>
                    //                                       item['name']
                    //                                           .toLowerCase()
                    //                                           .indexOf(str
                    //                                               .toLowerCase()) >=
                    //                                       0,
                    //                                   dropdownItemFn:
                    //                                       (dynamic item,
                    //                                               int position,
                    //                                               bool focused,
                    //                                               bool selected,
                    //                                               Function()
                    //                                                   onTap) =>
                    //                                           ListTile(
                    //                                     title: Row(
                    //                                       children: [
                    //                                         Image.asset(
                    //                                           item['image'],
                    //                                           scale: 5,
                    //                                         ),
                    //                                         SizedBox(
                    //                                           width: 3.w,
                    //                                         ),
                    //                                         Text(item['name']),
                    //                                       ],
                    //                                     ),
                    //                                     tileColor: focused
                    //                                         ? ColorUtils
                    //                                             .purplelight
                    //                                         : Colors
                    //                                             .transparent,
                    //                                     onTap: onTap,
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                             ),
                    //                           ),
                    //                           SizedBox(
                    //                             height: 4.h,
                    //                           ),
                    //                           InkWell(
                    //                               onTap: () {
                    //                                 model.navigateBack();
                    //                               },
                    //                               child: Button("Change")),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ));
                    //   },
                    //   child: Container(
                    //     padding: EdgeInsets.symmetric(
                    //         horizontal: Dimensions.horizontalPadding,
                    //         vertical: 1.h),
                    //     color: ColorUtils.purplelight.withOpacity(0.5),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               "Language",
                    //               style: TextStyle(
                    //                   fontFamily: FontUtils.montserratMedium,
                    //                   fontSize: 1.5.t),
                    //             ),
                    //             SizedBox(
                    //               height: 1.h,
                    //             ),
                    //             Text(
                    //               "English (US)",
                    //               style: TextStyle(
                    //                   fontFamily: FontUtils.montserratBold,
                    //                   fontSize: 2.t),
                    //             )
                    //           ],
                    //         ),
                    //         Icon(
                    //           Icons.arrow_forward_ios,
                    //           color: ColorUtils.black,
                    //           size: 4.i,
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
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
