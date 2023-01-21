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

class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.getUserPlan();
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
                          height: 30.h,
                        ),
                        // SvgPicture.asset(ImageUtils.subscription),
                        // SizedBox(
                        //   height: 5.h,
                        // ),
                        // Text(
                        //   AppLocalizations.of(context)!
                        //       .translate('other_text_63')!,
                        //   style: TextStyle(
                        //       fontFamily: FontUtils.montserratBold,
                        //       fontSize: 2.5.t),
                        // ),
                        // SizedBox(
                        //   height: 4.h,
                        // ),
                        Text(
                          // "Please choose a \nsubscription plan to begin!",
                          AppLocalizations.of(context)!
                              .translate('other_text_92')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratRegular,
                              fontSize: 2.2.t),
                          textAlign: TextAlign.center,
                        ),
                        // SizedBox(
                        //   height: 8.h,
                        // ),
                        SizedBox(
                          height: 10.h,
                        ),
                        InkWell(
                          onTap: () {
                            model.navigateToChooseYourPlan();
                          },
                          child: Container(
                            width: 50.w,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 2,
                                      color: ColorUtils.grey.withOpacity(0.4))
                                ],
                                color: ColorUtils.orange,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.h),
                              child: Center(
                                child: Text(
                                  // "Subscription Plans",
                                  AppLocalizations.of(context)!
                                      .translate('other_text_91')!,
                                  style: TextStyle(
                                      color: ColorUtils.black,
                                      fontFamily: FontUtils.montserratSemiBold,
                                      fontSize: 1.7.t),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }
}
