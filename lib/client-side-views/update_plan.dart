import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shimmer/shimmer.dart';
import 'package:soulgood/client-side-views/payment_success.dart';
import 'package:soulgood/client-side-views/update_payment.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';
import '../utils/color_utils.dart';
import '../utils/dimensions.dart';
import '../utils/font_utils.dart';
import '../viewModels/main_view_model.dart';

class UpdatePlan extends StatefulWidget {
  String? planId;
  String? subscriptionId;
  UpdatePlan({Key? key, this.planId, this.subscriptionId}) : super(key: key);

  @override
  _UpdatePlanState createState() => _UpdatePlanState();
}

class _UpdatePlanState extends State<UpdatePlan> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.getPlans();
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
                                  .translate('purchase_subscription_text_29')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 2.5.t),
                            )
                          ],
                        ),
                        model.planLoading == true
                            ? Column(
                                children: [
                                  SizedBox(
                                    width: 100.w,
                                    height: 15.h,
                                    child: Shimmer.fromColors(
                                        baseColor: Colors.grey[100]!,
                                        highlightColor: Colors.grey[50]!,
                                        child: Container(
                                          height: 5.h,
                                          width: 5.w,
                                          color: ColorUtils.purple,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    height: 15.h,
                                    child: Shimmer.fromColors(
                                        baseColor: Colors.grey[100]!,
                                        highlightColor: Colors.grey[50]!,
                                        child: Container(
                                          height: 5.h,
                                          width: 5.w,
                                          color: ColorUtils.purple,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    height: 15.h,
                                    child: Shimmer.fromColors(
                                        baseColor: Colors.grey[200]!,
                                        highlightColor: Colors.grey[50]!,
                                        child: Container(
                                          height: 5.h,
                                          width: 5.w,
                                          color: ColorUtils.purple,
                                        )),
                                  ),
                                ],
                              )
                            : ListView.separated(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  if (model.plans[index].type != 3) {
                                    return Container(
                                      padding: EdgeInsets.only(bottom: 1.h),
                                      width: 250.w,
                                      // height: 40.h,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorUtils.purple),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w,
                                                    vertical: 1.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight: Radius
                                                                .circular(20),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8)),
                                                    color: ColorUtils.purple),
                                                child: Text(
                                                  model.plans[index].type
                                                              .toString() ==
                                                          "0"
                                                      ? AppLocalizations.of(
                                                              context)!
                                                          .translate(
                                                              'purchase_subscription_text_22')!
                                                      : model.plans[index].type
                                                                  .toString() ==
                                                              "1"
                                                          ? AppLocalizations.of(
                                                                  context)!
                                                              .translate(
                                                                  'purchase_subscription_text_23')!
                                                          : model.plans[index]
                                                                      .type
                                                                      .toString() ==
                                                                  "2"
                                                              ? AppLocalizations
                                                                      .of(
                                                                          context)!
                                                                  .translate(
                                                                      'purchase_subscription_text_24')!
                                                              : "",
                                                  style: TextStyle(
                                                      fontFamily: FontUtils
                                                          .montserratMedium,
                                                      color: ColorUtils.white,
                                                      fontSize: 1.4.t),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Dimensions
                                                    .horizontalPadding),
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                      model.selectedAppLanguage !=
                                                              1
                                                          ? model.plans[index]
                                                              .title
                                                              .toString()
                                                          : model.plans[index]
                                                              .title_in_chinese
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontFamily: FontUtils
                                                              .montserratBold,
                                                          color:
                                                              ColorUtils.black,
                                                          fontSize: 2.t)),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Row(
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text:
                                                                  "HDK${model.plans[index].total_amount}",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color:
                                                                      ColorUtils
                                                                          .black,
                                                                  fontSize:
                                                                      3.t)),
                                                          TextSpan(
                                                              text: '/month',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .montserratRegular,
                                                                  fontSize: 2.t,
                                                                  color: ColorUtils
                                                                      .black)),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                Html(
                                                    data: model.selectedAppLanguage !=
                                                            1
                                                        ? model
                                                            .plans[index].detail
                                                        : model.plans[index]
                                                            .detail_in_chinese),
                                                // Text(
                                                //   model.plans[index].detail
                                                //       .toString(),
                                                //   style: TextStyle(
                                                //       fontSize: 2.t,
                                                //       fontFamily: FontUtils
                                                //           .montserratSemiBold),
                                                // ),
                                                SizedBox(height: 2.h),
                                                // Row(
                                                //   mainAxisAlignment:
                                                //       MainAxisAlignment.start,
                                                //   crossAxisAlignment:
                                                //       CrossAxisAlignment.start,
                                                //   children: [
                                                //     SvgPicture.asset(
                                                //       ImageUtils.dot,
                                                //       height: 2.3.h,
                                                //       fit: BoxFit.scaleDown,
                                                //     ),
                                                //     Expanded(
                                                //       child: Text("Live Video Call",
                                                //           style: TextStyle(
                                                //               fontFamily: FontUtils
                                                //                   .montserratRegular,
                                                //               fontSize: 1.8.t,
                                                //               color: ColorUtils
                                                //                   .black
                                                //                   .withOpacity(
                                                //                       0.7))),
                                                //     ),
                                                //   ],
                                                // ),
                                                SizedBox(
                                                  height: 15.h,
                                                ),
                                                widget.planId ==
                                                        model.plans[index]
                                                            .plan_id
                                                    ? Container(
                                                        width: 35.w,
                                                        decoration: BoxDecoration(
                                                            color: ColorUtils
                                                                .greyLight,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7)),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      1.7.h),
                                                          child: Center(
                                                            child: Text(
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .translate(
                                                                      'purchase_subscription_text_9')!,
                                                              style: TextStyle(
                                                                  color:
                                                                      ColorUtils
                                                                          .white,
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .montserratBold,
                                                                  fontSize:
                                                                      1.7.t),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : model.createLoading ==
                                                            true
                                                        ? SizedBox(
                                                            height: 4.h,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: ColorUtils
                                                                  .purple,
                                                            ),
                                                          )
                                                        : InkWell(
                                                            onTap: () {
                                                              model.createBillingPortal(
                                                                  context,
                                                                  model.plans[
                                                                      index]);
                                                            },
                                                            child: Container(
                                                              width: 35.w,
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      ColorUtils
                                                                          .purple,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7)),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            1.7.h),
                                                                child: Center(
                                                                  child: Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .translate(
                                                                            'purchase_subscription_text_9')!,
                                                                    style: TextStyle(
                                                                        color: ColorUtils
                                                                            .white,
                                                                        fontFamily:
                                                                            FontUtils
                                                                                .montserratBold,
                                                                        fontSize:
                                                                            1.7.t),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 4.h,
                                    ),
                                itemCount: model.plans.length),
                        SizedBox(
                          height: 5.h,
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
