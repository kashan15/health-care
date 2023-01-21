import 'package:flutter/material.dart';
import 'package:soulgood/Widget/dialog_button.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/extensions.dart';

class MyErrorWidget extends StatelessWidget {
  final String error;
  final Function? customCall;
  const MyErrorWidget({Key? key, required this.error, this.customCall})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.i),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 3.h,
          ),
          Icon(Icons.error_outlined, color: Colors.black, size: 10.i),
          SizedBox(
            height: 1.5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          DialogButton(
            buttonText: "OK",
            buttonBackground: ColorUtils.purple,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            buttonPress: () {
              if (customCall != null) {
                Navigator.pop(context);
                customCall!();
              } else {
                Navigator.pop(context);
              }
            },
          ),
          SizedBox(
            height: 3.h,
          )
        ],
      ),
    );
  }
}
