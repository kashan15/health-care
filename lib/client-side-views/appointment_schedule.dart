import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/Widget/timing_contaier.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
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
                          Text(
                            "Appointment",
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
                              onSelectionChanged: (value) {
                                print(value);
                                model.selectedDate = value;
                                print(model.selectedDate);
                              },
                              // initialSelectedDates: model.dates,
                              toggleDaySelection: false,
                              minDate:
                                  DateTime.parse(model.startDate.toString()),
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
                              onSelectionChanged: (value) {
                                print(value);
                                model.selectedDate = value;
                                print(model.selectedDate);
                              },
                              // initialSelectedDates: model.dates,
                              toggleDaySelection: false,
                              minDate:
                                  DateTime.parse(model.startDate.toString()),
                              maxDate: DateTime.parse(model.date.toString()),
                            ),
                      Row(
                        children: [
                          Text(
                            "Availability",
                            style: TextStyle(
                                fontSize: 2.2.t,
                                fontFamily: FontUtils.montserratSemiBold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      SizedBox(
                        height: 20.h,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        model.selectedTime = 1;
                                        model.notifyListeners();
                                      },
                                      child: TimeContainer(model, "06:00 AM", 1,
                                          model.selectedTime)),
                                  GestureDetector(
                                      onTap: () {
                                        model.selectedTime = 2;
                                        model.notifyListeners();
                                      },
                                      child: TimeContainer(model, "07:00 AM", 2,
                                          model.selectedTime)),
                                  GestureDetector(
                                      onTap: () {
                                        model.selectedTime = 3;
                                        model.notifyListeners();
                                      },
                                      child: TimeContainer(model, "08:00 AM", 3,
                                          model.selectedTime)),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        model.selectedTime = 4;
                                        model.notifyListeners();
                                      },
                                      child: TimeContainer(model, "09:00 AM", 4,
                                          model.selectedTime)),
                                  GestureDetector(
                                      onTap: () {
                                        model.selectedTime = 5;
                                        model.notifyListeners();
                                      },
                                      child: TimeContainer(model, "10:00 AM", 5,
                                          model.selectedTime)),
                                  GestureDetector(
                                      onTap: () {
                                        model.selectedTime = 6;
                                        model.notifyListeners();
                                      },
                                      child: TimeContainer(model, "11:00 AM", 6,
                                          model.selectedTime)),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        model.selectedTime = 7;
                                        model.notifyListeners();
                                      },
                                      child: TimeContainer(model, "12:00 PM", 7,
                                          model.selectedTime)),
                                  GestureDetector(
                                      onTap: () {
                                        model.selectedTime = 8;
                                        model.notifyListeners();
                                      },
                                      child: TimeContainer(model, "1:00 PM", 8,
                                          model.selectedTime)),
                                  GestureDetector(
                                      onTap: () {
                                        model.selectedTime = 9;
                                        model.notifyListeners();
                                      },
                                      child: TimeContainer(model, "2:00 PM", 9,
                                          model.selectedTime)),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        model.selectedTime = 10;
                                        model.notifyListeners();
                                      },
                                      child: TimeContainer(model, "3:00 PM", 10,
                                          model.selectedTime)),
                                  GestureDetector(
                                      onTap: () {
                                        model.selectedTime = 11;
                                        model.notifyListeners();
                                      },
                                      child: TimeContainer(model, "4:00 PM", 11,
                                          model.selectedTime)),
                                  GestureDetector(
                                      onTap: () {
                                        model.selectedTime = 12;
                                        model.notifyListeners();
                                      },
                                      child: TimeContainer(model, "5:00 PM", 12,
                                          model.selectedTime)),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        model.selectedTime = 13;
                                        model.notifyListeners();
                                      },
                                      child: TimeContainer(model, "6:00 PM", 13,
                                          model.selectedTime)),
                                  GestureDetector(
                                      onTap: () {
                                        model.selectedTime = 14;
                                        model.notifyListeners();
                                      },
                                      child: TimeContainer(model, "7:00 PM", 14,
                                          model.selectedTime)),
                                  GestureDetector(
                                      onTap: () {
                                        model.selectedTime = 15;
                                        model.notifyListeners();
                                      },
                                      child: TimeContainer(model, "8:00 PM", 15,
                                          model.selectedTime)),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        model.selectedTime = 16;
                                        model.notifyListeners();
                                      },
                                      child: TimeContainer(model, "9:00 PM", 16,
                                          model.selectedTime)),
                                  GestureDetector(
                                      onTap: () {
                                        model.selectedTime = 17;
                                        model.notifyListeners();
                                      },
                                      child: TimeContainer(model, "10:00 PM",
                                          17, model.selectedTime)),
                                  GestureDetector(
                                      onTap: () {
                                        model.selectedTime = 18;
                                        model.notifyListeners();
                                      },
                                      child: TimeContainer(model, "11:00 PM",
                                          18, model.selectedTime)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 3.w, vertical: 2.h),
                                      content: SizedBox(
                                        height: 20.h,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // InkWell(
                                            //   onTap: () {
                                            //     model.navigateBack();
                                            //   },
                                            //   child: Row(
                                            //     mainAxisAlignment:
                                            //         MainAxisAlignment.end,
                                            //     children: [
                                            //       SvgPicture.asset(
                                            //         ImageUtils.close,
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                        ImageUtils.chanBig,
                                                        height: 30.i,
                                                        fit: BoxFit.scaleDown,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                SizedBox(
                                                  width: 45.w,
                                                  height: 15.h,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Your Appointment has been Scheduled Successfully",
                                                        style: TextStyle(
                                                            fontSize: 1.5.t,
                                                            fontFamily: FontUtils
                                                                .montserratRegular),
                                                      ),
                                                      SizedBox(
                                                        height: 0.5.h,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Nikki Cross",
                                                            style: TextStyle(
                                                                fontSize: 1.5.t,
                                                                fontFamily:
                                                                    FontUtils
                                                                        .montserratSemiBold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1.5.h,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "02:00pm\n06/01/2021",
                                                            style: TextStyle(
                                                                fontSize: 1.2.t,
                                                                fontFamily:
                                                                    FontUtils
                                                                        .montserratRegular),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1.5.h,
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          children: [
                                                            Flexible(
                                                              child: RichText(
                                                                text: TextSpan(
                                                                  text:
                                                                      'Patient : ',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          FontUtils
                                                                              .montserratSemiBold,
                                                                      fontSize:
                                                                          1.5.t,
                                                                      color: ColorUtils
                                                                          .black),
                                                                  children: <
                                                                      TextSpan>[
                                                                    TextSpan(
                                                                        text: model
                                                                            .username,
                                                                        style: TextStyle(
                                                                            color:
                                                                                ColorUtils.purple)),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  model.navigateBack();
                                                },
                                                child: Button("Continue",15))
                                          ],
                                        ),
                                      ),
                                    ));
                          },
                          child: Button("Book Session",15))
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
