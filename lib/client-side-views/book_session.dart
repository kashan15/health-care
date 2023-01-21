import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/Widget/sessions_container.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/client-side-views/re_schedule_appointment.dart';
import 'package:soulgood/client-side-views/update_payment.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

import '../utils/image_utils.dart';

class BookSession extends StatefulWidget {
  const BookSession({Key? key}) : super(key: key);

  @override
  _BookSessionState createState() => _BookSessionState();
}

class _BookSessionState extends State<BookSession> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.getUserCredits();
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
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                            Flexible(
                              child: Text(
                                AppLocalizations.of(context)!
                                    .translate('user_db_home_text_10')!,
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratBold,
                                    fontSize: 2.2.t),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        model.data.isEmpty
                            ? Container()
                            : Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    model.navigateToBookSessionSchedule();
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
                                              color: ColorUtils.grey
                                                  .withOpacity(0.4))
                                        ],
                                        color: ColorUtils.green,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .translate('user_db_home_text_11')!,
                                        style: TextStyle(
                                            color: ColorUtils.white,
                                            fontFamily:
                                                FontUtils.montserratSemiBold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('user_db_home_text_1')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratSemiBold,
                              fontSize: 2.2.t),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('other_text_49')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratSemiBold,
                              fontSize: 1.8.t,
                              color: ColorUtils.greyLight),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Material(
                                elevation: 10,
                                shadowColor: ColorUtils.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.horizontalPadding,
                                      vertical: 2.h),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: ColorUtils.border),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    children: [
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     Text(
                                      //       AppLocalizations.of(context)!
                                      //           .translate(
                                      //               'user_db_home_text_12')!,
                                      //       style: TextStyle(
                                      //           fontFamily:
                                      //               FontUtils.montserratRegular,
                                      //           fontSize: 2.t),
                                      //     ),
                                      //     Text(
                                      //       DateFormat('yyyy-MM-dd').format(
                                      //           DateTime.parse(model
                                      //               .upcomingSession[index]
                                      //               .appointmentDate
                                      //               .toString())),
                                      //       style: TextStyle(
                                      //           fontFamily:
                                      //               FontUtils.montserratRegular,
                                      //           fontSize: 2.t),
                                      //     ),
                                      //   ],
                                      // ),

                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            DateFormat('yyyy MMMM, dd').format(
                                                DateTime.parse(model
                                                    .upcomingSession[index]
                                                    .appointmentDate
                                                    .toString())),
                                            style: TextStyle(
                                                fontFamily:
                                                    FontUtils.montserratBold,
                                                fontSize: 2.t),
                                          ),
                                          Text(
                                            model
                                                .convetingDateToHongKong(model
                                                    .upcomingSession[index]
                                                    .appointmentDate!)
                                                .toString()
                                                .substring(0, 7),
                                            style: TextStyle(
                                                fontFamily: FontUtils
                                                    .montserratSemiBold,
                                                fontSize: 2.t),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              model.reAppointmentId = model
                                                  .upcomingSession[index].id;
                                              print(model.reAppointmentId);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ReSchedule()));
                                            },
                                            child: Container(
                                              width: 35.w,
                                              padding: EdgeInsets.symmetric(
                                                vertical: 2.h,
                                              ),
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 6,
                                                        offset: Offset(0, 10),
                                                        color: ColorUtils.grey
                                                            .withOpacity(0.4))
                                                  ],
                                                  color: ColorUtils.green,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Center(
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .translate(
                                                          'other_text_36')!,
                                                  style: TextStyle(
                                                      color: ColorUtils.white,
                                                      fontFamily: FontUtils
                                                          .montserratSemiBold),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                model.scheduleId = model
                                                    .upcomingSession[index].id;
                                                print(model.scheduleId);

                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                    title: SvgPicture.asset(
                                                        ImageUtils.cancel),
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: Dimensions
                                                                .horizontalPadding),
                                                    content: Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: 3.h),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          SizedBox(height: 5.h),
                                                          Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .translate(
                                                                    'user_db_home_text_13')!,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    FontUtils
                                                                        .montserratBold,
                                                                fontSize: 2.t),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          // SizedBox(
                                                          //   height: 2.h,
                                                          // ),
                                                          // Text(
                                                          //   AppLocalizations.of(
                                                          //           context)!
                                                          //       .translate(
                                                          //           'user_db_home_text_14')!,
                                                          //   style: TextStyle(
                                                          //       fontFamily:
                                                          //           FontUtils
                                                          //               .montserratRegular,
                                                          //       fontSize:
                                                          //           2.2.t),
                                                          //   textAlign: TextAlign
                                                          //       .center,
                                                          // ),
                                                          SizedBox(
                                                            height: 7.h,
                                                          ),
                                                          // SizedBox(height: 5.h),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  model
                                                                      .cancelAppointment();
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: ColorUtils
                                                                              .green),
                                                                      color: ColorUtils
                                                                          .green,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              7)),
                                                                  padding: EdgeInsets.only(
                                                                      left: 1.w,
                                                                      bottom:
                                                                          2.h,
                                                                      right:
                                                                          1.w,
                                                                      top: 2.h),
                                                                  child: Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .translate(
                                                                            'other_text_34')!,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          2.t,
                                                                      color: ColorUtils
                                                                          .white,
                                                                      fontFamily:
                                                                          FontUtils
                                                                              .montserratSemiBold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: ColorUtils
                                                                              .green),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  padding: EdgeInsets.only(
                                                                      left: 3.w,
                                                                      bottom:
                                                                          2.h,
                                                                      right:
                                                                          3.w,
                                                                      top: 2.h),
                                                                  child: Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .translate(
                                                                            'other_text_45')!,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            2.t,
                                                                        fontFamily:
                                                                            FontUtils
                                                                                .montserratSemiBold,
                                                                        color: ColorUtils
                                                                            .green),
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
                                              child: SvgPicture.asset(
                                                ImageUtils.delete,
                                                color: ColorUtils.green,
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, i) {
                              return SizedBox(
                                height: 3.h,
                              );
                            },
                            itemCount: model.upcomingSession.length),
                        // SizedBox(
                        //   height: 3.h,
                        // ),
                        // sessionsContainer(context),
                        // SizedBox(
                        //   height: 3.h,
                        // ),
                        // sessionsContainer(context),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                                  .translate('user_db_home_text_15')! +
                              " ${model.data.length}",
                          style: TextStyle(
                              fontSize: 2.2.t,
                              fontFamily: FontUtils.montserratSemiBold),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('other_text_50')!,
                          style: TextStyle(
                              fontSize: 1.8.t,
                              fontFamily: FontUtils.montserratMedium,
                              color: ColorUtils.grey),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('other_text_51')!,
                          style: TextStyle(
                              fontSize: 1.8.t,
                              fontFamily: FontUtils.montserratMedium,
                              color: ColorUtils.grey),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('other_text_52')!,
                          style: TextStyle(
                              fontSize: 1.8.t,
                              fontFamily: FontUtils.montserratMedium,
                              color: ColorUtils.grey),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        model.purchaseLoading == true
                            ? Center(
                                child: SizedBox(
                                  height: 4.h,
                                  child: CircularProgressIndicator(
                                    color: ColorUtils.green,
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: model.checkUserPlan.isEmpty
                                    ? null
                                    : () {
                                        model.createAdhocPortal();
                                      },
                                child: Center(
                                  child: Container(
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                        color: model.checkUserPlan.isEmpty
                                    ? ColorUtils.grey.withOpacity(0.4)
                                    : ColorUtils.green,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.5.h),
                                      child: Center(
                                        child: Text(
                                          AppLocalizations.of(context)!.translate(
                                              'user_db_video_session_text_4')!,
                                          style: TextStyle(
                                              color: ColorUtils.white,
                                              fontFamily:
                                                  FontUtils.montserratSemiBold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 3.h,
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
