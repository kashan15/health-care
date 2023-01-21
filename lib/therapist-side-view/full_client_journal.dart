import 'package:flutter/material.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class ClientFullJournals extends StatefulWidget {
  String? title;
  String? descrption;
  ClientFullJournals({Key? key, this.title, this.descrption}) : super(key: key);

  @override
  _ClientFullJournalsState createState() => _ClientFullJournalsState();
}

class _ClientFullJournalsState extends State<ClientFullJournals> {
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Dimensions.topMargin,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                          ],
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.horizontalPadding,
                                vertical: 1.5.h),
                            width: 100.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorUtils.purple),
                                borderRadius: BorderRadius.circular(7)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      widget.title.toString(),
                                      style: TextStyle(
                                          fontFamily: FontUtils.montserratBold,
                                          fontSize: 2.5.t,
                                          color: ColorUtils.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  widget.descrption.toString(),
                                  style: TextStyle(
                                      fontSize: 2.5.t,
                                      fontFamily: FontUtils.montserratRegular),
                                )
                              ],
                            )),
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
