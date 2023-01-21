import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/client-side-views/threpist_details.dart';
import 'package:soulgood/client-side-views/choose_your_plan.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/constants.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';

class BeforeSubsChat extends StatefulWidget {
  String? id;
  String? image;
  String? name;
  String? qualification;
  String? description;
  BeforeSubsChat(
      {Key? key,
      this.id,
      this.image,
      this.name,
      this.qualification,
      this.description})
      : super(key: key);

  @override
  _BeforeSubsChatState createState() => _BeforeSubsChatState();
}

class _BeforeSubsChatState extends State<BeforeSubsChat> {
  MainViewModel model = locator<MainViewModel>();
  // void initState() {
  //   super.initState();
  //   navigateToChat();
  // }
  //
  // navigateToChat()async{
  //   await Future.delayed(Duration(milliseconds: 5000),(){});
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AfterSubsChats()));
  // }
  @override
  Widget build(BuildContext context) {
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: ColorUtils.black,
                              size: 4.i,
                            )),
                        CircleAvatar(
                            backgroundColor: ColorUtils.blue,
                            foregroundImage: NetworkImage(
                              'https://api-prod.soulgoodhealth.com:5000' +
                                  Constants.blogImage +
                                  model.therapistDetail!.image.toString(),
                              // height: 10.h,
                              // width: 15.w,
                              // fit: BoxFit.fill,
                            )
                            // NetworkImage(model.therapistDetail!.image.toString()),
                            ),
                        SizedBox(
                          width: 2.w,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ThrepistDetails()));
                          },
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model.therapistDetail!.name.toString(),
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratSemiBold,
                                      fontSize: 2.5.t),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                // Text(
                                //   "Online",
                                //   style: TextStyle(
                                //       fontFamily: FontUtils.montserratMedium,
                                //       fontSize: 1.5.t,
                                //       color: ColorUtils.green),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        // Expanded(
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       InkWell(
                        //         onTap: () {},
                        //         child: Container(
                        //             width: 13.w,
                        //             // height: 8.h,
                        //             padding: EdgeInsets.only(
                        //                 top: 0.5.h, bottom: 0.5.h),
                        //             decoration: BoxDecoration(
                        //                 color: ColorUtils.purple,
                        //                 shape: BoxShape.circle),
                        //             child: Icon(
                        //               Icons.videocam,
                        //               color: ColorUtils.white,
                        //             )),
                        //       ),
                        //       InkWell(
                        //         onTap: () {},
                        //         child: Container(
                        //             width: 13.w,
                        //             // height: 8.h,
                        //             padding: EdgeInsets.only(
                        //                 top: 0.5.h, bottom: 0.5.h),
                        //             decoration: BoxDecoration(
                        //                 color: ColorUtils.purple,
                        //                 shape: BoxShape.circle),
                        //             child: Icon(
                        //               Icons.call,
                        //               color: ColorUtils.white,
                        //             )),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)!
                              .translate('other_text_61')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratBold,
                              color: ColorUtils.purple,
                              fontSize: 2.5.t),
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          indent: 36.w,
                          endIndent: 35.w,
                          color: ColorUtils.purple,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Divider(
                          indent: 3.w,
                          endIndent: 3.w,
                          thickness: 1,
                          color: ColorUtils.border,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('other_text_62')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratMedium,
                              fontSize: 2.2.t),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Divider(
                          indent: 3.w,
                          endIndent: 3.w,
                          thickness: 1,
                          color: ColorUtils.border,
                        ),
                        SvgPicture.asset(ImageUtils.subscription),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('other_text_33')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratBold,
                              fontSize: 2.5.t),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        // Text(
                        //   AppLocalizations.of(context)!.translate('other_text_64')!,
                        //   style: TextStyle(
                        //       fontFamily: FontUtils.montserratRegular,
                        //       fontSize: 2.t),
                        //   textAlign: TextAlign.center,
                        // ),
                        // SizedBox(
                        //   height: 8.h,
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => const ChoosePlan()));
                        //   },
                        //   child: Container(
                        //     width: 50.w,
                        //     decoration: BoxDecoration(
                        //         color: ColorUtils.purple,
                        //         borderRadius: BorderRadius.circular(7)),
                        //     child: Padding(
                        //       padding: EdgeInsets.symmetric(vertical: 1.7.h),
                        //       child: Center(
                        //         child: Text(
                        //           AppLocalizations.of(context)!.translate('purchase_subscription_text_3')!,
                        //           style: TextStyle(
                        //               color: ColorUtils.white,
                        //               fontFamily: FontUtils.montserratBold,
                        //               fontSize: 1.7.t),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 3.h,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
