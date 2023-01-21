import 'package:date_picker_timeline/extra/dimen.dart';
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

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        // model.isEmailInFocus = false;
        // model.isPasswordInFocus = false;
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: Dimensions.topMargin,
                        ),
                        Image.asset(
                          ImageUtils.soulgood,
                          height: 12.i,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                            child: Text(
                          AppLocalizations.of(context)!.translate('verify_email_text_1')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratMedium,
                              fontSize: 2.2.t,
                              color: ColorUtils.border),
                          textAlign: TextAlign.center,
                        )),
                        SizedBox(
                          height: Dimensions.topMargin,
                        ),
                        SvgPicture.asset(ImageUtils.verify),
                        SizedBox(
                          height: 7.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('other_text_66')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratBold,
                              fontSize: 3.t),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('other_text_67')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratRegular,
                              fontSize: 2.2.t),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        InkWell(
                            onTap: () {
                              model.navigateToOTP();
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
                                        color: ColorUtils.grey.withOpacity(0.2))
                                  ],
                                  color: ColorUtils.green,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('other_text_14')!,
                                  style: TextStyle(
                                      color: ColorUtils.white,
                                      fontFamily: FontUtils.montserratSemiBold),
                                ),
                              ),
                            )
                            //  Button(
                            //     AppLocalizations.of(context)!
                            //         .translate('other_text_14')!,
                            //     15)),
                            )
                      ],
                    ),
                  ))),
        );
      },
    );
  }
}
