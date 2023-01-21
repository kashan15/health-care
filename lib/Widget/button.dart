import 'package:flutter/material.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';

Widget Button(var text, double radius) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: ColorUtils.green, borderRadius: BorderRadius.circular(radius)),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 1.7.h),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: ColorUtils.white,
              fontFamily: FontUtils.montserratSemiBold),
        ),
      ),
    ),
  );
}
