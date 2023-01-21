import 'package:flutter/material.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:shimmer/shimmer.dart';
import 'package:soulgood/Widget/journals_container.dart';
import 'package:soulgood/Widget/therapist_full_journal.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/therapist-side-view/full_client_journal.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class TherapistJournals extends StatefulWidget {
  String? client;
  String? id;
  TherapistJournals({Key? key, this.client, this.id}) : super(key: key);

  @override
  _TherapistJournalsState createState() => _TherapistJournalsState();
}

class _TherapistJournalsState extends State<TherapistJournals> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.getClientJournal(widget.id!);
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
                backgroundColor: Colors.white,
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
                            Text(
                              widget.client.toString(),
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 2.8.t),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "Journal",
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 2.8.t),
                              // overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                        // SizedBox(
                        //   height: 1.h,
                        // ),
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: InkWell(
                        //     onTap: () {
                        //       model.navigateToWriteJournal();
                        //     },
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //           border: RDottedLineBorder.all(
                        //             color: ColorUtils.purple,
                        //           ),
                        //           borderRadius: BorderRadius.circular(4)),
                        //       padding: EdgeInsets.only(top: 12, bottom: 12),
                        //       width: 42.w,
                        //       child: Center(
                        //           child: Row(
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Icon(
                        //             Icons.edit,
                        //             color: ColorUtils.purple,
                        //           ),
                        //           SizedBox(
                        //             width: 2.w,
                        //           ),
                        //           Text(
                        //             "Write Journal",
                        //             style: TextStyle(
                        //                 color: ColorUtils.purple,
                        //                 fontSize: 2.t,
                        //                 fontFamily: FontUtils.montserratMedium),
                        //           ),
                        //         ],
                        //       )),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 4.h,
                        ),
                        model.clientJournal == true
                            ? model.clientJournalForTherapist.isEmpty
                                ? Center(
                                    child: Text("No Journal Found",
                                        style: TextStyle(
                                            fontFamily:
                                                FontUtils.montserratSemiBold,
                                            fontSize: 2.5.t,
                                            color: ColorUtils.blue_dark)),
                                  )
                                : Column(
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
                                padding: EdgeInsets.only(bottom: 30.h),
                                height: MediaQuery.of(context).size.height,
                                child: ListView.separated(
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          model.navigation_Service.navigateTo(
                                              to: ClientFullJournals(
                                            title: model
                                                .clientJournalForTherapist[
                                                    index]
                                                .title,
                                            descrption: model
                                                .clientJournalForTherapist[
                                                    index]
                                                .description,
                                          ));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  Dimensions.horizontalPadding,
                                              vertical: 1.h),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ColorUtils.purple),
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      model
                                                          .clientJournalForTherapist[
                                                              index]
                                                          .title,
                                                      style: TextStyle(
                                                          fontFamily: FontUtils
                                                              .montserratSemiBold,
                                                          fontSize: 2.5.t,
                                                          color: ColorUtils
                                                              .blue_dark),
                                                    ),
                                                    Text(
                                                      "Journal",
                                                      style: TextStyle(
                                                          fontFamily: FontUtils
                                                              .montserratRegular,
                                                          fontSize: 2.t,
                                                          color: ColorUtils
                                                              .purple),
                                                    ),
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
                                                  model
                                                      .clientJournalForTherapist[
                                                          index]
                                                      .description,
                                                  style: TextStyle(
                                                      fontFamily: FontUtils
                                                          .montserratRegular,
                                                      fontSize: 2.t,
                                                      color:
                                                          ColorUtils.blue_dark),
                                                ),
                                                SizedBox(
                                                  height: 3.h,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    model.navigation_Service
                                                        .navigateTo(
                                                            to: ClientFullJournals(
                                                      title: model
                                                          .clientJournalForTherapist[
                                                              index]
                                                          .title,
                                                      descrption: model
                                                          .clientJournalForTherapist[
                                                              index]
                                                          .description,
                                                    ));
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "View",
                                                        style: TextStyle(
                                                            fontFamily: FontUtils
                                                                .montserratSemiBold,
                                                            color: ColorUtils
                                                                .purple),
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        color:
                                                            ColorUtils.purple,
                                                        size: 3.i,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                    itemCount:
                                        model.clientJournalForTherapist.length),
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
