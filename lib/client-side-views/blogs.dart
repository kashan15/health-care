import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/models/blogs.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/constants.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:mime/mime.dart';

class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
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
                    // physics: const BouncingScrollPhysics(),
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
                                  .translate('user_db_home_text_18')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 2.5.t),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        model.waitingBlog == true
                            ? Column(
                                children: [
                                  SizedBox(
                                    width: 100.w,
                                    height: 15.h,
                                    child: Shimmer.fromColors(
                                        baseColor: Colors.grey[200]!,
                                        highlightColor: Colors.grey[50]!,
                                        child: Container(
                                          height: 5.h,
                                          width: 5.w,
                                          color: ColorUtils.purple,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    height: 15.h,
                                    child: Shimmer.fromColors(
                                        baseColor: Colors.grey[200]!,
                                        highlightColor: Colors.grey[50]!,
                                        child: Container(
                                          height: 5.h,
                                          width: 5.w,
                                          color: ColorUtils.purple,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    height: 15.h,
                                    child: Shimmer.fromColors(
                                        baseColor: Colors.grey[200]!,
                                        highlightColor: Colors.grey[50]!,
                                        child: Container(
                                          height: 5.h,
                                          width: 5.w,
                                          color: ColorUtils.purple,
                                        )),
                                  ),
                                ],
                              )
                            : ListView.separated(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      model.selectedBlog =
                                          model.jsonConvert[index];
                                      model.navigateToBlogPreview();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.w, vertical: 4.h),
                                      decoration: BoxDecoration(
                                          color: ColorUtils.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                spreadRadius: 1,
                                                blurRadius: 2,
                                                offset: Offset(0, 4),
                                                color: ColorUtils.grey
                                                    .withOpacity(0.2)),
                                          ]),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // SizedBox(
                                          //   height: 4.h,
                                          // ),

                                          // lookupMimeType(model
                                          //             .jsonConvert[index]
                                          //             .image!)!
                                          //         .contains("svg")
                                          //     ? SvgPicture.network(
                                          //         'https://api.soulgoodhealth.com:5000' +
                                          //             Constants.blogImage +
                                          //             model.jsonConvert[index]
                                          //                 .image
                                          //                 .toString(),
                                          //         height: 30.h,
                                          //         fit: BoxFit.scaleDown,
                                          //       )
                                          //     : Image.network(
                                          //         'https://api.soulgoodhealth.com:5000' +
                                          //             Constants.blogImage +
                                          //             model.jsonConvert[index]
                                          //                 .image
                                          //                 .toString(),
                                          //         //   // model.ImageOfBlog.toString(),
                                          //         scale: 0.5,
                                          //         fit: BoxFit.fill,
                                          //       ),
                                          // SizedBox(
                                          //   height: 2.h,
                                          // ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 50.w,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      model.selectedAppLanguage !=
                                                              1
                                                          ? model
                                                              .jsonConvert[
                                                                  index]
                                                              .title
                                                              .toString()
                                                          : model
                                                              .jsonConvert[
                                                                  index]
                                                              .title_in_chinese
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontFamily: FontUtils
                                                              .montserratSemiBold,
                                                          fontSize: 2.5.t),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                    Container(
                                                      height: 15.h,
                                                      child: Html(
                                                        data: model.selectedAppLanguage !=
                                                                1
                                                            ? model
                                                                .jsonConvert[
                                                                    index]
                                                                .description
                                                            : model
                                                                .jsonConvert[
                                                                    index]
                                                                .description_in_chinese,
                                                        // style: {
                                                        //   'description': Style(
                                                        //       // maxLines: 2,
                                                        //       textOverflow:
                                                        //           TextOverflow.ellipsis),
                                                        // },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                // width: 30.w,
                                                // height: 20.h,
                                                child: lookupMimeType(model
                                                            .jsonConvert[index]
                                                            .image!)!
                                                        .contains("svg")
                                                    ? SvgPicture.network(
                                                        'https://api-prod.soulgoodhealth.com:5000' +
                                                            Constants
                                                                .blogImage +
                                                            model
                                                                .jsonConvert[
                                                                    index]
                                                                .image
                                                                .toString(),
                                                        height: 20.h,
                                                        fit: BoxFit.scaleDown,
                                                      )
                                                    : Image.network(
                                                        'https://api-prod.soulgoodhealth.com:5000' +
                                                            Constants
                                                                .blogImage +
                                                            model
                                                                .jsonConvert[
                                                                    index]
                                                                .image
                                                                .toString(),
                                                        //   // model.ImageOfBlog.toString(),
                                                        height: 15.h,
                                                        width: 30.w,
                                                        // scale: 0.1,
                                                        fit: BoxFit.fill,
                                                      ),
                                              )
                                            ],
                                          ),
                                          // Text(model.description,
                                          //     style: TextStyle(
                                          //         fontFamily:
                                          //             FontUtils.montserratRegular,
                                          //         fontSize: 2.3.t)),
                                          // SizedBox(
                                          //   height: 3.h,
                                          // ),
                                          // InkWell(
                                          //   onTap: () {
                                          //     model.selectedBlog =
                                          //         model.jsonConvert[index];
                                          //     model.navigateToBlogPreview();
                                          //   },
                                          //   child: Container(
                                          //     decoration: BoxDecoration(
                                          //         border: Border.all(
                                          //             color:
                                          //                 ColorUtils.purple),
                                          //         borderRadius:
                                          //             BorderRadius.circular(
                                          //                 7)),
                                          //     padding:
                                          //         const EdgeInsets.fromLTRB(
                                          //             15, 15, 15, 15),
                                          //     child: Text(
                                          //       AppLocalizations.of(context)!
                                          //           .translate(
                                          //               'other_text_30')!,
                                          //       style: TextStyle(
                                          //           fontSize: 2.2.t,
                                          //           fontFamily: FontUtils
                                          //               .montserratSemiBold,
                                          //           color: ColorUtils.purple),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 3.h,
                                    ),
                                itemCount: model.jsonConvert.length),
                        SizedBox(
                          height: 5.h,
                        )
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       "Self Help Zone",
                        //       style: TextStyle(
                        //           fontFamily: FontUtils.montserratBold,
                        //           fontSize: 3.t),
                        //       textAlign: TextAlign.center,
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        // Text(
                        //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        //   style: TextStyle(
                        //       color: ColorUtils.purple,
                        //       fontFamily: FontUtils.montserratSemiBold,
                        //       fontSize: 2.t),
                        //   textAlign: TextAlign.center,
                        // ),
                        // SizedBox(
                        //   height: 4.h,
                        // ),
                        // Image.asset(ImageUtils.firstBlog),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        // Text(
                        //   model.title,
                        //   style: TextStyle(
                        //       fontFamily: FontUtils.montserratSemiBold,
                        //       fontSize: 2.5.t),
                        //   textAlign: TextAlign.center,
                        // ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        // Text(
                        //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut congue diam. \nDonec posuere auctor aliquam.",
                        //     style: TextStyle(
                        //         fontFamily: FontUtils.montserratRegular,
                        //         fontSize: 2.3.t)),
                        // SizedBox(
                        //   height: 3.h,
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     // model.navigateToBlogPreview();
                        //     model.fullBlog(0);
                        //   },
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //         border: Border.all(color: ColorUtils.purple),
                        //         borderRadius: BorderRadius.circular(7)),
                        //     padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                        //     child: Text(
                        //       "Read Blog",
                        //       style: TextStyle(
                        //           fontSize: 2.2.t,
                        //           fontFamily: FontUtils.montserratSemiBold,
                        //           color: ColorUtils.purple),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 3.h,
                        // ),
                        // Image.asset(ImageUtils.secondBlog),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        // Text(
                        //   "Lorem Ipsum",
                        //   style: TextStyle(
                        //       fontFamily: FontUtils.montserratSemiBold,
                        //       fontSize: 2.5.t),
                        //   textAlign: TextAlign.center,
                        // ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        // Text(
                        //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut congue diam. \nDonec posuere auctor aliquam.",
                        //     style: TextStyle(
                        //         fontFamily: FontUtils.montserratRegular,
                        //         fontSize: 2.3.t)),
                        // SizedBox(
                        //   height: 3.h,
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     model.navigateToBlogPreview();
                        //   },
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //         border: Border.all(color: ColorUtils.purple),
                        //         borderRadius: BorderRadius.circular(7)),
                        //     padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                        //     child: Text(
                        //       "Read Blog",
                        //       style: TextStyle(
                        //           fontSize: 2.2.t,
                        //           fontFamily: FontUtils.montserratSemiBold,
                        //           color: ColorUtils.purple),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 3.h,
                        // ),
                        // Image.asset(ImageUtils.thirdBlog),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        // Text(
                        //   "Lorem Ipsum",
                        //   style: TextStyle(
                        //       fontFamily: FontUtils.montserratSemiBold,
                        //       fontSize: 2.5.t),
                        //   textAlign: TextAlign.center,
                        // ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        // Text(
                        //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut congue diam. \nDonec posuere auctor aliquam.",
                        //     style: TextStyle(
                        //         fontFamily: FontUtils.montserratRegular,
                        //         fontSize: 2.3.t)),
                        // SizedBox(
                        //   height: 3.h,
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     model.navigateToBlogPreview();
                        //   },
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //         border: Border.all(color: ColorUtils.purple),
                        //         borderRadius: BorderRadius.circular(7)),
                        //     padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                        //     child: Text(
                        //       "Read Blog",
                        //       style: TextStyle(
                        //           fontSize: 2.2.t,
                        //           fontFamily: FontUtils.montserratSemiBold,
                        //           color: ColorUtils.purple),
                        //     ),
                        //   ),
                        // ),
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
