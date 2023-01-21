import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/registeration-login/login.dart';
import 'package:soulgood/registeration-login/register.dart';
import 'package:soulgood/therapist-side-view/login.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';

class LoginTabBar extends StatefulWidget {
  const LoginTabBar({Key? key}) : super(key: key);

  @override
  _LoginTabBarState createState() => _LoginTabBarState();
}

class _LoginTabBarState extends State<LoginTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            backgroundColor: ColorUtils.almond,
            body: Column(
              children: [
                SizedBox(height: 7.h),
                Image.asset(
                  ImageUtils.soulgood,
                  height: 10.i,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                    // decoration: BoxDecoration(color: ColorUtils.baby),
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.horizontalPadding,
                        vertical: 1.h),
                    child: Row(children: [
                      Expanded(
                        child: TabBar(
                            padding: EdgeInsets.zero,
                            indicatorColor: Colors.transparent,
                            labelPadding: EdgeInsets.zero,

                            // indicatorSize: TabBarIndicatorSize.label,
                            // labelPadding:
                            // EdgeInsets.symmetric(horizontal: 2.w),
                            labelColor: ColorUtils.green,
                            // padding: EdgeInsets.zero,
                            labelStyle: TextStyle(
                                fontSize: 2.t,
                                fontFamily: FontUtils.montserratBold),
                            unselectedLabelColor: ColorUtils.border,
                            indicator: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                                border: Border.all(color: ColorUtils.green)),
                            tabs: [
                              Tab(
                                child: Text(AppLocalizations.of(context)!
                                    .translate('login_text_6')!),
                              ),
                              Tab(
                                child: Text(AppLocalizations.of(context)!
                                    .translate('login_text_3')!),
                              ),
                            ]),
                      ),
                    ])),
                Expanded(
                    child: TabBarView(children: [
                  Patient(),
                  TherapistLogin(),
                ])),
              ],
            ),
          ),
        ));
  }
}

/// OLD CODE

// import 'package:flutter/material.dart';
// import 'package:flutter_html/shims/dart_ui_real.dart';
// import 'package:soulgood/registeration-login/login.dart';
// import 'package:soulgood/registeration-login/register.dart';
// import 'package:soulgood/therapist-side-view/login.dart';
// import 'package:soulgood/utils/app_localization.dart';
// import 'package:soulgood/utils/color_utils.dart';
// import 'package:soulgood/utils/dimensions.dart';
// import 'package:soulgood/utils/extensions.dart';
// import 'package:soulgood/utils/font_utils.dart';

// class LoginTabBar extends StatefulWidget {
//   const LoginTabBar({Key? key}) : super(key: key);

//   @override
//   _LoginTabBarState createState() => _LoginTabBarState();
// }

// class _LoginTabBarState extends State<LoginTabBar> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           body: Column(
//             children: [
//               SizedBox(
//                 height: 7.h,
//               ),
//               Container(
//                   decoration: BoxDecoration(color: ColorUtils.baby),
//                   padding: EdgeInsets.symmetric(
//                       horizontal: Dimensions.horizontalPadding, vertical: 1.h),
//                   child: Row(children: [
//                     Expanded(
//                       child: TabBar(
//                           indicatorColor: Colors.transparent,

//                           // indicatorSize: TabBarIndicatorSize.label,
//                           // labelPadding:
//                           // EdgeInsets.symmetric(horizontal: 2.w),
//                           labelColor: ColorUtils.purple,
//                           // padding: EdgeInsets.zero,
//                           labelStyle: TextStyle(
//                               fontSize: 2.t,
//                               fontFamily: FontUtils.montserratBold),
//                           unselectedLabelColor: ColorUtils.border,
//                           indicator: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(4),
//                               border: Border.all(color: ColorUtils.purple)),
//                           tabs: [
//                             Tab(
//                               child: Text(
//                                 // "Client"
//                                 AppLocalizations.of(context)!.translate('login_text_6')!
//                                 ),
//                             ),
//                             Tab(
//                               child: Text(
//                                 // "Therapist"
//                                 AppLocalizations.of(context)!.translate('login_text_3')!

//                               ),
//                             ),
//                           ]),
//                     ),
//                   ])),
//               Expanded(
//                   child: TabBarView(children: [
//                 Patient(),
//                 TherapistLogin(),
//               ])),
//             ],
//           ),
//         ));
//   }
// }
