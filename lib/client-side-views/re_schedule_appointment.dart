import 'package:date_picker_timeline/extra/dimen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/Widget/timing_contaier.dart';
import 'package:soulgood/app/locator.dart';
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

class ReSchedule extends StatefulWidget {
  var appointmentId;
  ReSchedule({Key? key, this.appointmentId}) : super(key: key);

  @override
  _ReScheduleState createState() => _ReScheduleState();
}

class _ReScheduleState extends State<ReSchedule> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
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
                                .translate('other_text_36')!,
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
                                print(value);
                                model.selectedDate = value.value.toString();

                                print(model.selectedDate);
                                model.finalSlot = [];
                                print(value);
                                model.selectedDateForReAppointment =
                                    DateFormat('yyyy-MM-dd')
                                        .format(value.value);
                                print(model.selectedDateForReAppointment);
                                tz.initializeTimeZones();

                                await model
                                    .getTherapistReSlotsByDateAndUserId();

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
                                          model.dateString = model
                                                  .selectedDateForReAppointment +
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
                              selectionColor: ColorUtils.purple,
                              todayHighlightColor: Colors.transparent,
                              showTodayButton: false,
                              enablePastDates: false,
                              onSelectionChanged: (value) async {
                                model.finalSlot = [];
                                print(value);
                                model.selectedDateForReAppointment =
                                    DateFormat('yyyy-MM-dd')
                                        .format(value.value);
                                print(model.selectedDateForReAppointment);
                                tz.initializeTimeZones();

                                await model
                                    .getTherapistReSlotsByDateAndUserId();

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
                                          model.dateString = model
                                                  .selectedDateForReAppointment +
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
                              // {

                              // print(value);
                              // model.selectedDateForReAppointment =
                              //     DateFormat('yyyy-MM-dd')
                              //         .format(value.value);
                              // print(model.selectedDateForReAppointment);
                              // model.getTherapistReSlotsByDateAndUserId();
                              // },
                              // initialSelectedDates: model.dates,
                              toggleDaySelection: false,
                              // minDate: DateTime.now(),
                              // maxDate: DateTime.parse(model.date.toString()),
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
                        height: 3.h,
                      ),
                      model.timeLoading == true
                          ? SizedBox(
                              height: 4.h,
                              child: CircularProgressIndicator(
                                color: ColorUtils.green,
                              ),
                            )
                          : model.slot.isEmpty || model.finalSlot.isEmpty
                              ? Text(
                                  "No Dates Available",
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
                                                model.selectedTimeForReAppointment =
                                                    model.finalSlot[index];

                                                print(model
                                                    .selectedTimeForReAppointment);
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
                      model.rescheduleIsLoading == true
                          ? SizedBox(
                              height: 4.h,
                              child: CircularProgressIndicator(
                                color: ColorUtils.green,
                              ),
                            )
                          : InkWell(
                              onTap: model.finalSlot.isEmpty
                                  ? null
                                  : () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text(
                                            AppLocalizations.of(context)!
                                                .translate('other_text_89')!,
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
                                                      model
                                                          .rescheduleAppointment();
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
                                    AppLocalizations.of(context)!.translate(
                                        'user_db_video_session_text_7')!,
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
                              //       color: model.finalSlot.isEmpty
                              //           ? ColorUtils.greyLight
                              //           : ColorUtils.purple,
                              //       borderRadius: BorderRadius.circular(15)),
                              //   child: Padding(
                              //     padding:
                              //         EdgeInsets.symmetric(vertical: 1.7.h),
                              //     child: Center(
                              //       child: Text(
                              //         AppLocalizations.of(context)!.translate(
                              //             'user_db_video_session_text_7')!,
                              //         style: TextStyle(
                              //             color: ColorUtils.white,
                              //             fontFamily:
                              //                 FontUtils.montserratSemiBold),
                              //       ),
                              //     ),
                              //   ),
                              // )
                              )
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
