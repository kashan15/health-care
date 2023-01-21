import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:soulgood/Widget/error_widget.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/client-side-views/check_out.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dialog_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

import '../utils/app_localization.dart';

class ReviewDetails extends StatefulWidget {
  String? plan_Id;
  String? packageName;
  String? totalaAmount;
  String? detail;
  String? type;
  ReviewDetails(
      {Key? key,
      this.packageName,
      this.totalaAmount,
      this.detail,
      this.type,
      this.plan_Id})
      : super(key: key);

  @override
  _ReviewDetailsState createState() => _ReviewDetailsState();
}

class _ReviewDetailsState extends State<ReviewDetails> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return SafeArea(
          top: false,
          // bottom: false,
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
                    physics: BouncingScrollPhysics(),
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
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.border),
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
                                        color: ColorUtils.border),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Container(
                                height: 4.h,
                                child: VerticalDivider(),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.green),
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
                                        color: ColorUtils.green),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Container(
                                height: 4.h,
                                child: VerticalDivider(),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
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
                          // "Review Your Therapy Plan",
                          AppLocalizations.of(context)!
                              .translate('purchase_subscription_text_10')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratBold,
                              fontSize: 2.2.t),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('purchase_subscription_text_11')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratRegular,
                              fontSize: 2.t),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: ColorUtils.border)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 1.h),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(8)),
                                        color: ColorUtils.green),
                                    child: Text(
                                      widget.type.toString(),
                                      style: TextStyle(
                                          fontFamily:
                                              FontUtils.montserratMedium,
                                          color: ColorUtils.white,
                                          fontSize: 1.4.t),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.horizontalPadding),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:
                                                      "HDK${widget.totalaAmount}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorUtils.black,
                                                      fontSize: 3.t)),
                                              TextSpan(
                                                  text: '/month',
                                                  style: TextStyle(
                                                      fontFamily: FontUtils
                                                          .montserratRegular,
                                                      fontSize: 2.t,
                                                      color: ColorUtils.black)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Html(data: widget.detail),
                                    // SizedBox(
                                    //   height: 1.h,
                                    // ),
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
                                    //       child: Text(
                                    //           "1 Live Session/month (30 min)",
                                    //           style: TextStyle(
                                    //               fontFamily: FontUtils
                                    //                   .montserratRegular,
                                    //               fontSize: 1.8.t,
                                    //               color: ColorUtils.black
                                    //                   .withOpacity(0.7))),
                                    //     ),
                                    //   ],
                                    // ),
                                    // SizedBox(
                                    //   height: 1.h,
                                    // ),
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
                                    //       child: Text(
                                    //           "Text, video & audio messaging",
                                    //           style: TextStyle(
                                    //               fontFamily: FontUtils
                                    //                   .montserratRegular,
                                    //               fontSize: 1.8.t,
                                    //               color: ColorUtils.black
                                    //                   .withOpacity(0.7))),
                                    //     ),
                                    //   ],
                                    // ),
                                    // SizedBox(
                                    //   height: 1.h,
                                    // ),
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
                                    //       child: Text(
                                    //           "Guaranteed Dialy Responses 5 days/week",
                                    //           style: TextStyle(
                                    //               fontFamily: FontUtils
                                    //                   .montserratRegular,
                                    //               fontSize: 1.8.t,
                                    //               color: ColorUtils.black
                                    //                   .withOpacity(0.7))),
                                    //     ),
                                    //   ],
                                    // ),
                                    // SizedBox(
                                    //   height: 2.h,
                                    // ),
                                    InkWell(
                                      onTap: () {
                                        model.navigateBack();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                              AppLocalizations.of(context)!
                                                  .translate(
                                                      'purchase_subscription_text_13')!,
                                              style: TextStyle(
                                                  fontFamily: FontUtils
                                                      .montserratSemiBold,
                                                  fontSize: 1.8.t,
                                                  color: ColorUtils.green)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.horizontalPadding,
                              vertical: Dimensions.verticalPadding),
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorUtils.border),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.translate(
                                        'purchase_subscription_text_21')!,
                                    style: TextStyle(
                                        fontFamily:
                                            FontUtils.montserratSemiBold,
                                        fontSize: 2.t),
                                  ),
                                  Text(
                                    "\$${widget.totalaAmount.toString()}",
                                    style: TextStyle(
                                        fontFamily: FontUtils.montserratBold,
                                        fontSize: 1.8.t),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h),
                              Row(
                                children: [
                                  Text(
                                    widget.packageName.toString(),
                                    style: TextStyle(
                                        fontFamily: FontUtils.montserratRegular,
                                        fontSize: 1.6.t),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                              // Divider(),
                              // SizedBox(
                              //   height: 2.h,
                              // ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       "Total Due Today",
                              //       style: TextStyle(
                              //           fontFamily:
                              //               FontUtils.montserratSemiBold,
                              //           fontSize: 2.t),
                              //     ),
                              //     Text(
                              //       "\$316",
                              //       style: TextStyle(
                              //           fontFamily: FontUtils.montserratBold,
                              //           fontSize: 1.8.t),
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 1.h,
                              // ),
                              // Text(
                              //   "Your plan will renew on Sep 24, 2021 and you will be charged \$316. ",
                              //   style: TextStyle(
                              //       fontFamily: FontUtils.montserratRegular,
                              //       fontSize: 1.6.t),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        // InAppWebView(
                        //   onLoadStart: (controller, url) {
                        //     if (url == 'return_url') {
                        //       controller.goBack();
                        //     }
                        //   },
                        // ),
                        model.checkLoading == true
                            ? SizedBox(
                                height: 4.h,
                                child: CircularProgressIndicator(
                                  color: ColorUtils.green,
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  model.checkOutSession();
                                },
                                child: Container(
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                      color: ColorUtils.green,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 1.7.h),
                                    child: Center(
                                      child: Text(
                                        "Continue to Checkout",
                                        style: TextStyle(
                                            color: ColorUtils.white,
                                            fontFamily:
                                                FontUtils.montserratBold,
                                            fontSize: 1.7.t),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 3.h,
                        ),
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
