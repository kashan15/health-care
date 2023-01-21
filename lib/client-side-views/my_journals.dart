import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:shimmer/shimmer.dart';
import 'package:soulgood/Widget/bottom_app_bar_custom.dart';
import 'package:soulgood/Widget/journals_container.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/client-side-views/full_journal.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class MyJournals extends StatefulWidget {
  const MyJournals({Key? key}) : super(key: key);

  @override
  _MyJournalsState createState() => _MyJournalsState();
}

class _MyJournalsState extends State<MyJournals> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.getJournals();
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
                                  model.navigation_Service.navigateToUntil(
                                      to: BottomAppBarCustom());
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: ColorUtils.black,
                                  size: 4.i,
                                )),
                            Text(
                              AppLocalizations.of(context)!
                                  .translate('user_db_journal_text_1')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 2.8.t),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              model.navigateToWriteJournal();
                              model.journaltitle.clear();
                              model.journalDes.clear();
                            },
                            child: Container(
                              width: 45.w,
                              padding: EdgeInsets.symmetric(
                                vertical: 2.h,
                              ),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        offset: Offset(0, 6),
                                        color: ColorUtils.grey.withOpacity(0.4))
                                  ],
                                  color: ColorUtils.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(ImageUtils.edit),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .translate('user_db_journal_text_2')!,
                                      style: TextStyle(
                                          color: ColorUtils.black,
                                          fontFamily:
                                              FontUtils.montserratSemiBold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //       border: RDottedLineBorder.all(
                            //         color: ColorUtils.purple,
                            //       ),
                            //       borderRadius: BorderRadius.circular(4)),
                            //   padding: EdgeInsets.only(top: 12, bottom: 12),
                            //   width: 42.w,
                            //   child: Center(
                            //       child: Row(
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.edit,
                            //         color: ColorUtils.purple,
                            //       ),
                            //       SizedBox(
                            //         width: 2.w,
                            //       ),
                            //       Text(
                            //         AppLocalizations.of(context)!
                            //             .translate('user_db_journal_text_2')!,
                            //         style: TextStyle(
                            //             color: ColorUtils.purple,
                            //             fontSize: 2.t,
                            //             fontFamily: FontUtils.montserratMedium),
                            //       ),
                            //     ],
                            //   )),
                            // ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Center(
                          child: Text(
                              // "Your Journals will be shared with your therapist!",
                              AppLocalizations.of(context)!
                                  .translate('other_text_90')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratSemiBold,
                                  fontSize: 1.8.t,
                                  color: ColorUtils.grey)),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        model.journalWaiting == true
                            ? Column(
                                children: [
                                  SizedBox(
                                    width: 100.w,
                                    height: 15.h,
                                    child: Shimmer.fromColors(
                                        baseColor: Colors.grey[100]!,
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
                                        baseColor: Colors.grey[100]!,
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
                            : Container(
                                padding: EdgeInsets.only(bottom: 6.h),
                                height: 80.h,
                                child: ListView.separated(
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FullJournal(
                                                        index: index,
                                                      )));
                                        },
                                        child: Container(
                                          width: 50.w,
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  Dimensions.horizontalPadding,
                                              vertical: 1.h),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    spreadRadius: 1,
                                                    blurRadius: 2,
                                                    offset: Offset(0, 4),
                                                    color: ColorUtils.grey
                                                        .withOpacity(0.2))
                                              ],
                                              color: ColorUtils.white,
                                              border: Border.all(
                                                  color: ColorUtils.white),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 40.w,
                                                    height: 4.h,
                                                    child: Text(
                                                      model
                                                          .patientjournal[index]
                                                          .title,
                                                      style: TextStyle(
                                                        fontFamily: FontUtils
                                                            .montserratSemiBold,
                                                        fontSize: 2.5.t,
                                                        color: ColorUtils
                                                            .blue_dark,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      // maxLines: 3,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      FullJournal(
                                                                        index:
                                                                            index,
                                                                      )));
                                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>FullJournal()));
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .translate(
                                                                  'user_db_journal_text_3')!,
                                                          style: TextStyle(
                                                              fontFamily: FontUtils
                                                                  .montserratSemiBold,
                                                              color: ColorUtils
                                                                  .black),
                                                        ),
                                                        SizedBox(
                                                          width: 1.w,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color:
                                                              ColorUtils.black,
                                                          size: 3.i,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              // Text(
                                              //   "Dairy",
                                              //   style: TextStyle(
                                              //       fontFamily:
                                              //           FontUtils.montserratSemiBold,
                                              //       fontSize: 2.5.t,
                                              //       color: ColorUtils.blue_dark),
                                              // ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Text(
                                                model.patientjournal[index]
                                                    .description,
                                                style: TextStyle(
                                                    fontFamily: FontUtils
                                                        .montserratRegular,
                                                    fontSize: 2.t,
                                                    color:
                                                        ColorUtils.blue_dark),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                      title: SvgPicture.asset(
                                                          ImageUtils.cancel),
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: Dimensions
                                                                  .horizontalPadding),
                                                      content: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 3.h),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            SizedBox(
                                                                height: 3.h),
                                                            Text(
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .translate(
                                                                      'other_text_53')!,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .montserratBold,
                                                                  fontSize:
                                                                      2.t),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            SizedBox(
                                                              height: 2.h,
                                                            ),
                                                            Text(
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .translate(
                                                                      'other_text_54')!,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .montserratRegular,
                                                                  fontSize:
                                                                      2.2.t),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            SizedBox(
                                                              height: 3.h,
                                                            ),
                                                            // SizedBox(height: 5.h),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                    model.journalId = model
                                                                        .patientjournal[
                                                                            index]
                                                                        .Id;
                                                                    print(model
                                                                        .journalId);
                                                                    model
                                                                        .deleteJournal();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(
                                                                            color: ColorUtils
                                                                                .green),
                                                                        color: ColorUtils
                                                                            .green,
                                                                        borderRadius:
                                                                            BorderRadius.circular(15)),
                                                                    padding: EdgeInsets.only(
                                                                        left:
                                                                            1.w,
                                                                        bottom:
                                                                            2.h,
                                                                        right:
                                                                            1.w,
                                                                        top: 2
                                                                            .h),
                                                                    child: Text(
                                                                      AppLocalizations.of(
                                                                              context)!
                                                                          .translate(
                                                                              'other_text_55')!,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            2.t,
                                                                        color: ColorUtils
                                                                            .white,
                                                                        fontFamily:
                                                                            FontUtils.montserratSemiBold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(
                                                                            color: ColorUtils
                                                                                .green),
                                                                        borderRadius:
                                                                            BorderRadius.circular(15)),
                                                                    padding: EdgeInsets.only(
                                                                        left:
                                                                            3.w,
                                                                        bottom:
                                                                            2.h,
                                                                        right:
                                                                            3.w,
                                                                        top: 2
                                                                            .h),
                                                                    child: Text(
                                                                      AppLocalizations.of(
                                                                              context)!
                                                                          .translate(
                                                                              'other_text_56')!,
                                                                      style: TextStyle(
                                                                          fontSize: 2
                                                                              .t,
                                                                          fontFamily: FontUtils
                                                                              .montserratSemiBold,
                                                                          color:
                                                                              ColorUtils.green),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>FullJournal()));
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    SvgPicture.asset(
                                                        ImageUtils.delete)
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 2.h,
                                      );
                                    },
                                    itemCount: model.patientjournal.length),
                              ),
                        // Journals(context),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        // Journals(context),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        // Journals(context),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
