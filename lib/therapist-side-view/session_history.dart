import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class SessionHistory extends StatefulWidget {
  String? Id;
  String? name;
  SessionHistory({Key? key, this.Id, this.name}) : super(key: key);

  @override
  _SessionHistoryState createState() => _SessionHistoryState();
}

class _SessionHistoryState extends State<SessionHistory> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.getSessionHistory(widget.Id);
        tz.initializeTimeZones();
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
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 5.h,
                      // ),
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
                                size: 4.i,
                                color: ColorUtils.black,
                              )),
                          Text(
                            "Session History",
                            style: TextStyle(
                                fontSize: 2.8.t,
                                fontFamily: FontUtils.montserratSemiBold),
                          )
                        ],
                      ),
                      // SizedBox(
                      //   height: 4.h,
                      // ),
                      // Column(
                      //   children: [
                      // SizedBox(
                      //   height: 5.h,
                      //   child: ListView.separated(
                      //     shrinkWrap: true,
                      //     physics: BouncingScrollPhysics(),
                      //     scrollDirection: Axis.horizontal,
                      //     separatorBuilder: (context, index) {
                      //       return SizedBox(
                      //         width: 3.w,
                      //       );
                      //     },
                      //     itemCount: model.sessionHistory.length,
                      //     itemBuilder: (context, index) {
                      //       return InkWell(
                      //         onTap: () {
                      //           if (model.sessionHistorySelection
                      //               .contains(index)) {
                      //             model.sessionHistorySelection
                      //                 .remove(index);
                      //           } else {
                      //             model.sessionHistorySelection.clear();
                      //             model.sessionHistorySelection.add(index);
                      //           }

                      //           model.notifyListeners();
                      //         },
                      //         child: Container(
                      //           padding: EdgeInsets.only(
                      //               left: 2.w,
                      //               top: 0.5.h,
                      //               right: 2.w,
                      //               bottom: 0.5.h),
                      //           decoration: BoxDecoration(
                      //               color: model.sessionHistorySelection
                      //                       .contains(index)
                      //                   ? ColorUtils.purplelight
                      //                   : ColorUtils.white,
                      //               borderRadius: BorderRadius.circular(4)),
                      //           child: Center(
                      //             child: Text(
                      //                 model.sessionHistory[index]['name'],
                      //                 style: TextStyle(
                      //                   fontFamily:
                      //                       FontUtils.montserratMedium,
                      //                   color: ColorUtils.black,
                      //                 )),
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 2.h,
                      ),

                      Divider(),
                      SizedBox(
                        height: 2.h,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Text(
                                          DateFormat("dd").format(
                                              DateTime.parse(model
                                                  .sessionHistoryOfPatient[
                                                      index]
                                                  .date!)),
                                          style: TextStyle(
                                              fontFamily:
                                                  FontUtils.montserratMedium,
                                              fontSize: 2.8.t),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          DateFormat("MMMM").format(
                                              DateTime.parse(model
                                                  .sessionHistoryOfPatient[
                                                      index]
                                                  .date!)),
                                          style: TextStyle(
                                              color: ColorUtils.greyLight,
                                              fontSize: 2.t,
                                              fontFamily:
                                                  FontUtils.montserratRegular),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Column(
                                      children: model
                                          .sessionHistoryOfPatient[index].data!
                                          .map((e) {
                                        return Card(
                                          elevation: 10,
                                          shadowColor:
                                              ColorUtils.grey.withOpacity(0.2),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 1.w, vertical: 1.h),
                                            child: Column(
                                              // crossAxisAlignment:
                                              //     CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      widget.name.toString(),
                                                      style: TextStyle(
                                                          fontFamily: FontUtils
                                                              .montserratMedium,
                                                          fontSize: 2.t),
                                                    ),
                                                    SizedBox(
                                                      width: 3.w,
                                                    ),
                                                    Text(
                                                      DateFormat("hh:mm a")
                                                          .format(tz.TZDateTime.from(
                                                              DateTime.parse(e
                                                                  .appointmentDate!),
                                                              tz.getLocation(
                                                                  "Asia/Hong_Kong")))
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: ColorUtils
                                                              .greyLight,
                                                          fontFamily: FontUtils
                                                              .montserratRegular),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        ImageUtils.detail),
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    e.status == 0
                                                        ? Text('Not Started',
                                                            style: TextStyle(
                                                                color: ColorUtils
                                                                    .text_red,
                                                                fontFamily:
                                                                    FontUtils
                                                                        .montserratRegular))
                                                        : e.status == 1
                                                            ? Text('Completed',
                                                                style: TextStyle(
                                                                    color: ColorUtils
                                                                        .purple,
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .montserratRegular))
                                                            : e.status == 2
                                                                ? Text(
                                                                    'Cancelled',
                                                                    style: TextStyle(
                                                                        color: ColorUtils
                                                                            .text_red,
                                                                        fontFamily:
                                                                            FontUtils
                                                                                .montserratRegular))
                                                                : Text(
                                                                    'Not Completed',
                                                                    style: TextStyle(
                                                                        color: ColorUtils
                                                                            .text_red,
                                                                        fontFamily:
                                                                            FontUtils.montserratRegular)),
                                                    SizedBox(
                                                      width: 3.w,
                                                    ),
                                                    SvgPicture.asset(
                                                        ImageUtils.clock),
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    Text(
                                                      "Duration: ${e.duration} \n Minutes",
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    )
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 2.h,
                                );
                              },
                              itemCount: model.sessionHistoryOfPatient.length),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      )
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
