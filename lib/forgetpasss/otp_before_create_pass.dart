import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class BeforeOTP extends StatefulWidget {
  const BeforeOTP({Key? key}) : super(key: key);

  @override
  _BeforeOTPState createState() => _BeforeOTPState();
}

class _BeforeOTPState extends State<BeforeOTP> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.otp.clear();
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
                      children: [
                        SizedBox(
                          height: Dimensions.topMargin,
                        ),
        
                        Row(
                          children: [
                            //IconButton(onPressed: (){model.navigateBack();}, icon: Icon(Icons.arrow_back_ios,color: ColorUtils.black,size: 4.i,)),
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
                          height: 10.h,
                        ),
                        Text(
                          "Please Enter OTP",
                          style: TextStyle(
                              fontFamily: FontUtils.montserratBold,
                              fontSize: 3.t),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Text(
                          "Enter the OTP that we have sent you on your email to continue the process.",
                          style: TextStyle(
                              fontFamily: FontUtils.montserratMedium,
                              fontSize: 2.2.t,
                              color: ColorUtils.greyLight),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: PinCodeTextField(
                                controller: model.otp,
                                autofocus: false,
                                highlight: true,
                                highlightColor: ColorUtils.purple,
                                defaultBorderColor: ColorUtils.greyLight,
                                hasTextBorderColor: ColorUtils.greyLight,
                                pinBoxWidth: 15.w,
                                pinBoxHeight: 7.5.h,
                                wrapAlignment: WrapAlignment.spaceAround,
                                pinBoxDecoration: ProvidedPinBoxDecoration
                                    .defaultPinBoxDecoration,
                                pinTextStyle: TextStyle(fontSize: 22.0),
                                pinTextAnimatedSwitcherTransition:
                                    ProvidedPinBoxTextAnimation.scalingTransition,
                                pinTextAnimatedSwitcherDuration:
                                    Duration(milliseconds: 300),
                                highlightAnimationBeginColor: Colors.black,
                                highlightAnimationEndColor: Colors.transparent,
                                keyboardType: TextInputType.number,
                                pinBoxRadius: 6,
                                pinBoxOuterPadding:
                                    EdgeInsets.symmetric(horizontal: 4.w),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Did not receive it? ",
                              style: TextStyle(
                                  color: ColorUtils.border,
                                  fontFamily: FontUtils.montserratRegular),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Resend email",
                                style: TextStyle(
                                    color: ColorUtils.purple,
                                    fontFamily: FontUtils.montserratBold),
                              ),
                            ),
                          ],
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
                        //   height: 5.h,
                        // ),
                        InkWell(
                            onTap: () {
                              model.forgetOtpcheck();
                            },
                            child: Button("Verify Email",15)),
                      ],
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }
}
