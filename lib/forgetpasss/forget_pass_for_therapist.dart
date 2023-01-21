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

import '../utils/app_localization.dart';

class ForgetPasswordForTherapist extends StatefulWidget {
  const ForgetPasswordForTherapist({Key? key}) : super(key: key);

  @override
  _ForgetPasswordForTherapistState createState() =>
      _ForgetPasswordForTherapistState();
}

class _ForgetPasswordForTherapistState
    extends State<ForgetPasswordForTherapist> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.therapistForgetEmailFocus();
        model.therapistfemail.clear();
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
                            Center(
                                child: Image.asset(
                              ImageUtils.forgetPassword,
                              scale: 4,
                            )),
                            SizedBox(
                              height: 7.h,
                            ),
                            Text(
                              "Forgot Your Password?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 3.t,
                                  fontFamily: FontUtils.montserratBold),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              "Please enter the email address you used to register. We’ll send a link with instruction to reset your password.",
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratRegular,
                                  fontSize: 2.5.t),
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
                                              ? ColorUtils.purple
                                              : ColorUtils.black),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Material(
                                  elevation: model.therapistFemailFocus.hasFocus
                                      ? 10
                                      : 0,
                                  shadowColor: ColorUtils.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(7),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: model.therapistFemailFocus
                                                    .hasFocus
                                                ? ColorUtils.green
                                                : ColorUtils.border),
                                        borderRadius: BorderRadius.circular(7)),
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
                                          color: model
                                                  .therapistFemailFocus.hasFocus
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
                                            // key: model.sectionFormKey,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            controller: model.therapistfemail,
                                            focusNode:
                                                model.therapistFemailFocus,
                                            style: TextStyle(
                                                fontSize: 2.5.t,
                                                color: model
                                                        .therapistFemailFocus
                                                        .hasFocus
                                                    ? ColorUtils.green
                                                    : ColorUtils.black),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: AppLocalizations.of(
                                                      context)!
                                                  .translate('other_text_71')!,
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
                                model.theForgetLoadiing == true
                                    ? SizedBox(
                                        height: 4.h,
                                        child: CircularProgressIndicator(
                                          color: ColorUtils.green,
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          model.forgetPasswordForTherapist(
                                              context);
                                        },
                                        child: Container(
                                          width: 45.w,
                                          padding: EdgeInsets.symmetric(
                                            vertical: 2.h,
                                          ),
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
                                                  BorderRadius.circular(15)),
                                          child: Center(
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .translate(
                                                      'enter_otp_text_3')!,
                                              style: TextStyle(
                                                  color: ColorUtils.white,
                                                  fontFamily: FontUtils
                                                      .montserratSemiBold),
                                            ),
                                          ),
                                        ))
                                // InkWell(
                                //         onTap: () {

                                //         },
                                //         child: Button(
                                //             "Request Password Change", 15))
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
// import 'package:soulgood/utils/color_utils.dart';
// import 'package:soulgood/utils/dimensions.dart';
// import 'package:soulgood/utils/extensions.dart';
// import 'package:soulgood/utils/font_utils.dart';
// import 'package:soulgood/utils/image_utils.dart';
// import 'package:soulgood/viewModels/main_view_model.dart';
// import 'package:stacked/stacked.dart';

// class ForgetPasswordForTherapist extends StatefulWidget {
//   const ForgetPasswordForTherapist({Key? key}) : super(key: key);

//   @override
//   _ForgetPasswordForTherapistState createState() =>
//       _ForgetPasswordForTherapistState();
// }

// class _ForgetPasswordForTherapistState
//     extends State<ForgetPasswordForTherapist> {
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<MainViewModel>.reactive(
//       viewModelBuilder: () => locator<MainViewModel>(),
//       disposeViewModel: false,
//       onModelReady: (model) {
//         model.therapistForgetEmailFocus();
//         model.therapistfemail.clear();
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
//                               "Forgot Your Password?",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 3.t,
//                                   fontFamily: FontUtils.montserratBold),
//                             ),
//                             SizedBox(
//                               height: 4.h,
//                             ),
//                             Text(
//                               "Please enter the email address you used to register. We’ll send a link with instruction to reset your password.",
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
//                                       "Email:",
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
//                                   elevation: model.therapistFemailFocus.hasFocus
//                                       ? 10
//                                       : 0,
//                                   shadowColor: ColorUtils.grey.withOpacity(0.3),
//                                   borderRadius: BorderRadius.circular(7),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: model.therapistFemailFocus
//                                                     .hasFocus
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
//                                           color: model
//                                                   .therapistFemailFocus.hasFocus
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
//                                             controller: model.therapistfemail,
//                                             focusNode:
//                                                 model.therapistFemailFocus,
//                                             style: TextStyle(
//                                                 fontSize: 2.5.t,
//                                                 color: model
//                                                         .therapistFemailFocus
//                                                         .hasFocus
//                                                     ? ColorUtils.purple
//                                                     : ColorUtils.black),
//                                             decoration: const InputDecoration(
//                                               border: InputBorder.none,
//                                               hintText:
//                                                   'Enter your Email Address',
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
//                                 model.theForgetLoadiing == true
//                                     ? SizedBox(
//                                         height: 4.h,
//                                         child: CircularProgressIndicator(
//                                           color: ColorUtils.purple,
//                                         ),
//                                       )
//                                     : InkWell(
//                                         onTap: () {
//                                           model.forgetPasswordForTherapist(
//                                               context);
//                                         },
//                                         child: Button(
//                                             "Request Password Change", 10))
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
