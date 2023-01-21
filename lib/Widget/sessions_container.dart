import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/client-side-views/re_schedule_appointment.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';

Widget sessionsContainer(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: ColorUtils.grey.withOpacity(0.3),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.horizontalPadding, vertical: 2.h),
        decoration: BoxDecoration(
          border: Border.all(color: ColorUtils.purple),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Therapist Name",
                  style: TextStyle(
                      fontFamily: FontUtils.montserratRegular, fontSize: 2.t),
                ),
                Text(
                  "24 August, 2021",
                  style: TextStyle(
                      fontFamily: FontUtils.montserratRegular, fontSize: 2.t),
                ),
              ],
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nikki Cross",
                  style: TextStyle(
                      fontFamily: FontUtils.montserratBold, fontSize: 2.t),
                ),
                Text(
                  "08:00 PM",
                  style: TextStyle(
                      fontFamily: FontUtils.montserratSemiBold, fontSize: 2.t),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReSchedule()));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: ColorUtils.purple,
                          borderRadius: BorderRadius.circular(4)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.3.h),
                      child: Text(
                        "Reschedule",
                        style: TextStyle(
                            fontFamily: FontUtils.montserratMedium,
                            fontSize: 2.2.t,
                            color: ColorUtils.white),
                      )),
                ),
                InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          title: SvgPicture.asset(ImageUtils.cancel),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: Dimensions.horizontalPadding),
                          content: Container(
                            padding: EdgeInsets.only(bottom: 3.h),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 3.h),
                                Text(
                                  "Do you want to cancel session?",
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratBold,
                                      fontSize: 2.t),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  "You won’t be able to revert this action later!",
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratRegular,
                                      fontSize: 2.2.t),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                // SizedBox(height: 5.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ColorUtils.purple),
                                            color: ColorUtils.purple,
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        padding: EdgeInsets.only(
                                            left: 1.w,
                                            bottom: 2.h,
                                            right: 1.w,
                                            top: 2.h),
                                        child: Text(
                                          "Yes, Cancel it",
                                          style: TextStyle(
                                            fontSize: 2.t,
                                            color: ColorUtils.white,
                                            fontFamily:
                                                FontUtils.montserratSemiBold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ColorUtils.purple),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        padding: EdgeInsets.only(
                                            left: 3.w,
                                            bottom: 2.h,
                                            right: 3.w,
                                            top: 2.h),
                                        child: Text(
                                          "No, Keep it",
                                          style: TextStyle(
                                              fontSize: 2.t,
                                              fontFamily:
                                                  FontUtils.montserratSemiBold,
                                              color: ColorUtils.purple),
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
                      // showDialog(
                      //   context: context,
                      //   builder: (context) => AlertDialog(
                      //     title: SvgPicture.asset(ImageUtils.cancel),
                      //     contentPadding: EdgeInsets.symmetric(
                      //         horizontal: Dimensions.horizontalPadding),
                      //     content: Container(
                      //       padding: EdgeInsets.all(10),
                      //       child: Column(
                      //         mainAxisSize: MainAxisSize.min,
                      //         children: [
                      //           SizedBox(
                      //             height: 3.h,
                      //           ),
                      //           Text(
                      //             "Do you want to cancel session?",
                      //             style: TextStyle(
                      //                 fontFamily: FontUtils.montserratBold,
                      //                 fontSize: 2.2.t),
                      //             textAlign: TextAlign.center,
                      //           ),
                      //           SizedBox(
                      //             height: 2.h,
                      //           ),
                      //           Text(
                      //             "You won’t be able to revert this action later!",
                      //             style: TextStyle(
                      //                 fontFamily: FontUtils.montserratRegular,
                      //                 fontSize: 2.2.t),
                      //             textAlign: TextAlign.center,
                      //           ),
                      //           SizedBox(
                      //             height: 3.h,
                      //           ),
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               InkWell(
                      //                 onTap: () {
                      //                   Navigator.pop(context);
                      //                 },
                      //                 child: Container(
                      //                   decoration: BoxDecoration(
                      //                       color: ColorUtils.purple,
                      //                       borderRadius:
                      //                           BorderRadius.circular(7)),
                      //                   padding: EdgeInsets.fromLTRB(
                      //                       2.w, 1.h, 2.w, 1.h),
                      //                   child: Text(
                      //                     "Yes, Cancel it",
                      //                     style: TextStyle(
                      //                         fontSize: 2.2.t,
                      //                         fontFamily:
                      //                             FontUtils.montserratSemiBold,
                      //                         color: ColorUtils.white),
                      //                   ),
                      //                 ),
                      //               ),
                      //               InkWell(
                      //                 onTap: () {
                      //                   Navigator.pop(context);
                      //                 },
                      //                 child: Container(
                      //                   decoration: BoxDecoration(
                      //                       border: Border.all(
                      //                           color: ColorUtils.purple),
                      //                       borderRadius:
                      //                           BorderRadius.circular(7)),
                      //                   padding: EdgeInsets.all(5),
                      //                   child: Text(
                      //                     "No, Keep it",
                      //                     style: TextStyle(
                      //                         fontSize: 2.2.t,
                      //                         fontFamily:
                      //                             FontUtils.montserratSemiBold,
                      //                         color: ColorUtils.purple),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // );
                    },
                    child: SvgPicture.asset(ImageUtils.delete))
              ],
            ),
          ],
        ),
      ),
    );
}
