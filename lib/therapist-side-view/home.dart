import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/Widget/bottom_app_bar.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/Widget/therapist_home_card.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/therapist-side-view/live_video_for_therapist.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TherapistHome extends StatefulWidget {
  const TherapistHome({Key? key}) : super(key: key);

  @override
  _TherapistHomeState createState() => _TherapistHomeState();
}

class _TherapistHomeState extends State<TherapistHome> {
  bool onPressed = true;
  bool onPressed1 = true;
  bool onPressed2 = true;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        model.getTherapistAppointmentsByWeek();
        model.gettherapistById();
        model.getPatientSessions();
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
                backgroundColor: Colors.white,
                body: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.horizontalPadding),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Dimensions.topMargin,
                        ),
                        Text(
                          "Appointment Scheduled This Week",
                          style: TextStyle(
                              fontFamily: FontUtils.montserratBold,
                              fontSize: 3.t),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Material(
                                shadowColor: ColorUtils.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(7),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: ColorUtils.border),
                                      borderRadius: BorderRadius.circular(7)),
                                  // padding: EdgeInsets.symmetric(horizontal: 0.5.w),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          autofocus: false,
                                          keyboardType: TextInputType.text,
                                          controller: model.search,
                                          style: TextStyle(
                                              fontSize: 2.5.t,
                                              color: ColorUtils.black),
                                          decoration: InputDecoration(
                                              prefixIcon: SvgPicture.asset(
                                                ImageUtils.search,
                                                width: 5.i,
                                                height: 5.i,
                                                fit: BoxFit.scaleDown,
                                              ),
                                              border: InputBorder.none,
                                              hintText:
                                                  'Search by patients name',
                                              hintStyle: TextStyle(
                                                  color: ColorUtils.border)),
                                          // validator: (value) {
                                          //   if (value == null || value.isEmpty) {
                                          //     return 'Please Enter Your Email Address';
                                          //   }else if(!value.isEmail){
                                          //     return "Please Enter Correct Email Address";
                                          //   }
                                          //   return null;
                                          // },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SfDateRangePicker(
                                                  headerStyle:
                                                      DateRangePickerHeaderStyle(
                                                          textAlign:
                                                              TextAlign.center,
                                                          textStyle: TextStyle(
                                                            fontFamily: FontUtils
                                                                .montserratSemiBold,
                                                            fontSize: 2.2.t,
                                                            color: ColorUtils
                                                                .black,
                                                          )),
                                                  minDate: DateTime.now(),
                                                  selectionMode:
                                                      DateRangePickerSelectionMode
                                                          .single,
                                                  showNavigationArrow: true,
                                                  selectionColor:
                                                      ColorUtils.purple,
                                                  todayHighlightColor:
                                                      Colors.transparent,
                                                  showTodayButton: false,
                                                  enablePastDates: false,
                                                  onSelectionChanged: (value) {
                                                    model.appointmentDate =
                                                        value.value;

                                                    model
                                                        .getTherapistAppointmentsByDate();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ));
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: ColorUtils.border),
                                      borderRadius: BorderRadius.circular(7)),
                                  padding: EdgeInsets.all(14.8),
                                  child: SvgPicture.asset(ImageUtils.paper)),
                            ),

                            // Container(
                            //   padding: EdgeInsets.all(19),
                            //   decoration: BoxDecoration(
                            //       border: Border.all(color: ColorUtils.border),
                            //       borderRadius: BorderRadius.circular(7)),
                            //   child: SvgPicture.asset(ImageUtils.paper),
                            // )
                          ],
                        ),
                        // ElevatedButton(
                        //     onPressed: () {
                        //       model.getTherapistAppointmentsByWeek();
                        //     },
                        //     child: Text("click me")),
                        SizedBox(
                          height: 3.h,
                        ),
                        model.loadingForAppointments == true
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Center(
                                    child: SizedBox(
                                      height: 4.h,
                                      child: CircularProgressIndicator(
                                        color: ColorUtils.purple,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : model.therapistUpcomingData.isEmpty
                                ? Text("No Appointment has been Schedule",
                                    style: TextStyle(
                                        fontFamily: FontUtils.montserratBold,
                                        fontSize: 2.t))
                                : ListView.separated(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 1.h,
                                              horizontal:
                                                  Dimensions.horizontalPadding),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ColorUtils.purple),
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Client Name",
                                                    style: TextStyle(
                                                        fontFamily: FontUtils
                                                            .montserratRegular,
                                                        fontSize: 2.t),
                                                  ),
                                                  Text(
                                                    DateFormat('yyyy-MM-dd').format(
                                                        DateTime.parse(model
                                                            .therapistUpcomingData[
                                                                index]
                                                            .appointmentDate
                                                            .toString())),
                                                    style: TextStyle(
                                                        fontFamily: FontUtils
                                                            .montserratRegular,
                                                        fontSize: 2.t),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    model
                                                        .therapistUpcomingData[
                                                            index]
                                                        .patientName
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontFamily: FontUtils
                                                            .montserratBold,
                                                        fontSize: 2.t),
                                                  ),
                                                  Text(
                                                    model
                                                        .convetingDateToHongKong(
                                                            model
                                                                .therapistUpcomingData[
                                                                    index]
                                                                .appointmentDate
                                                                .toString())
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
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  if (onPressed == true)
                                                    model.therapistUpcomingData[index]
                                                                .isEnabled !=
                                                            1
                                                        ? Container()
                                                        : InkWell(
                                                            onTap: () {
                                                              // if (onPressed2 == false) {
                                                              // } else {
                                                              model.appointmentkiId =
                                                                  model
                                                                      .therapistUpcomingData[
                                                                          index]
                                                                      .id;
                                                              model
                                                                  .getSessionFromTherapistByAppointmentId();
                                                              // }
                                                            },
                                                            child: Container(
                                                              // width: double.infinity,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(12),
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color:
                                                                    ColorUtils
                                                                        .purple,
                                                                // borderRadius:
                                                                //     BorderRadius.circular(7)
                                                              ),
                                                              child: Center(
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                ImageUtils
                                                                    .camera,
                                                                color:
                                                                    ColorUtils
                                                                        .white,
                                                                height: 4.i,
                                                                fit: BoxFit
                                                                    .scaleDown,
                                                              )),
                                                            ),
                                                          ),
                                                  if (onPressed == true)
                                                    model.therapistUpcomingData[index]
                                                                .isEnabled !=
                                                            1
                                                        ? Container()
                                                        : InkWell(
                                                            onTap: () {
                                                               model.appointmentkiId =
                                                                  model
                                                                      .therapistUpcomingData[
                                                                          index]
                                                                      .id;
                                                              model
                                                                  .getSessionFromTherapistByAppointmentIdOnAudioCall();
                                                            },
                                                            child: Container(
                                                                // width: 13.w,
                                                                // height: 8.h,
                                                                padding: EdgeInsets
                                                                    .all(
                                                                        12),
                                                                decoration: BoxDecoration(
                                                                    color: ColorUtils
                                                                        .purple,
                                                                    shape: BoxShape
                                                                        .circle),
                                                                child: Icon(
                                                                  Icons.call,
                                                                  color:
                                                                      ColorUtils
                                                                          .white,
                                                                )),
                                                          ),
                                                  if (onPressed == true)
                                                    model.therapistUpcomingData[index]
                                                                .isEnabled !=
                                                            1
                                                        ? Container()
                                                        : InkWell(
                                                            onTap: () {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder: (context) =>
                                                                    AlertDialog(
                                                                        title:
                                                                            Text(
                                                                          "Please Confirm If you want to complete this session",
                                                                          style: TextStyle(
                                                                              fontFamily: FontUtils.montserratBold,
                                                                              fontSize: 2.t),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                        content: Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: [
                                                                              SizedBox(
                                                                                height: 4.h,
                                                                              ),
                                                                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                                                InkWell(
                                                                                    onTap: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(border: Border.all(color: ColorUtils.purple), borderRadius: BorderRadius.circular(7)),
                                                                                      padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 2.h),
                                                                                      child: Text(
                                                                                        "Cancel",
                                                                                        style: TextStyle(fontSize: 2.2.t, fontFamily: FontUtils.montserratSemiBold, color: ColorUtils.purple),
                                                                                      ),
                                                                                    )),
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    model.navigateBack();
                                                                                    // onPressed =
                                                                                    //     false;
                                                                                    print(model.therapistUpcomingData[index].id);
                                                                                    model.completeSession(model.therapistUpcomingData[index].id);
                                                                                    model.notifyListeners();
                                                                                  },
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(color: ColorUtils.purple, borderRadius: BorderRadius.circular(7)),
                                                                                    padding: EdgeInsets.fromLTRB(6.w, 1.5.h, 6.w, 1.5.h),
                                                                                    child: Text(
                                                                                      "Confirm",
                                                                                      style: TextStyle(fontSize: 2.2.t, fontFamily: FontUtils.montserratSemiBold, color: ColorUtils.white),
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ])
                                                                            ])),
                                                              );
                                                              // model.navigateToWaitingToJoin();
                                                            },
                                                            child: Container(
                                                              // width: double.infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: onPressed ==
                                                                              false
                                                                          ? ColorUtils
                                                                              .green
                                                                          : ColorUtils
                                                                              .white,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: onPressed ==
                                                                                false
                                                                            ? ColorUtils.green
                                                                            : ColorUtils.purple,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              7)),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            1.5
                                                                                .h,
                                                                        horizontal:
                                                                            4.w),
                                                                child: Center(
                                                                  child: Row(
                                                                    children: [
                                                                      if (onPressed ==
                                                                          false)
                                                                        Icon(
                                                                          onPressed == false
                                                                              ? Icons.check
                                                                              : null,
                                                                          color: onPressed == false
                                                                              ? ColorUtils.white
                                                                              : ColorUtils.purple,
                                                                          size:
                                                                              4.i,
                                                                        ),
                                                                      SizedBox(
                                                                        width: onPressed ==
                                                                                false
                                                                            ? 2.w
                                                                            : null,
                                                                      ),
                                                                      Text(
                                                                        "Complete",
                                                                        style: TextStyle(
                                                                            color: onPressed == false
                                                                                ? ColorUtils.white
                                                                                : ColorUtils.purple,
                                                                            fontFamily: FontUtils.montserratRegular),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              )
                                            ],
                                          ));
                                    },
                                    separatorBuilder:
                                        (BuildContext context, i) {
                                      return SizedBox(
                                        height: 2.h,
                                      );
                                    },
                                    itemCount:
                                        model.therapistUpcomingData.length),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }
}
