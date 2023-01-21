import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  _CreateNewPasswordState createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        // model.isEmailInFocus = false;
        // model.isPasswordInFocus = false;
        model.cnewpassword.clear();
        model.newpassword.clear();
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Dimensions.topMargin,
                    ),
                    IconButton(
                        onPressed: () {
                          model.navigateBack();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: ColorUtils.black,
                          size: 4.i,
                        )),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Create New Password",
                          style: TextStyle(
                              fontFamily: FontUtils.montserratBold,
                              fontSize: 3.t),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "Please enter your new password below.",
                      style: TextStyle(
                          fontSize: 2.2.t,
                          fontFamily: FontUtils.montserratRegular,
                          height: 0.2.h),
                    ),
                    SizedBox(
                      height: 4.3.h,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "New Password:",
                              style: TextStyle(
                                  fontSize: 2.t,
                                  fontFamily: FontUtils.montserratMedium,
                                  color: model.NewpasswordFocus.hasFocus
                                      ? ColorUtils.purple
                                      : ColorUtils.black),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Material(
                          elevation: model.NewpasswordFocus.hasFocus ? 10 : 0,
                          shadowColor: ColorUtils.border.withOpacity(0.4),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  // height: 6.5.h,
                                  // width: 10.w,
                                  //margin: const EdgeInsets.all(10.0),
                                  //padding: EdgeInsets.symmetric(vertical: SizeConfig.widthMultiplier * 4, horizontal: SizeConfig.heightMultiplier * 2.5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: model.NewpasswordFocus.hasFocus
                                            ? ColorUtils.purple
                                            : ColorUtils.black,
                                      ),
                                      //color: ColorUtils.searchField,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Column(children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Container(
                                          child: SvgPicture.asset(
                                            ImageUtils.lock,
                                            color:
                                                model.NewpasswordFocus.hasFocus
                                                    ? ColorUtils.purple
                                                    : ColorUtils.black,
                                            height: 10.i,
                                            width: 10.i,
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Expanded(
                                          child: TextField(
                                            obscureText: model.selectedpass,
                                            focusNode: model.NewpasswordFocus,
                                            style: TextStyle(
                                              fontFamily:
                                                  FontUtils.montserratSemiBold,
                                              fontSize: 2.5.t,
                                              color: model
                                                      .NewpasswordFocus.hasFocus
                                                  ? ColorUtils.purple
                                                  : ColorUtils.black,
                                            ),
                                            // readOnly: model.editPressed == true ? false : true,
                                            controller: model.newpassword,
                                            //scrollController: _countryCodeController,
                                            decoration: InputDecoration(
                                                suffixIcon: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        model.selectedpass =
                                                            !model.selectedpass;
                                                        model.notifyListeners();
                                                      });
                                                    },
                                                    child: model.selectedpass ==
                                                            true
                                                        ? Icon(
                                                            Icons
                                                                .visibility_off,
                                                            color: model
                                                                    .NewpasswordFocus
                                                                    .hasFocus
                                                                ? ColorUtils
                                                                    .purple
                                                                : ColorUtils
                                                                    .black,
                                                          )
                                                        : Icon(
                                                            Icons.visibility,
                                                            color: model
                                                                    .NewpasswordFocus
                                                                    .hasFocus
                                                                ? ColorUtils
                                                                    .purple
                                                                : ColorUtils
                                                                    .black,
                                                          )),
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                hintStyle: TextStyle(
                                                  fontSize: 2.5.t,
                                                  //color: ColorUtils.searchHintColor
                                                )),
                                            keyboardType: TextInputType.text,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Confirm New Password:",
                              style: TextStyle(
                                  fontSize: 2.t,
                                  fontFamily: FontUtils.montserratMedium,
                                  color: model.CNewpasswordFocus.hasFocus
                                      ? ColorUtils.purple
                                      : ColorUtils.black),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Material(
                          elevation: model.CNewpasswordFocus.hasFocus ? 10 : 0,
                          shadowColor: ColorUtils.border.withOpacity(0.4),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  // height: 6.5.h,
                                  // width: 10.w,
                                  //margin: const EdgeInsets.all(10.0),
                                  //padding: EdgeInsets.symmetric(vertical: SizeConfig.widthMultiplier * 4, horizontal: SizeConfig.heightMultiplier * 2.5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: model.CNewpasswordFocus.hasFocus
                                            ? ColorUtils.purple
                                            : ColorUtils.black,
                                      ),
                                      //color: ColorUtils.searchField,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Column(children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Container(
                                          child: SvgPicture.asset(
                                            ImageUtils.lock,
                                            color:
                                                model.CNewpasswordFocus.hasFocus
                                                    ? ColorUtils.purple
                                                    : ColorUtils.black,
                                            height: 10.i,
                                            width: 10.i,
                                            fit: BoxFit.scaleDown,
                                          ),

                                          //ImageIcon(AssetImage("assets/icon_Atr.svg" ),color: ColorUtils.btn_blue,)
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Expanded(
                                          child: TextField(
                                            obscureText: model.cselectedpass,

                                            focusNode: model.CNewpasswordFocus,
                                            style: TextStyle(
                                              fontFamily:
                                                  FontUtils.montserratSemiBold,
                                              fontSize: 2.5.t,
                                              color: model.CNewpasswordFocus
                                                      .hasFocus
                                                  ? ColorUtils.purple
                                                  : ColorUtils.black,
                                            ),
                                            // readOnly: model.editPressed == true ? false : true,
                                            controller: model.cnewpassword,
                                            //scrollController: _countryCodeController,
                                            decoration: InputDecoration(
                                                suffixIcon: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        model.cselectedpass =
                                                            !model
                                                                .cselectedpass;
                                                        model.notifyListeners();
                                                      });
                                                    },
                                                    child: model.cselectedpass ==
                                                            true
                                                        ? Icon(
                                                            Icons
                                                                .visibility_off,
                                                            color: model
                                                                    .CNewpasswordFocus
                                                                    .hasFocus
                                                                ? ColorUtils
                                                                    .purple
                                                                : ColorUtils
                                                                    .black,
                                                          )
                                                        : Icon(
                                                            Icons.visibility,
                                                            color: model
                                                                    .CNewpasswordFocus
                                                                    .hasFocus
                                                                ? ColorUtils
                                                                    .purple
                                                                : ColorUtils
                                                                    .black,
                                                          )),
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                hintStyle: TextStyle(
                                                  fontSize: 2.5.t,
                                                  //color: ColorUtils.searchHintColor
                                                )),
                                            keyboardType: TextInputType.text,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Row(
                        //   children: [
                        //
                        //     Expanded(
                        //       child: Material(
                        //           elevation:
                        //           model.CNewpasswordFocus.hasFocus ? 10 : 0,
                        //           shadowColor:
                        //           ColorUtils.greyLight.withOpacity(0.4),
                        //           borderRadius: BorderRadius.circular(7),
                        //           child:
                        //       Container(
                        //
                        //         height: 6.h,
                        //         decoration: BoxDecoration(
                        //           border: Border.all(color:  model.CNewpasswordFocus
                        //               .hasFocus
                        //               ? ColorUtils.purple
                        //               : ColorUtils.black.withOpacity(0.2)),
                        //           borderRadius: BorderRadius.circular(7)
                        //
                        //         ),
                        //         child: Row(
                        //           children: [
                        //             SizedBox(width: 2.w,),
                        //             // Container(
                        //             //
                        //             //   child: GestureDetector(
                        //             //
                        //             //       // child:
                        //             //   ),
                        //             // ),
                        //             Expanded(
                        //               child: Container(
                        //                 padding: EdgeInsets.only(top: 2.h),
                        //                 child: TextField(
                        //
                        //                   obscureText: model.cselectedpass,
                        //                   controller: model.cnewpassword,
                        //                   focusNode: model.CNewpasswordFocus,
                        //                   decoration: InputDecoration(
                        //                       hintText: 'Please Re-Enter Your Password',
                        //                       hintStyle: TextStyle(color: ColorUtils.greyLight),
                        //                       border: OutlineInputBorder(
                        //                           borderSide: BorderSide.none
                        //                       ),
                        //                       prefixStyle: TextStyle(
                        //                         color: model.CNewpasswordFocus.hasFocus
                        //                             ? ColorUtils.purple
                        //                             : ColorUtils.black,
                        //                       ),
                        //
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),)
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    InkWell(
                        onTap: () {
                          model.confirmNewPassword();
                        },
                        child: Button("Create New Password",20)),
                  ],
                ),
                // ])),
                // ],
              )),
            ),
          ),
        );
      },
    );
  }
}
