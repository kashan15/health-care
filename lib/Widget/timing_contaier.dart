import 'package:flutter/material.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';

Widget TimeContainer(MainViewModel model, String time, int index, selecttime) {
  return Container(
    width: 25.w,
    height: 5.h,
    decoration: BoxDecoration(
        border: Border.all(
            color: selecttime == index ? ColorUtils.green : ColorUtils.black),
        color: selecttime == index ? ColorUtils.green : Colors.transparent,
        borderRadius: BorderRadius.circular(4)),
    child: Center(
        child: Text(
      time,
      style: TextStyle(
          fontFamily: FontUtils.montserratSemiBold,
          color: selecttime == index ? ColorUtils.white : ColorUtils.black,
          fontWeight: FontWeight.bold,
          fontSize: 2.t),
    )),
  );
}
