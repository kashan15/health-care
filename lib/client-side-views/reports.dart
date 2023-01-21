import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/client-side-views/full_reports.dart';
import 'package:soulgood/therapist-side-view/therapist_report_preview.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.getReportsFromTherapist();
        // model.getTime();
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
                      child: Column(children: [
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
                                  .translate('user_db_reports_text_1')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 2.5.t),
                            )
                          ],
                        ),
                        // SizedBox(
                        //   height: 4.h,
                        // ),

                        model.checkUserPlan.isEmpty ||
                                model.checkUserPlan[0].type! < 1
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate('user_db_reports_text_10')!,
                                    style: TextStyle(
                                        fontFamily:
                                            FontUtils.montserratSemiBold,
                                        color: ColorUtils.greyLight,
                                        fontSize: 1.8.t),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            : model.reportList.isEmpty
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!
                                            .translate('other_text_60')!,
                                        style: TextStyle(
                                            fontFamily:
                                                FontUtils.montserratSemiBold,
                                            color: ColorUtils.greyLight,
                                            fontSize: 1.8.t),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  )
                                : ListView.separated(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemCount: model.reportList.length,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 3.h,
                                      );
                                    },
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          model.selectedReport =
                                              model.reportList[index];
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FullReports()));
                                        },
                                        child: Container(
                                          height: 10.h,
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Dimensions.horizontalPadding,
                                          ),
                                          decoration: BoxDecoration(
                                              color: ColorUtils.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    spreadRadius: 1,
                                                    blurRadius: 2,
                                                    offset: Offset(0, 4),
                                                    color: ColorUtils.grey
                                                        .withOpacity(0.2))
                                              ],
                                              border: Border.all(
                                                  color: ColorUtils.white),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    DateFormat('MMMM, yyyy')
                                                        .format(DateTime.parse(
                                                            model
                                                                .reportList[
                                                                    index]
                                                                .createdAt!))
                                                        .toString(),
                                                    // model.reportList[index]
                                                    //     .createdAt
                                                    //     .toString(),
                                                    style: TextStyle(
                                                        fontFamily: FontUtils
                                                            .montserratSemiBold,
                                                        fontSize: 2.5.t,
                                                        color:
                                                            ColorUtils.black),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      model.selectedReport =
                                                          model.reportList[
                                                              index];
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  FullReports()));
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
                                                                  .montserratBold,
                                                              color: ColorUtils
                                                                  .black),
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
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                        SizedBox(
                          height: 2.h,
                        )
                      ]),
                    ))),
          ),
        );
      },
    );
  }
}
