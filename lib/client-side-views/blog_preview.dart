import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mime/mime.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/constants.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

import '../utils/app_localization.dart';

class BlogPreview extends StatefulWidget {
  // int? index;
  BlogPreview({
    Key? key,
  }) : super(key: key);
  @override
  _BlogPreviewState createState() => _BlogPreviewState();
}

class _BlogPreviewState extends State<BlogPreview> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.fullBlog();
      },
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            AppLocalizations.of(context)!
                                .translate('user_db_home_text_8')!,
                            style: TextStyle(
                                fontFamily: FontUtils.montserratBold,
                                fontSize: 2.5.t),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 2.h),
                        //height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                model.selectedAppLanguage != 1
                                    ? model.selectedBlog!.title.toString()
                                    : model.selectedBlog!.title_in_chinese
                                        .toString(),
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratRegular,
                                    fontSize: 2.8.t),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "by ",
                                  style: TextStyle(
                                      color: ColorUtils.purple,
                                      fontFamily: FontUtils.montserratRegular,
                                      fontSize: 2.t),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  model.selectedBlog!.author_name.toString(),
                                  style: TextStyle(
                                      color: ColorUtils.purple,
                                      fontFamily: FontUtils.montserratRegular,
                                      fontSize: 2.t),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "( ${model.selectedBlog!.posted_date.toString().substring(4, 16)})",
                                  style: TextStyle(
                                      color: ColorUtils.border,
                                      fontFamily: FontUtils.montserratRegular,
                                      fontSize: 2.t),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            lookupMimeType(model.selectedBlog!.image!)!
                                    .contains("svg")
                                ? SvgPicture.network(
                                    'https://api-prod.soulgoodhealth.com:5000' +
                                        Constants.blogImage +
                                        model.selectedBlog!.image.toString(),
                                    height: 30.h,
                                    fit: BoxFit.scaleDown,
                                  )
                                : Image.network(
                                    'https://api-prod.soulgoodhealth.com:5000' +
                                        Constants.blogImage +
                                        model.selectedBlog!.image.toString(),
                                    //   // model.ImageOfBlog.toString(),
                                    scale: 0.5,
                                    fit: BoxFit.fill,
                                  ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                  color: ColorUtils.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 1),
                                        blurRadius: 1,
                                        color: ColorUtils.grey.withOpacity(0.4))
                                  ]),
                              child: Html(
                                data: model.selectedAppLanguage != 1
                                    ? model.selectedBlog!.description
                                    : model
                                        .selectedBlog!.description_in_chinese,
                                style: {
                                  'description':
                                      Style(textOverflow: TextOverflow.ellipsis)
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Text(
                      //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      //   style: TextStyle(
                      //       fontFamily: FontUtils.montserratRegular,
                      //       fontSize: 2.8.t),
                      //   textAlign: TextAlign.center,
                      // ),
                      // SizedBox(
                      //   height: 2.h,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(
                      //       "by Sarah Light ",
                      //       style: TextStyle(
                      //           color: ColorUtils.purple,
                      //           fontFamily: FontUtils.montserratRegular,
                      //           fontSize: 2.t),
                      //       textAlign: TextAlign.center,
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: 2.h),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(
                      //       "(OCT 2021)",
                      //       style: TextStyle(
                      //           color: ColorUtils.border,
                      //           fontFamily: FontUtils.montserratRegular,
                      //           fontSize: 2.t),
                      //       textAlign: TextAlign.center,
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 4.h,
                      // ),
                      // Image.asset(ImageUtils.firstBlog),
                      // SizedBox(
                      //   height: 2.h,
                      // ),
                      // Text(
                      //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      //     style: TextStyle(
                      //         fontFamily: FontUtils.montserratRegular,
                      //         fontSize: 2.5.t)),
                      // SizedBox(
                      //   height: 2.h,
                      // ),
                      // Text(
                      //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eleifend vitae velit sed sollicitudin. Nam at mattis velit. Vestibulum sed mauris convallis, venenatis dolor at, mattis urna. Ut volutpat magna nulla, at ullamcorper nunc cursus sed. Nullam vehicula imperdiet nunc, sit amet egestas nisi dictum eget. In porttitor interdum arcu, vitae blandit metus. Curabitur ac luctus ligula. In tincidunt, nibh quis bibendum blandit, sem tellus eleifend sem, quis luctus enim magna id ex. Aenean laoreet leo nulla, at scelerisque nisl tempor quis. Donec et nisl augue. ",
                      //     style: TextStyle(
                      //         fontFamily: FontUtils.montserratBold,
                      //         fontSize: 2.5.t)),
                      // SizedBox(
                      //   height: 3.h,
                      // ),
                      // Text(
                      //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      //     style: TextStyle(
                      //         fontFamily: FontUtils.montserratRegular,
                      //         fontSize: 2.5.t)),
                      // SizedBox(
                      //   height: 3.h,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     SvgPicture.asset(
                      //       ImageUtils.dot,
                      //       height: 3.h,
                      //       fit: BoxFit.scaleDown,
                      //     ),
                      //     Expanded(
                      //       child: Text(
                      //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eleifend vitae velit sed sollicitudin. Nam at mattis velit.",
                      //           style: TextStyle(
                      //               fontFamily: FontUtils.montserratBold,
                      //               fontSize: 2.3.t)),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 1.h,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     SvgPicture.asset(
                      //       ImageUtils.dot,
                      //       height: 3.h,
                      //       fit: BoxFit.scaleDown,
                      //     ),
                      //     Expanded(
                      //       child: Text(
                      //           "Vestibulum sed mauris convallis, venenatis dolor at, mattis urna. Ut volutpat magna nulla, at ullamcorper nunc cursus sed. Nullam vehicula imperdiet nunc, sit amet egestas nisi dictum eget. In porttitor interdum arcu, vitae blandit metus.",
                      //           style: TextStyle(
                      //               fontFamily: FontUtils.montserratBold,
                      //               fontSize: 2.3.t)),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 1.h,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     SvgPicture.asset(
                      //       ImageUtils.dot,
                      //       height: 3.h,
                      //       fit: BoxFit.scaleDown,
                      //     ),
                      //     Expanded(
                      //       child: Text(
                      //           "Nullam vehicula imperdiet nunc, sit amet egestas nisi dictum eget. In porttitor interdum arcu, vitae blandit metus.",
                      //           style: TextStyle(
                      //               fontFamily: FontUtils.montserratBold,
                      //               fontSize: 2.3.t)),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
