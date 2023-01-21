import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/Widget/timing_contaier.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/common/index.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../utils/constants.dart';

class BookSessionSchedule extends StatefulWidget {
  const BookSessionSchedule({Key? key}) : super(key: key);

  @override
  _BookSessionScheduleState createState() => _BookSessionScheduleState();
}

class _BookSessionScheduleState extends State<BookSessionSchedule> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.getTherapistSlotsByUserId();
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Dimensions.topMargin,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                .translate('user_db_sidebar_text_16')!,
                            style: TextStyle(
                                fontSize: 2.8.t,
                                fontFamily: FontUtils.montserratBold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      model.date == null
                          ? SfDateRangePicker(
                              selectableDayPredicate: (date) {
                                if (model.dates
                                    .contains(date.toString().split(' ')[0])) {
                                  return true;
                                } else
                                  return false;
                              },
                              headerStyle: DateRangePickerHeaderStyle(
                                  textAlign: TextAlign.center,
                                  textStyle: TextStyle(
                                    fontFamily: FontUtils.montserratSemiBold,
                                    fontSize: 2.2.t,
                                    color: ColorUtils.black,
                                  )),
                              selectionMode:
                                  DateRangePickerSelectionMode.single,
                              showNavigationArrow: true,
                              selectionColor: ColorUtils.purple,
                              todayHighlightColor: Colors.transparent,
                              showTodayButton: false,
                              enablePastDates: false,
                              onSelectionChanged: (value) async {
                                model.finalSlot = [];
                                print(value);
                                model.selectedDate = DateFormat('yyyy-MM-dd')
                                    .format(value.value);
                                print(model.selectedDate);
                                tz.initializeTimeZones();

                                await model.getTherapistSlotsByDateAndUserId();

                                var hongKong = tz.getLocation('Asia/Hong_Kong');
                                var currentTime = tz.TZDateTime.parse(
                                    hongKong, DateTime.now().toString());
                                List check = [];
                                List wht = [];
                                check = (model.fixedSlots as List)
                                    .map((e) => {
                                          // model.dateString =
                                          //     currentTime.toString().split(' ')[0] +
                                          //         "T" +
                                          //         e['time'] +
                                          //         ':00.000Z',
                                          model.dateString =
                                              model.selectedDate +
                                                  "T" +
                                                  e['time'] +
                                                  ':00.000Z',
                                          model.offset = tz.TZDateTime.parse(
                                                  hongKong, model.dateString)
                                              .timeZoneOffset,

                                          model.dateString1 =
                                              tz.TZDateTime.parse(hongKong,
                                                      model.dateString)
                                                  .subtract(model.offset),

                                          model.diff =
                                              (model.dateString1 as DateTime)
                                                  .difference(currentTime)
                                                  .inHours,
                                          if (model.diff >= 24) {wht.add(e)},
                                          if (model.slot.any((element) =>
                                              model.fixedSlots[0]['time'] ==
                                              model.slot))
                                            {}
                                        })
                                    .toList();

                                print(check);
                                List check1 = [];
                                var newTime;
                                var newTime1;
                                for (var time in wht) {
                                  print(time);
                                  // print(jsonDecode(time.toString()));
                                  // print(time["value"]
                                  //     .toString()
                                  //     .substring(1, 25));
                                  // var newTime = DateTime.parse(time['value']
                                  //     .toString()
                                  //     .substring(1, 25));
                                  // newTime1 =
                                  //     DateFormat('hh:mm').format(newTime);
                                  //print(newTime1);

                                  if (model.slot
                                      .where((element) =>
                                          model.convert12To24(element) ==
                                          time["time"])
                                      .isNotEmpty) {
                                    var index = model.slot.indexOf((element) =>
                                        model.convert12To24(element) ==
                                        time["time"]);
                                    print(model.slot
                                        .where((element) =>
                                            model.convert12To24(element) ==
                                            time["time"])
                                        .first);
                                    check1.add(model.slot
                                        .where((element) =>
                                            model.convert12To24(element) ==
                                            time["time"])
                                        .first);
                                  }
                                }
                                print(check1);
                                var finalSlotTime;
                                for (String time in check1) {
                                  print(time);
                                  // finalSlotTime = DateFormat('jm').format(time);
                                  // print(finalSlotTime);
                                  model.finalSlot.add(time);
                                  //print(model.finalSlot);
                                }
                              },
                              // initialSelectedDates: model.dates,
                              toggleDaySelection: false,
                              // minDate: DateTime.now(),
                              // maxDate: DateTime.parse(model.date.toString()),
                            )
                          : SfDateRangePicker(
                              selectableDayPredicate: (date) {
                                if (model.dates
                                    .contains(date.toString().split(' ')[0])) {
                                  return true;
                                } else
                                  return false;
                              },
                              headerStyle: DateRangePickerHeaderStyle(
                                  textAlign: TextAlign.center,
                                  textStyle: TextStyle(
                                    fontFamily: FontUtils.montserratSemiBold,
                                    fontSize: 2.2.t,
                                    color: ColorUtils.black,
                                  )),
                              selectionMode:
                                  DateRangePickerSelectionMode.single,
                              showNavigationArrow: true,
                              backgroundColor: ColorUtils.white,

                              selectionColor: ColorUtils.purple,
                              todayHighlightColor: Colors.transparent,
                              showTodayButton: false,
                              enablePastDates: false,
                              onSelectionChanged: (value) async {
                                model.finalSlot = [];
                                print(value);
                                model.selectedDate = DateFormat('yyyy-MM-dd')
                                    .format(value.value);
                                print(model.selectedDate);
                                tz.initializeTimeZones();

                                await model.getTherapistSlotsByDateAndUserId();

                                var hongKong = tz.getLocation('Asia/Hong_Kong');
                                var currentTime = tz.TZDateTime.parse(
                                    hongKong, DateTime.now().toString());
                                List check = [];
                                List wht = [];
                                check = (model.fixedSlots as List)
                                    .map((e) => {
                                          // model.dateString =
                                          //     currentTime.toString().split(' ')[0] +
                                          //         "T" +
                                          //         e['time'] +
                                          //         ':00.000Z',
                                          model.dateString =
                                              model.selectedDate +
                                                  "T" +
                                                  e['time'] +
                                                  ':00.000Z',
                                          model.offset = tz.TZDateTime.parse(
                                                  hongKong, model.dateString)
                                              .timeZoneOffset,

                                          model.dateString1 =
                                              tz.TZDateTime.parse(hongKong,
                                                      model.dateString)
                                                  .subtract(model.offset),

                                          model.diff =
                                              (model.dateString1 as DateTime)
                                                  .difference(currentTime)
                                                  .inHours,
                                          if (model.diff >= 24) {wht.add(e)},
                                          if (model.slot.any((element) =>
                                              model.fixedSlots[0]['time'] ==
                                              model.slot))
                                            {}
                                        })
                                    .toList();

                                print(check);
                                List check1 = [];
                                var newTime;
                                var newTime1;
                                for (var time in wht) {
                                  print(time);
                                  // print(jsonDecode(time.toString()));
                                  // print(time["value"]
                                  //     .toString()
                                  //     .substring(1, 25));
                                  // var newTime = DateTime.parse(time['value']
                                  //     .toString()
                                  //     .substring(1, 25));
                                  // newTime1 =
                                  //     DateFormat('hh:mm').format(newTime);
                                  //print(newTime1);

                                  if (model.slot
                                      .where((element) =>
                                          model.convert12To24(element) ==
                                          time["time"])
                                      .isNotEmpty) {
                                    var index = model.slot.indexOf((element) =>
                                        model.convert12To24(element) ==
                                        time["time"]);
                                    print(model.slot
                                        .where((element) =>
                                            model.convert12To24(element) ==
                                            time["time"])
                                        .first);
                                    check1.add(model.slot
                                        .where((element) =>
                                            model.convert12To24(element) ==
                                            time["time"])
                                        .first);
                                  }
                                }
                                print(check1);
                                var finalSlotTime;
                                for (String time in check1) {
                                  print(time);
                                  // finalSlotTime = DateFormat('jm').format(time);
                                  // print(finalSlotTime);
                                  model.finalSlot.add(time);
                                  //print(model.finalSlot);
                                }
                              },
                              // initialSelectedDates: model.dates,
                              toggleDaySelection: false,
                              // minDate: DateTime.now(),
                              // maxDate: DateTime.parse(model.date.toString()),
                            ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .translate('other_text_46')!,
                            style: TextStyle(
                                fontSize: 2.2.t,
                                fontFamily: FontUtils.montserratSemiBold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      // SizedBox(
                      //   height: 20.h,
                      //   child: GridView.count(
                      //     crossAxisCount: 2,
                      //     shrinkWrap: true,
                      //     children: [
                      //       GestureDetector(
                      //           onTap: () {
                      //             model.selectedTime = 1;
                      //             model.notifyListeners();
                      //           },
                      //           child: TimeContainer(
                      //               model,
                      //               model.slots[2].date.toString(),
                      //               1,
                      //               model.selectedTime)),
                      //       GestureDetector(
                      //           onTap: () {
                      //             model.selectedTime = 1;
                      //             model.notifyListeners();
                      //           },
                      //           child: TimeContainer(
                      //               model,
                      //               model.slots[2].date.toString(),
                      //               1,
                      //               model.selectedTime)),
                      //       GestureDetector(
                      //           onTap: () {
                      //             model.selectedTime = 1;
                      //             model.notifyListeners();
                      //           },
                      //           child: TimeContainer(
                      //               model,
                      //               model.slots[2].date.toString(),
                      //               1,
                      //               model.selectedTime))
                      //     ],
                      //   ),
                      // ),
                      model.timeLoading == true
                          ? SizedBox(
                              height: 4.h,
                              child: CircularProgressIndicator(
                                color: ColorUtils.green,
                              ),
                            )
                          : model.slot.isEmpty || model.finalSlot.isEmpty
                              ? Text(
                                  AppLocalizations.of(context)!
                                      .translate('other_text_47')!,
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratSemiBold,
                                      fontSize: 2.t),
                                )
                              : SizedBox(
                                  height: 20.h,
                                  child: GridView.builder(
                                      padding: EdgeInsets.all(0),
                                      itemCount: model.finalSlot.length,
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 2.5,
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 5.w,
                                              mainAxisSpacing: 2.h),
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return SizedBox(
                                          child: GestureDetector(
                                              onTap: () {
                                                model.selectedTime = index;
                                                model.selectedTimeForAppointment =
                                                    model.finalSlot[index];

                                                print(model
                                                    .selectedTimeForAppointment);
                                                model.notifyListeners();
                                              },
                                              child: TimeContainer(
                                                  model,
                                                  model.finalSlot[index]
                                                      .toString(),
                                                  index,
                                                  model.selectedTime)),
                                        );
                                      }),
                                ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                          "You will not be able to reschedule or cancel within 24 hours of the session",
                          style: TextStyle(
                              fontFamily: FontUtils.montserratSemiBold,
                              fontSize: 1.8.t,
                              color: ColorUtils.greyLight)),
                      SizedBox(
                        height: 6.h,
                      ),
                      model.createAppointmentLoading == true
                          ? SizedBox(
                              height: 4.h,
                              child: CircularProgressIndicator(
                                color: ColorUtils.green,
                              ),
                            )
                          : InkWell(
                              onTap: model.slot.isEmpty ||
                                      model.finalSlot.isEmpty
                                  ? null
                                  : () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text(
                                            AppLocalizations.of(context)!
                                                .translate('other_text_59')!,
                                            style: TextStyle(
                                                fontFamily:
                                                    FontUtils.montserratBold,
                                                fontSize: 2.t),
                                            textAlign: TextAlign.center,
                                          ),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: ColorUtils
                                                                  .green),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              6.w,
                                                              2.h,
                                                              6.w,
                                                              2.h),
                                                      child: Text(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .translate(
                                                                'other_text_29')!,
                                                        style: TextStyle(
                                                            fontSize: 2.2.t,
                                                            fontFamily: FontUtils
                                                                .montserratSemiBold,
                                                            color: ColorUtils
                                                                .green),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      model.navigateBack();
                                                      model.createAppointment(
                                                          context);
                                                      model.getUserCredits();
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color:
                                                              ColorUtils.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              6.w,
                                                              1.5.h,
                                                              6.w,
                                                              1.5.h),
                                                      child: Text(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .translate(
                                                                'user_db_video_session_text_8')!,
                                                        style: TextStyle(
                                                            fontSize: 2.2.t,
                                                            fontFamily: FontUtils
                                                                .montserratSemiBold,
                                                            color: ColorUtils
                                                                .white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              )
                                            ],
                                          ),
                                        ),
                                      );
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
                                          color: model.slot.isEmpty ||
                                                  model.finalSlot.isEmpty
                                              ? Colors.transparent
                                              : ColorUtils.grey
                                                  .withOpacity(0.4))
                                    ],
                                    color: model.slot.isEmpty ||
                                            model.finalSlot.isEmpty
                                        ? ColorUtils.greyLight
                                        : ColorUtils.LightGrey,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .translate('other_text_48')!,
                                    style: TextStyle(
                                        color: ColorUtils.black,
                                        fontFamily:
                                            FontUtils.montserratSemiBold),
                                  ),
                                ),
                              )
                              // Container(
                              //   width: double.infinity,
                              //   decoration: BoxDecoration(
                              //       color: model.slot.isEmpty ||
                              //               model.finalSlot.isEmpty
                              //           ? ColorUtils.greyLight
                              //           : ColorUtils.purple,
                              //       borderRadius: BorderRadius.circular(7)),
                              //   child: Padding(
                              //     padding: EdgeInsets.symmetric(vertical: 1.7.h),
                              //     child: Center(
                              //       child: Text(
                              //         AppLocalizations.of(context)!
                              //             .translate('other_text_48')!,
                              //         style: TextStyle(
                              //             color: ColorUtils.white,
                              //             fontFamily: FontUtils.montserratSemiBold),
                              //       ),
                              //     ),
                              //   ),
                              // )
                              ),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
