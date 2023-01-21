import 'package:flutter/material.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class TehrapisHomeCard extends StatefulWidget {
  const TehrapisHomeCard({Key? key}) : super(key: key);

  @override
  _TehrapisHomeCardState createState() => _TehrapisHomeCardState();
}

class _TehrapisHomeCardState extends State<TehrapisHomeCard> {
  bool onPressed = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.horizontalPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Dimensions.topMargin,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h,
                              horizontal: Dimensions.horizontalPadding),
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorUtils.purple),
                              borderRadius: BorderRadius.circular(7)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Client Name",
                                    style: TextStyle(
                                        fontFamily: FontUtils.montserratRegular,
                                        fontSize: 2.t),
                                  ),
                                  Text(
                                    "24 August, 2021",
                                    style: TextStyle(
                                        fontFamily: FontUtils.montserratRegular,
                                        fontSize: 2.t),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Dean Winchester",
                                    style: TextStyle(
                                        fontFamily: FontUtils.montserratBold,
                                        fontSize: 2.t),
                                  ),
                                  Text(
                                    "08:00 - 80:30 PM",
                                    style: TextStyle(
                                        fontFamily:
                                            FontUtils.montserratSemiBold,
                                        fontSize: 2.t),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (onPressed == true) {
                                      } else {
                                        model.navigateToWaitingToJoin();
                                      }
                                    },
                                    child: Container(
                                      // width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: onPressed == true
                                              ? ColorUtils.greyLight
                                              : ColorUtils.purple,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.5.h, horizontal: 5.w),
                                        child: Center(
                                          child: Text(
                                            "Enable Call",
                                            style: TextStyle(
                                                color: onPressed == true
                                                    ? ColorUtils.grey
                                                    : ColorUtils.white,
                                                fontFamily: FontUtils
                                                    .montserratRegular),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // model.navigateToWaitingToJoin();
                                      onPressed = true;
                                    },
                                    child: Container(
                                      // width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: ColorUtils.purple,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.5.h, horizontal: 2.w),
                                        child: Center(
                                          child: Text(
                                            "Mark as Complete",
                                            style: TextStyle(
                                                color: ColorUtils.white,
                                                fontFamily: FontUtils
                                                    .montserratRegular),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              )
                            ],
                          ))
                    ]),
              ),
            ));
      },
    );
  }
}
