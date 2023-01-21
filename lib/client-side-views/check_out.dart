import 'package:flutter/material.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
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
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Dimensions.topMargin,
                        ),
                        Row(children: [
                          IconButton(
                              onPressed: () {
                                model.navigateBack();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: ColorUtils.black,
                                size: 4.i,
                              )),
                        ]),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.border),
                                    child: Text(
                                      "1",
                                      style: TextStyle(color: ColorUtils.white),
                                    ),
                                  ),
                                  Text(
                                    "Choose Plan",
                                    style: TextStyle(
                                        fontFamily:
                                            FontUtils.montserratSemiBold,
                                        fontSize: 1.5.t,
                                        color: ColorUtils.border),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              SizedBox(
                                height: 4.h,
                                child: const VerticalDivider(),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.border),
                                    child: Text(
                                      "2",
                                      style: TextStyle(color: ColorUtils.white),
                                    ),
                                  ),
                                  Text(
                                    "Review Details",
                                    style: TextStyle(
                                        fontFamily:
                                            FontUtils.montserratSemiBold,
                                        fontSize: 1.5.t,
                                        color: ColorUtils.border),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              SizedBox(
                                height: 4.h,
                                child: const VerticalDivider(),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.purple),
                                    child: Text(
                                      "3",
                                      style: TextStyle(color: ColorUtils.white),
                                    ),
                                  ),
                                  Text(
                                    "Check Out",
                                    style: TextStyle(
                                        fontFamily:
                                            FontUtils.montserratSemiBold,
                                        fontSize: 1.5.t,
                                        color: ColorUtils.purple),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Checkout",
                          style: TextStyle(
                              fontFamily: FontUtils.montserratBold,
                              fontSize: 2.2.t),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        InkWell(
                          onTap: () {
                            model.navigateToPaymentSuccess();
                          },
                          child: Container(
                            width: 50.w,
                            decoration: BoxDecoration(
                                color: ColorUtils.purple,
                                borderRadius: BorderRadius.circular(7)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.7.h),
                              child: Center(
                                child: Text(
                                  "Complete Purchase",
                                  style: TextStyle(
                                      color: ColorUtils.white,
                                      fontFamily: FontUtils.montserratBold,
                                      fontSize: 1.7.t),
                                ),
                              ),
                            ),
                          ),
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
