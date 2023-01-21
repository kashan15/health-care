import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.onEmailFocus();
        model.femail.clear();
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
                body: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.horizontalPadding),
                    child: SingleChildScrollView(
                      child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
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
                                SizedBox(
                                  width: 14.w,
                                ),
                                Image.asset(
                                  ImageUtils.soulgood,
                                  height: 10.i,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Center(
                                child: Image.asset(
                              ImageUtils.forgetPassword,
                              scale: 4,
                            )),
                            SizedBox(
                              height: 7.h,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .translate('forgot_pass_text_1')!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 3.t,
                                  fontFamily: FontUtils.montserratBold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .translate('forgot_pass_text_2')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratRegular,
                                  fontSize: 2.3.t),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                              .translate('other_text_5')! +
                                          ':',
                                      style: TextStyle(
                                          fontSize: 2.t,
                                          fontFamily:
                                              FontUtils.montserratMedium,
                                          color: model.FemailFocus.hasFocus
                                              ? ColorUtils.green
                                              : ColorUtils.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Material(
                                  elevation:
                                      model.FemailFocus.hasFocus ? 10 : 0,
                                  shadowColor: ColorUtils.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: model.FemailFocus.hasFocus
                                                ? ColorUtils.green
                                                : ColorUtils.border),
                                        borderRadius:
                                            BorderRadius.circular(15)),
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
                                          color: model.FemailFocus.hasFocus
                                              ? ColorUtils.green
                                              : ColorUtils.black,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            // key: model.sectionFormKey,
                                            onTap: () {
                                              model.notifyListeners();
                                            },
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            controller: model.femail,
                                            focusNode: model.FemailFocus,
                                            style: TextStyle(
                                                fontSize: 2.5.t,
                                                color:
                                                    model.FemailFocus.hasFocus
                                                        ? ColorUtils.green
                                                        : ColorUtils.black),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: AppLocalizations.of(
                                                      context)!
                                                  .translate('other_text_71')!,
                                              hintStyle: TextStyle(
                                                  color:
                                                      model.FemailFocus.hasFocus
                                                          ? ColorUtils.green
                                                          : ColorUtils.black)
                                              //  AppLocalizations.of(
                                              //         context)!
                                              //     .translate('other_text_6')!
                                              ,
                                            ),
                                            // validator: (value) {
                                            //   if (value == null || value.isEmpty) {
                                            //     return 'Please Enter Your Email Address';
                                            //   }else if(!value.isEmail){
                                            //     return "Please Enter Correct Email Address";
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
                                  height: 6.h,
                                ),
                                model.forgetLoading == true
                                    ? SizedBox(
                                        height: 4.h,
                                        child: CircularProgressIndicator(
                                          color: ColorUtils.green,
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          model.forgetPassword(context);
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: ColorUtils.green,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.h),
                                            child: Center(
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .translate(
                                                        'forgot_pass_text_3')!,
                                                style: TextStyle(
                                                    color: ColorUtils.white,
                                                    fontFamily: FontUtils
                                                        .montserratSemiBold),
                                              ),
                                            ),
                                          ),
                                        )

                                        // Button(
                                        //     AppLocalizations.of(context)!
                                        //         .translate(
                                        //             'forgot_pass_text_3')!,
                                        //     15))
                                        )
                              ],
                            ),
                          ]),
                    ))),
          ),
        );
      },
    );
  }
}

                      /// OLD CODE

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
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

// class ForgetPassword extends StatefulWidget {
//   const ForgetPassword({Key? key}) : super(key: key);

//   @override
//   _ForgetPasswordState createState() => _ForgetPasswordState();
// }

// class _ForgetPasswordState extends State<ForgetPassword> {
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<MainViewModel>.reactive(
//       viewModelBuilder: () => locator<MainViewModel>(),
//       disposeViewModel: false,
//       onModelReady: (model) {
//         model.onEmailFocus();
//         model.femail.clear();
//       },
//       builder: (context, model, child) {
//         return SafeArea(
//           top: false,
//           bottom: false,
//           child: GestureDetector(
//             onTap: () {
//               FocusScope.of(context).unfocus();
//             },
//             child: Scaffold(
//                 backgroundColor: Colors.white,
//                 body: Container(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: Dimensions.horizontalPadding),
//                     child: SingleChildScrollView(
//                       child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: Dimensions.topMargin,
//                             ),
//                             IconButton(
//                                 onPressed: () {
//                                   model.navigateBack();
//                                 },
//                                 icon: Icon(
//                                   Icons.arrow_back_ios,
//                                   color: ColorUtils.black,
//                                   size: 4.i,
//                                 )),
//                             Center(
//                                 child: Image.asset(
//                               ImageUtils.forgetPassword,
//                               scale: 4,
//                             )),
//                             SizedBox(
//                               height: 7.h,
//                             ),
//                             Text(
//                               AppLocalizations.of(context)!
//                                   .translate('forgot_pass_text_1')!,
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 3.t,
//                                   fontFamily: FontUtils.montserratBold),
//                             ),
//                             SizedBox(
//                               height: 4.h,
//                             ),
//                             Text(
//                               AppLocalizations.of(context)!
//                                   .translate('forgot_pass_text_2')!,
//                               style: TextStyle(
//                                   fontFamily: FontUtils.montserratRegular,
//                                   fontSize: 2.5.t),
//                             ),
//                             SizedBox(
//                               height: 4.h,
//                             ),
//                             Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text(
//                                       AppLocalizations.of(context)!
//                                           .translate('other_text_5')!,
//                                       style: TextStyle(
//                                           fontSize: 2.t,
//                                           fontFamily:
//                                               FontUtils.montserratMedium,
//                                           color: model.FemailFocus.hasFocus
//                                               ? ColorUtils.purple
//                                               : ColorUtils.black),
//                                     )
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 2.h,
//                                 ),
//                                 Material(
//                                   elevation:
//                                       model.FemailFocus.hasFocus ? 10 : 0,
//                                   shadowColor: ColorUtils.grey.withOpacity(0.3),
//                                   borderRadius: BorderRadius.circular(7),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: model.FemailFocus.hasFocus
//                                                 ? ColorUtils.purple
//                                                 : ColorUtils.border),
//                                         borderRadius: BorderRadius.circular(7)),
//                                     // padding: EdgeInsets.symmetric(horizontal: 0.5.w),
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         SizedBox(
//                                           width: 5.w,
//                                         ),
//                                         SvgPicture.asset(
//                                           ImageUtils.email,
//                                           color: model.FemailFocus.hasFocus
//                                               ? ColorUtils.purple
//                                               : ColorUtils.black,
//                                         ),
//                                         SizedBox(
//                                           width: 5.w,
//                                         ),
//                                         Expanded(
//                                           child: TextFormField(
//                                             // key: model.sectionFormKey,
//                                             keyboardType:
//                                                 TextInputType.emailAddress,
//                                             controller: model.femail,
//                                             focusNode: model.FemailFocus,
//                                             style: TextStyle(
//                                                 fontSize: 2.5.t,
//                                                 color:
//                                                     model.FemailFocus.hasFocus
//                                                         ? ColorUtils.purple
//                                                         : ColorUtils.black),
//                                             decoration: InputDecoration(
//                                               border: InputBorder.none,
//                                               hintText: AppLocalizations.of(
//                                                       context)!
//                                                   .translate('other_text_6')!,
//                                             ),
//                                             // validator: (value) {
//                                             //   if (value == null || value.isEmpty) {
//                                             //     return 'Please Enter Your Email Address';
//                                             //   }else if(!value.isEmail){
//                                             //     return "Please Enter Correct Email Address";
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
//                                   height: 6.h,
//                                 ),
//                                 model.forgetLoading == true
//                                     ? SizedBox(
//                                         height: 4.h,
//                                         child: CircularProgressIndicator(
//                                           color: ColorUtils.purple,
//                                         ),
//                                       )
//                                     : InkWell(
//                                         onTap: () {
//                                           model.forgetPassword(context);
//                                         },
//                                         child: Button(
//                                             AppLocalizations.of(context)!
//                                                 .translate(
//                                                     'forgot_pass_text_3')!,
//                                             10))
//                               ],
//                             ),
//                           ]),
//                     ))),
//           ),
//         );
//       },
//     );
//   }
// }

