import 'package:flutter/material.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
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
                backgroundColor: Colors.white,
                body: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.horizontalPadding),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                              "Notes",
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 2.5.t),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Material(
                          elevation: 10,
                          shadowColor: ColorUtils.border.withOpacity(0.3),
                          child: TextField(
                            controller: model.journalDes,
                            // maxLength: 1500,
                            maxLines: 5,
                            style: TextStyle(
                                fontFamily: FontUtils.montserratRegular,
                                fontSize: 2.5.t),
                            decoration: InputDecoration(
                                hintText: 'brief notes by therapist...',
                                hintStyle: TextStyle(
                                    color: ColorUtils.black,
                                    fontFamily: FontUtils.montserratRegular),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorUtils.purple)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorUtils.purple)),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorUtils.purple),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        InkWell(
                          onTap: () {
                            model.writeNote();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ColorUtils.purple,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 13.w, vertical: 2.h),
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: FontUtils.montserratSemiBold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "Emergency Contact Information",
                          style: TextStyle(
                              fontFamily: FontUtils.montserratBold,
                              fontSize: 2.8.t),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                            width: 100.w,
                            // height: 24.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: 2.h),
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorUtils.border),
                                borderRadius: BorderRadius.circular(7)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name",
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratBold,
                                      fontSize: 2.t),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  model.userData!.emc_name.toString(),
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratMedium),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  "Relationship",
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratBold,
                                      fontSize: 2.t),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  model.userData!.emc_relation.toString(),
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratMedium),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  "Contact number",
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratBold,
                                      fontSize: 2.t),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  model.userData!.emc_phone_number.toString(),
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratMedium),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 4.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "User Subscription plan",
                            style: TextStyle(
                                fontFamily: FontUtils.montserratBold,
                                fontSize: 2.8.t),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                            width: 100.w,
                            // height: 24.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: 2.h),
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorUtils.border),
                                borderRadius: BorderRadius.circular(7)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Plan Type",
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratBold,
                                      fontSize: 2.t),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  model.userData!.planType.toString(),
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratMedium),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  "Plan Title",
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratBold,
                                      fontSize: 2.t),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  model.checkUserPlan[0].title.toString(),
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratMedium),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  "Remaining Sessions",
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratBold,
                                      fontSize: 2.t),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  model.data.length.toString(),
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratMedium),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 4.h,
                        )
                      ],
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }
}
