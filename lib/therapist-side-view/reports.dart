import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:shimmer/shimmer.dart';
import 'package:soulgood/Widget/journals_container.dart';
import 'package:soulgood/Widget/therapist_report_container.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/therapist-side-view/therapist_report_preview.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class TherapistReports extends StatefulWidget {
  var patient_Id;
  TherapistReports({Key? key, this.patient_Id}) : super(key: key);

  @override
  _TherapistReportsState createState() => _TherapistReportsState();
}

class _TherapistReportsState extends State<TherapistReports> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.getPatientReports();
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
                body: SingleChildScrollView(
                    child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.horizontalPadding),
                  child: Column(
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
                            "Reports",
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
                            model.navigateToTherapistWriteReports();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: RDottedLineBorder.all(
                                  color: ColorUtils.purple,
                                ),
                                borderRadius: BorderRadius.circular(4)),
                            padding: EdgeInsets.only(top: 12, bottom: 12),
                            width: 42.w,
                            child: Center(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: ColorUtils.purple,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  "Write Report",
                                  style: TextStyle(
                                      color: ColorUtils.purple,
                                      fontSize: 2.t,
                                      fontFamily: FontUtils.montserratMedium),
                                ),
                              ],
                            )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      // ElevatedButton(
                      //     onPressed: () {
                      //       model.getPatientReports();
                      //     },
                      //     child: Text('Click Me')),
                      SizedBox(
                        height: 4.h,
                      ),
                      model.isLoadingForReport == true
                          ? model.reportList.isEmpty
                              ? Text("No Report Found",
                                  style: TextStyle(
                                      fontFamily: FontUtils.montserratSemiBold,
                                      fontSize: 2.5.t,
                                      color: ColorUtils.blue_dark))
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
                          : ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    model.selectedReport =
                                        model.reportList[index];
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TherapistReportPreview()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            Dimensions.horizontalPadding,
                                        vertical: 1.h),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorUtils.purple),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              model.reportList[index].title
                                                  .toString(),
                                              style: TextStyle(
                                                  fontFamily: FontUtils
                                                      .montserratSemiBold,
                                                  fontSize: 2.5.t,
                                                  color: ColorUtils.blue_dark),
                                            ),
                                            Text(
                                              "Report",
                                              style: TextStyle(
                                                  fontFamily: FontUtils
                                                      .montserratRegular,
                                                  fontSize: 2.t,
                                                  color: ColorUtils.purple),
                                            ),
                                          ],
                                        ),
                                        // Text(
                                        //   "Collaborative",
                                        //   style: TextStyle(
                                        //       fontFamily: FontUtils.montserratSemiBold,
                                        //       fontSize: 2.5.t,
                                        //       color: ColorUtils.blue_dark),
                                        // ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Html(
                                          data: model
                                              .reportList[index].problem_list
                                              .toString(),
                                        ),

                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            model.selectedReport =
                                                model.reportList[index];
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TherapistReportPreview()));
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                "View",
                                                style: TextStyle(
                                                    fontFamily: FontUtils
                                                        .montserratSemiBold,
                                                    color: ColorUtils.purple),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: ColorUtils.purple,
                                                size: 3.i,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 3.h,
                                  ),
                              itemCount: model.reportList.length),
                      SizedBox(
                        height: 2.h,
                      )
                      // report(context),
                      // SizedBox(
                      //   height: 3.h,
                      // ),
                      // report(context),
                      // SizedBox(
                      //   height: 3.h,
                      // ),
                      // report(context)
                    ],
                  ),
                )),
              )),
        );
      },
    );
  }
}
