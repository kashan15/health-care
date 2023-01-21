import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shimmer/shimmer.dart';
import 'package:soulgood/Widget/subscription_pan_card.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/client-side-views/review_detail.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class ChoosePlan extends StatefulWidget {
  const ChoosePlan({Key? key}) : super(key: key);

  @override
  _ChoosePlanState createState() => _ChoosePlanState();
}

class _ChoosePlanState extends State<ChoosePlan> {
  get SvgPicture => null;

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
                    physics: const NeverScrollableScrollPhysics(),
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
                          height: 1.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.green),
                                    child: Text(
                                      "1",
                                      style: TextStyle(color: ColorUtils.white),
                                    ),
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.translate(
                                        'purchase_subscription_text_4')!,
                                    style: TextStyle(
                                        fontFamily:
                                            FontUtils.montserratSemiBold,
                                        fontSize: 1.5.t,
                                        color: ColorUtils.green),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              SizedBox(
                                height: 4.h,
                                child: const VerticalDivider(),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.border),
                                    child: Text(
                                      "2",
                                      style: TextStyle(color: ColorUtils.white),
                                    ),
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.translate(
                                        'purchase_subscription_text_5')!,
                                    style: TextStyle(
                                        fontFamily:
                                            FontUtils.montserratSemiBold,
                                        fontSize: 1.5.t,
                                        color: ColorUtils.border),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              SizedBox(
                                height: 4.h,
                                child: const VerticalDivider(),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.border),
                                    child: Text(
                                      "3",
                                      style: TextStyle(color: ColorUtils.white),
                                    ),
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.translate(
                                        'purchase_subscription_text_6')!,
                                    style: TextStyle(
                                        fontFamily:
                                            FontUtils.montserratSemiBold,
                                        fontSize: 1.5.t,
                                        color: ColorUtils.border),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('purchase_subscription_text_7')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratBold,
                              fontSize: 2.2.t),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('purchase_subscription_text_8')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratRegular,
                              fontSize: 2.t),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 4.h,
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
                            : Container(
                                padding: EdgeInsets.only(bottom: 40.h),
                                height: MediaQuery.of(context).size.height,
                                child: ListView.separated(
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      if (model.plans[index].type != 3) {
                                        return Container(
                                          padding: EdgeInsets.only(bottom: 1.h),
                                          width: 220.w,
                                          // height: 40.h,
                                          decoration: BoxDecoration(
                                              color: ColorUtils.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 2,
                                                    offset: Offset(0, 6),
                                                    color: ColorUtils.grey
                                                        .withOpacity(0.4))
                                              ],
                                              border: Border.all(
                                                  color: ColorUtils.border),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.w,
                                                            vertical: 1.h),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            20),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8)),
                                                        color:
                                                            ColorUtils.green),
                                                    child: Text(
                                                      model.plans[index].type
                                                                  .toString() ==
                                                              "0"
                                                          ? AppLocalizations.of(
                                                                  context)!
                                                              .translate(
                                                                  'purchase_subscription_text_22')!
                                                          : model.plans[index]
                                                                      .type
                                                                      .toString() ==
                                                                  "1"
                                                              ? AppLocalizations
                                                                      .of(
                                                                          context)!
                                                                  .translate(
                                                                      'purchase_subscription_text_23')!
                                                              : model
                                                                          .plans[
                                                                              index]
                                                                          .type
                                                                          .toString() ==
                                                                      "2"
                                                                  ? AppLocalizations.of(
                                                                          context)!
                                                                      .translate(
                                                                          'purchase_subscription_text_24')!
                                                                  : "",
                                                      style: TextStyle(
                                                          fontFamily: FontUtils
                                                              .montserratMedium,
                                                          color:
                                                              ColorUtils.white,
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
                                                              ? model
                                                                  .plans[index]
                                                                  .title
                                                                  .toString()
                                                              : model
                                                                  .plans[index]
                                                                  .title_in_chinese
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontFamily: FontUtils
                                                                  .montserratBold,
                                                              color: ColorUtils
                                                                  .black,
                                                              fontSize: 2.t)),
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        RichText(
                                                          text: TextSpan(
                                                            children: <
                                                                TextSpan>[
                                                              TextSpan(
                                                                  text:
                                                                      "HDK${model.plans[index].total_amount}",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: ColorUtils
                                                                          .black,
                                                                      fontSize:
                                                                          3.t)),
                                                              TextSpan(
                                                                  text:
                                                                      '/month',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          FontUtils
                                                                              .montserratRegular,
                                                                      fontSize:
                                                                          2.t,
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
                                                            ? model.plans[index]
                                                                .detail
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
                                                    InkWell(
                                                      onTap: () {
                                                        model.plankiId = model
                                                            .plans[index]
                                                            .plan_id;
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        ReviewDetails(
                                                                          packageName: model.selectedAppLanguage != 1
                                                                              ? model.plans[index].title
                                                                              : model.plans[index].title_in_chinese,
                                                                          type: model.plans[index].type.toString() == "0"
                                                                              ? AppLocalizations.of(context)!.translate('purchase_subscription_text_22')!
                                                                              : model.plans[index].type.toString() == "1"
                                                                                  ? AppLocalizations.of(context)!.translate('purchase_subscription_text_23')!
                                                                                  : model.plans[index].type.toString() == "2"
                                                                                      ? AppLocalizations.of(context)!.translate('purchase_subscription_text_24')!
                                                                                      : model.plans[index].type.toString() == "3"
                                                                                          ? "ultra Pro max"
                                                                                          : "",
                                                                          detail: model.selectedAppLanguage != 1
                                                                              ? model.plans[index].detail
                                                                              : model.plans[index].detail_in_chinese,
                                                                          totalaAmount: model
                                                                              .plans[index]
                                                                              .total_amount
                                                                              .toString(),
                                                                          plan_Id: model
                                                                              .plans[index]
                                                                              .plan_id,
                                                                        )));
                                                      },
                                                      child: Container(
                                                        width: 35.w,
                                                        decoration: BoxDecoration(
                                                            color: ColorUtils
                                                                .green,
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
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                    itemCount: model.plans.length),
                              ),
                        SizedBox(
                          height: 5.h,
                        )
                        // SubscriptionPlanCard("Lite", "HDK799",
                        //     "Lite Package, 1 Live Session", context),
                        // SizedBox(
                        //   height: 4.h,
                        // ),
                        // SubscriptionPlanCard("Basic (Most Popular)", "HDK1499",
                        //     "Basic Package, 2 Live Session", context),
                        // SizedBox(
                        //   height: 4.h,
                        // ),
                        // SubscriptionPlanCard("Comprehensive", "HDK2799",
                        //     "Comprehensive  Package, 4 Live Session", context),
                        // SizedBox(
                        //   height: 4.h,
                        // ),
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
