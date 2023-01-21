import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/registeration-login/login.dart';
import 'package:soulgood/registeration-login/register.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
            },
            child: Scaffold(
              backgroundColor: ColorUtils.almond,
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
                            Text(
                              AppLocalizations.of(context)!
                                  .translate('user_db_sidebar_text_15')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 2.5.t),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 5.i,
                              backgroundColor:
                                  ColorUtils.black.withOpacity(0.8),
                              foregroundColor:
                                  ColorUtils.black.withOpacity(0.6),
                              child: Text(
                                model.username.isEmpty
                                    ? "ma"
                                    : model.username.substring(0, 2).toString(),
                                style: TextStyle(color: ColorUtils.white),
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model.username.toString(),
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratMedium,
                                      fontSize: 2.2.t),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  "Joined Aug 24,2021",
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratMedium,
                                      fontSize: 1.8.t,
                                      color: ColorUtils.border),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .translate('user_db_sidebar_text_10')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 1.8.t),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        model.navigateToAccountDetails();
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.w),
                        decoration: BoxDecoration(
                            color: ColorUtils.white,
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.horizontalPadding,
                            vertical: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: Row(
                              children: [
                                SvgPicture.asset(ImageUtils.profile1),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate('user_db_sidebar_text_11')!,
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratMedium,
                                      fontSize: 2.t),
                                )
                              ],
                            )),
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
                      height: 40.h,
                    ),
                    InkWell(
                      onTap: () {
                        model.logOut();
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorUtils.LightGrey,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.horizontalPadding,
                            vertical: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              ImageUtils.logout,
                              color: ColorUtils.black,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .translate('user_db_sidebar_text_12')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratMedium,
                                  fontSize: 2.t,
                                  color: ColorUtils.black),
                            )
                          ],
                        ),
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
