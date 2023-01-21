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

class WaitingToJoin extends StatefulWidget {
  const WaitingToJoin({Key? key}) : super(key: key);

  @override
  _WaitingToJoinState createState() => _WaitingToJoinState();
}

class _WaitingToJoinState extends State<WaitingToJoin> {
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Dimensions.topMargin,
                        ),
                        // SizedBox(
                        //   height: 4.h,
                        // ),
                        // Row(
                        //   children: [
                        //     IconButton(
                        //         onPressed: () {
                        //           model.navigateBack();
                        //         },
                        //         icon: Icon(
                        //           Icons.arrow_back_ios_new,
                        //           size: 4.i,
                        //         ))
                        //   ],
                        // ),
                        Row(
                          children: [
                            SizedBox(
                              width: 1.2.w,
                            ),
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
                          height: 20.h,
                        ),
                        Text(
                          "Please wait the client will join soon...",
                          style: TextStyle(
                              color: ColorUtils.purple,
                              fontFamily: FontUtils.montserratMedium,
                              fontSize: 4.t),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SvgPicture.asset(ImageUtils.camera),

                        SizedBox(
                          height: 5.h,
                        ),
                        InkWell(
                            onTap: () {
                              model.navigateToLiveVideo();
                            },
                            child: Button("Next", 15))
                      ],
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }
}
