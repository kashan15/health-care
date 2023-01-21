import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/client-side-views/book_session.dart';
import 'package:soulgood/client-side-views/chats.dart';
import 'package:soulgood/client-side-views/re_schedule_appointment.dart';
import 'package:soulgood/models/appointment_upcoming_data.dart';
import 'package:soulgood/models/user.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:web_socket_channel/web_socket_channel.dart';

import '../utils/image_utils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        model.sharedPreferences = await SharedPreferences.getInstance();

        await model.getUser();
        model.AllUserDataForClient();
        model.getUserPlan();
        model.getUserCredits();
        model.getTherapistSlotsByUserId();
        model.getAssignedTherapist();
        model.getAssignedSupport();
        model.getPatientAppointments();
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
                    horizontal: Dimensions.horizontalPadding, vertical: 1.h),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.topMargin,
                      ),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .translate('other_text_27')!,
                            style: TextStyle(
                                color: ColorUtils.green,
                                fontFamily: FontUtils.montserratSemiBold,
                                fontSize: 3.t),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            model.username,
                            style: TextStyle(
                                color: ColorUtils.green,
                                fontFamily: FontUtils.montserratSemiBold,
                                fontSize: 3.t),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.5.h,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorUtils.border),
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 2.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .translate('user_db_home_text_1')!,
                              style: TextStyle(
                                  fontSize: 2.t,
                                  fontFamily: FontUtils.montserratBold),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            model.upcomingSession.isEmpty
                                ? Center(
                                    child: Text(
                                      // "You have no upcoming sessions!",
                                      AppLocalizations.of(context)!.translate('other_text_93')!,
                                      style: TextStyle(
                                          fontSize: 2.t,
                                          fontFamily:
                                              FontUtils.montserratSemiBold),
                                    ),
                                  )
                                : Text(
                                    AppLocalizations.of(context)!
                                        .translate('user_db_home_text_2')!,
                                    style: TextStyle(
                                        fontSize: 1.7.t,
                                        fontFamily:
                                            FontUtils.montserratRegular),
                                  ),
                            SizedBox(
                              height: 2.h,
                            ),
                            model.upcomingSession.isEmpty
                                ? SizedBox()
                                : Text(
                                    AppLocalizations.of(context)!
                                        .translate('user_db_home_text_3')
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 1.7.t,
                                        fontFamily:
                                            FontUtils.montserratRegular),
                                  ),
                            SizedBox(
                              height: 3.h,
                            ),
                            model.upcomingSession.isEmpty
                                ? Center(
                                    child: InkWell(
                                        onTap: () {
                                          model.navigation_Service
                                              .navigateTo(to: BookSession());
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
                                              color: ColorUtils.LightGrey,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Center(
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .translate(
                                                      'user_db_home_text_11')!,
                                              style: TextStyle(
                                                  color: ColorUtils.black,
                                                  fontFamily: FontUtils
                                                      .montserratSemiBold),
                                            ),
                                          ),
                                        )),
                                  )
                                : SizedBox(
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (context, index) {
                                          return Material(
                                              elevation: 10,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              shadowColor: ColorUtils.grey
                                                  .withOpacity(0.3),
                                              child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: Dimensions
                                                          .horizontalPadding,
                                                      vertical: 2.h),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color:
                                                            ColorUtils.border),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Column(children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          DateFormat(
                                                                  'yyyy-MM-dd')
                                                              .format(DateTime.parse(model
                                                                  .upcomingSession[
                                                                      index]
                                                                  .appointmentDate
                                                                  .toString())),
                                                          style: TextStyle(
                                                              fontFamily: FontUtils
                                                                  .montserratSemiBold,
                                                              fontSize: 2.t),
                                                        ),
                                                        Text(
                                                          model
                                                              .convetingDateToHongKong(model
                                                                  .upcomingSession[
                                                                      index]
                                                                  .appointmentDate)
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
                                                      height: 1.h,
                                                    ),
                                                    model.upcomingSession[index]
                                                                .isEnabled !=
                                                            1
                                                        ? SizedBox()
                                                        : Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  // model
                                                                  //     .navigateToLiveVideo();
                                                                  model.appointmentkiId = model
                                                                      .upcomingSession[
                                                                          index]
                                                                      .id;
                                                                  model
                                                                      .getSessionByAppointmentId();
                                                                  // model.initForAgora();
                                                                },
                                                                child:
                                                                    Container(
                                                                        width: 13
                                                                            .w,
                                                                        // height: 8.h,
                                                                        padding: EdgeInsets.only(
                                                                            top: 0.5
                                                                                .h,
                                                                            bottom: 0.5
                                                                                .h),
                                                                        decoration: BoxDecoration(
                                                                            color: ColorUtils
                                                                                .green,
                                                                            shape: BoxShape
                                                                                .circle),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .videocam,
                                                                          color:
                                                                              ColorUtils.white,
                                                                        )),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  model.appointmentkiId = model
                                                                      .upcomingSession[
                                                                          index]
                                                                      .id;
                                                                  model.cameraOpen =
                                                                      false;
                                                                  // model.cameraOpen1 =
                                                                  //     false;
                                                                  model
                                                                      .getSessionByAppointmentIdOnAudioCall();
                                                                  model
                                                                      .notifyListeners();
                                                                },
                                                                child:
                                                                    Container(
                                                                        width: 13
                                                                            .w,
                                                                        // height: 8.h,
                                                                        padding: EdgeInsets.only(
                                                                            top: 0.5
                                                                                .h,
                                                                            bottom: 0.5
                                                                                .h),
                                                                        decoration: BoxDecoration(
                                                                            color: ColorUtils
                                                                                .green,
                                                                            shape: BoxShape
                                                                                .circle),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .call,
                                                                          color:
                                                                              ColorUtils.white,
                                                                        )),
                                                              ),
                                                            ],
                                                          ),
                                                  ])));
                                        },
                                        separatorBuilder: (context, i) {
                                          return SizedBox(
                                            height: 1.h,
                                          );
                                        },
                                        itemCount:
                                            model.upcomingSession.length),
                                  ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .translate('user_db_home_text_4')
                                .toString(),
                            style: TextStyle(
                                fontFamily: FontUtils.montserratBold,
                                fontSize: 2.5.t),
                          ),
                        ],
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return MediaQuery(
                              data: const MediaQueryData(
                                  padding: EdgeInsets.zero),
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.only(left: 0, right: 0),
                                onTap: () {
                                  if (index == 0) {
                                    model.getAssignedTherapist();
                                    model.navigation_Service
                                        .navigateTo(to: ChatScreen());
                                  } else if (index == 1) {
                                    model.getUserCredits();
                                    model.getPatientAppointments();
                                    model.getUserPlan();
                                    model.navigateToBookSessionS();
                                  } else if (index == 2) {
                                    model.navigateToReports();
                                  } else if (index == 3) {
                                    model.navigateToMyJournal();
                                  } else if (index == 4) {
                                    model.navigateToBlog();
                                  } else if (index == 5) {
                                    if (model.checkUserPlan.isEmpty) {
                                      model.navigateToSubscription();
                                    } else {
                                      model.navigateToManageSubs();
                                    }
                                  }
                                },
                                leading: Image.asset(
                                  model.tools[index]["image"],
                                ),
                                title: Text(
                                  AppLocalizations.of(context)!
                                      .translate(model.tools[index]['name'])!,
                                  style: TextStyle(
                                      fontSize: 2.t,
                                      fontFamily: FontUtils.montserratSemiBold),
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      if (index == 0) {
                                        model.getAssignedTherapist();
                                        model.navigation_Service
                                            .navigateTo(to: ChatScreen());
                                      } else if (index == 1) {
                                        model.getUserCredits();
                                        model.getPatientAppointments();
                                        model.getUserPlan();
                                        model.navigateToBookSessionS();
                                      } else if (index == 2) {
                                        model.navigateToReports();
                                      } else if (index == 3) {
                                        model.navigateToMyJournal();
                                      } else if (index == 4) {
                                        model.navigateToBlog();
                                      } else if (index == 5) {
                                        if (model.checkUserPlan.isEmpty) {
                                          model.navigateToSubscription();
                                        } else {
                                          model.navigateToManageSubs();
                                        }
                                      }
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: ColorUtils.black,
                                      size: 4.i,
                                    )),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 2.h,
                            );
                          },
                          itemCount: model.tools.length),
                      SizedBox(
                        height: 2.h,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
