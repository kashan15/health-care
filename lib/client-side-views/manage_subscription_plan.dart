import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/client-side-views/update_payment.dart';
import 'package:soulgood/client-side-views/update_plan.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class ManageSubscriptionPlan extends StatefulWidget {
  const ManageSubscriptionPlan({Key? key}) : super(key: key);

  @override
  _ManageSubscriptionPlanState createState() => _ManageSubscriptionPlanState();
}

class _ManageSubscriptionPlanState extends State<ManageSubscriptionPlan> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        model.getSubscriptionLogs();
        model.sharedPreferences = await SharedPreferences.getInstance();
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
                              AppLocalizations.of(context)!
                                  .translate('user_db_home_text_9')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 2.5.t),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // "Please note the following:",
                                AppLocalizations.of(context)!
                                    .translate('other_text_94')!,
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratRegular,
                                    fontSize: 1.8.t),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                // "Will be effective upon the next billing cycle",
                                AppLocalizations.of(context)!
                                    .translate('other_text_95')!,
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratSemiBold,
                                    fontSize: 1.8.t),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              // Padding(
                              //   padding: EdgeInsets.only(left: 4.w),
                              //   child: Text(
                              //     // "• Pay the price difference for the current billing cycle",
                              //     AppLocalizations.of(context)!
                              //         .translate('other_text_96')!,
                              //     style: TextStyle(
                              //         fontFamily: FontUtils.montserratRegular,
                              //         fontSize: 1.8.t),
                              //   ),
                              // ),

                              // Padding(
                              //   padding: EdgeInsets.only(left: 6.w),
                              //   child: Text(
                              //     "billing cycle",
                              //     style: TextStyle(
                              //         fontFamily: FontUtils.montserratRegular,
                              //         fontSize: 1.8.t),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: EdgeInsets.only(left: 4.w),
                              //   child: Text(
                              //     // "• Will be effective immediately",
                              //     AppLocalizations.of(context)!
                              //         .translate('other_text_97')!,
                              //     style: TextStyle(
                              //         fontFamily: FontUtils.montserratRegular,
                              //         fontSize: 1.8.t),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 3.h,
                              // ),
                              // Text(
                              //   // "For downgrading or cancellations:",
                              //   AppLocalizations.of(context)!
                              //       .translate('other_text_98')!,
                              //   style: TextStyle(
                              //       fontFamily: FontUtils.montserratSemiBold,
                              //       fontSize: 1.8.t),
                              // ),
                              // SizedBox(
                              //   height: 1.h,
                              // ),

                              // Padding(
                              //   padding: EdgeInsets.only(left: 4.w),
                              //   child: Text(
                              //     // "• Price difference will not be refunded",
                              //     AppLocalizations.of(context)!
                              //         .translate('other_text_99')!,
                              //     style: TextStyle(
                              //         fontFamily: FontUtils.montserratRegular,
                              //         fontSize: 1.8.t),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: EdgeInsets.only(left: 4.w),
                              //   child: Text(
                              //     // "• Will be effective upon the next billing cycle",
                              //     AppLocalizations.of(context)!
                              //         .translate('other_text_100')!,
                              //     style: TextStyle(
                              //         fontFamily: FontUtils.montserratRegular,
                              //         fontSize: 1.8.t),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.horizontalPadding,
                              vertical: 1.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: ColorUtils.border)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: 50.w,
                                          child: Html(
                                              data: model.selectedAppLanguage !=
                                                      1
                                                  ? model.sharedPreferences!.getInt(
                                                              'selectedAppLanguage') !=
                                                          1
                                                      ? model.checkUserPlan[0]
                                                          .title
                                                      : model.checkUserPlan[0]
                                                          .title_in_chinese
                                                  : model.checkUserPlan[0]
                                                      .title_in_chinese)),
                                      // Text(
                                      //   "Messaging + 1 Live Video",
                                      //   style: TextStyle(
                                      //       fontFamily:
                                      //           FontUtils.montserratSemiBold,
                                      //       fontSize: 2.t),
                                      // ),
                                      // SizedBox(
                                      //   height: 0.5.h,
                                      // ),
                                      // Html(data: model.checkUserPlan[0].)
                                      // Text(
                                      //   "Nikki Cross",
                                      //   style: TextStyle(
                                      //       fontFamily:
                                      //           FontUtils.montserratRegular,
                                      //       fontSize: 1.5.t),
                                      // )
                                    ],
                                  ),
                                  // CircleAvatar(
                                  //   foregroundImage:
                                  //       AssetImage(ImageUtils.support),
                                  //   radius: 4.i,
                                  // )
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Html(
                                  data: model.selectedAppLanguage != 1 &&
                                          model.sharedPreferences!.getInt(
                                                  'selectedAppLanguage') !=
                                              1
                                      ? model.checkUserPlan[0].detail
                                      : model
                                          .checkUserPlan[0].detail_in_chinese),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate('user_db_home_text_16')!,
                                    style: TextStyle(
                                        fontFamily: FontUtils.montserratRegular,
                                        fontSize: 2.t),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Html(
                                  data:
                                      "\$${model.checkUserPlan[0].total_amount}"),
                              SizedBox(
                                height: 4.h,
                              ),
                              model.subsLog.isEmpty
                                  ? Row(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!
                                              .translate(
                                                  'user_db_home_text_17')!,
                                          style: TextStyle(
                                              fontFamily:
                                                  FontUtils.montserratRegular,
                                              fontSize: 2.t),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              SizedBox(
                                height: 1.h,
                              ),
                              model.subsLog.isEmpty
                                  ? Html(
                                      data: model.checkUserPlan[0].end_date!
                                          .substring(0, 21))
                                  : Text(model.selectedAppLanguage != 1 &&
                                          model.sharedPreferences!.getInt(
                                                  'selectedAppLanguage') !=
                                              1
                                      ? model.subsLog[0].detail.toString()
                                      : model.subsLog[0].detail_in_chinese
                                          .toString()),
                              // Row(5
                              //   children: [
                              //     Text(
                              //       "24 September, 20219",
                              //       style: TextStyle(
                              //           fontFamily:
                              //               FontUtils.montserratSemiBold,
                              //           fontSize: 2.2.t),
                              //     ),
                              //   ],
                              // ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Divider(),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        model.planData = model.plans;
                                        model.subPlanId =
                                            model.checkUserPlan[0].plan_id;
                                        model.planDetail =
                                            model.checkUserPlan[0].detail;
                                        model.subType =
                                            model.checkUserPlan[0].type;
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdatePlan(
                                                      planId: model
                                                          .checkUserPlan[0]
                                                          .plan_id,
                                                      subscriptionId: model
                                                          .checkUserPlan[0]
                                                          .strip_subscription_id,
                                                    )));
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)!.translate(
                                            'purchase_subscription_text_19')!,
                                        style: TextStyle(
                                            fontFamily:
                                                FontUtils.montserratRegular,
                                            fontSize: 2.t,
                                            color: ColorUtils.purple),
                                      )),
                                  InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            title: SvgPicture.asset(
                                                ImageUtils.cancel),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: Dimensions
                                                        .horizontalPadding),
                                            content: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(height: 3.h),
                                                  Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .translate(
                                                            'purchase_subscription_text_27')!,
                                                    style: TextStyle(
                                                        fontFamily: FontUtils
                                                            .montserratBold,
                                                        fontSize: 2.t),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(height: 5.h),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color:
                                                                      ColorUtils
                                                                          .green),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 2.5.w,
                                                                  bottom: 2.h,
                                                                  right: 2.5.w,
                                                                  top: 2.h),
                                                          child: Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .translate(
                                                                    'other_text_45')!,
                                                            style: TextStyle(
                                                                fontSize: 2.t,
                                                                fontFamily:
                                                                    FontUtils
                                                                        .montserratSemiBold,
                                                                color:
                                                                    ColorUtils
                                                                        .green),
                                                          ),
                                                        ),
                                                      ),
                                                      model.cancelLodaing ==
                                                              true
                                                          ? SizedBox(
                                                              height: 4.h,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color:
                                                                    ColorUtils
                                                                        .purple,
                                                              ),
                                                            )
                                                          : InkWell(
                                                              onTap: () {
                                                                model.cancelBillingPortal(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: ColorUtils
                                                                        .green,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            1.w,
                                                                        bottom:
                                                                            2.h,
                                                                        right:
                                                                            1.w,
                                                                        top: 2
                                                                            .h),
                                                                child: Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .translate(
                                                                          'other_text_34')!,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          2.t,
                                                                      fontFamily:
                                                                          FontUtils
                                                                              .montserratSemiBold,
                                                                      color: ColorUtils
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)!.translate(
                                            'purchase_subscription_text_20')!,
                                        style: TextStyle(
                                            fontFamily:
                                                FontUtils.montserratRegular,
                                            fontSize: 2.t,
                                            color: ColorUtils.purple),
                                      )),
                                ],
                              ),
                              // SizedBox(
                              //   height: 3.h,
                              // ),
                              // Text(
                              //   AppLocalizations.of(context)!.translate(
                              //       'purchase_subscription_text_28')!,
                              //   style: TextStyle(
                              //       fontFamily: FontUtils.montserratMedium,
                              //       fontSize: 2.t),
                              //   textAlign: TextAlign.center,
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
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
