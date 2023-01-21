import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

import '../utils/constants.dart';

class ThrepistDetails extends StatefulWidget {
  String? id;
  String? image;
  String? name;
  String? qualification;
  String? description;
  ThrepistDetails(
      {Key? key,
      this.id,
      this.image,
      this.name,
      this.qualification,
      this.description})
      : super(key: key);

  @override
  _ThrepistDetailsState createState() => _ThrepistDetailsState();
}

class _ThrepistDetailsState extends State<ThrepistDetails> {
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
                        IconButton(
                            onPressed: () {
                              model.navigateBack();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: ColorUtils.black,
                              size: 4.i,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            model.therapistDetail!.image!.isEmpty
                                ? CircleAvatar(
                                    backgroundColor: ColorUtils.blue,
                                    foregroundImage:
                                        AssetImage(ImageUtils.support),
                                  )
                                : CircleAvatar(
                                    backgroundColor: ColorUtils.blue,
                                    foregroundImage: NetworkImage(
                                        'https://api-prod.soulgoodhealth.com:5000' +
                                            Constants.blogImage +
                                            model.therapistDetail!.image
                                                .toString()),
                                    radius: 50,
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              model.therapistDetail!.name.toString(),
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratSemiBold,
                                  fontSize: 2.8.t),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Divider(
                          indent: 2.w,
                          endIndent: 2.w,
                          thickness: 1,
                          color: ColorUtils.border.withOpacity(0.2),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Qualification",
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratMedium,
                                  fontSize: 1.8.t,
                                  color: ColorUtils.purple),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 3.h),
                              child: Html(
                                  data: model.therapistDetail!.qualification)),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Divider(
                          indent: 2.w,
                          endIndent: 2.w,
                          thickness: 1,
                          color: ColorUtils.border.withOpacity(0.2),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Description",
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratMedium,
                                  fontSize: 1.8.t,
                                  color: ColorUtils.purple),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                              width: 70.w,
                              height: 15.h,
                              child: Html(
                                  data: model.therapistDetail!.description)),
                        ),
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
