import 'package:flutter/material.dart';
import 'package:soulgood/client-side-views/full_journal.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';

Widget therapistClientJournals(context) {
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: Dimensions.horizontalPadding, vertical: 1.h),
    decoration: BoxDecoration(
        border: Border.all(color: ColorUtils.purple),
        borderRadius: BorderRadius.circular(7)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "My Personal",
            style: TextStyle(
                fontFamily: FontUtils.montserratSemiBold,
                fontSize: 2.5.t,
                color: ColorUtils.blue_dark),
          ),
          Text(
            "Journal",
            style: TextStyle(
                fontFamily: FontUtils.montserratRegular,
                fontSize: 2.t,
                color: ColorUtils.purple),
          ),
        ],
      ),
      Text(
        "Dairy",
        style: TextStyle(
            fontFamily: FontUtils.montserratSemiBold,
            fontSize: 2.5.t,
            color: ColorUtils.blue_dark),
      ),
      SizedBox(
        height: 2.h,
      ),
      Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing eli.",
        style: TextStyle(
            fontFamily: FontUtils.montserratRegular,
            fontSize: 2.t,
            color: ColorUtils.blue_dark),
      ),
      SizedBox(
        height: 3.h,
      ),
      Row(
        children: [
          Text(
            "View",
            style: TextStyle(
                fontFamily: FontUtils.montserratSemiBold,
                color: ColorUtils.purple),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: ColorUtils.purple,
            size: 3.i,
          )
        ],
      )
    ]),
  );
}
