import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class FullReports extends StatefulWidget {
  const FullReports({Key? key}) : super(key: key);

  @override
  _FullReportsState createState() => _FullReportsState();
}

class _FullReportsState extends State<FullReports> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.getReportsFromTherapist();
        model.getTime();
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
                    physics: BouncingScrollPhysics(),
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
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: double.infinity,
                          height: 8.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.horizontalPadding,
                          ),
                          decoration: BoxDecoration(
                              color: ColorUtils.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 3,
                                    blurRadius: 2,
                                    offset: Offset(0, 1),
                                    color: ColorUtils.grey.withOpacity(0.2))
                              ],
                              border: Border.all(color: ColorUtils.white),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 2.5.h,
                              ),
                              Text(
                                DateFormat('MMMM, yyyy').format(DateTime.parse(
                                    model.selectedReport!.createdAt!)),
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratSemiBold,
                                    fontSize: 2.5.t,
                                    color: ColorUtils.black),
                              ),
                            ],
                          ),
                        ),
                        // Text(
                        //   model.timeZone.toString(),
                        //   style: TextStyle(
                        //       color: ColorUtils.black,
                        //       fontFamily: FontUtils.montserratMedium,
                        //       fontSize: 1.8.t),
                        // ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        // Text(
                        //   model.reports[0]['detail'],
                        //   style: TextStyle(
                        //       fontFamily: FontUtils.montserratSemiBold,
                        //       fontSize: 2.t),
                        // ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.horizontalPadding,
                              vertical: 1.h),
                          decoration: BoxDecoration(
                              color: ColorUtils.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 3,
                                    blurRadius: 2,
                                    offset: Offset(0, 1),
                                    color: ColorUtils.grey.withOpacity(0.2))
                              ],
                              border: Border.all(color: ColorUtils.white),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Problem List",
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratSemiBold,
                                    fontSize: 2.5.t),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Html(
                                data: model.selectedReport!.problem_list
                                    .toString(),
                              ),
                              // Text(

                              //   style: TextStyle(
                              //       color: ColorUtils.black,
                              //       fontFamily: FontUtils.montserratRegular,
                              //       fontSize: 2.t),
                              // ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "Formulation",
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratSemiBold,
                                    fontSize: 2.5.t),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),

                              Html(
                                  data: model.selectedReport!.formulation
                                      .toString()),

                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "Tasks & Goals",
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratSemiBold,
                                    fontSize: 2.5.t),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Html(
                                  data: model.selectedReport!.tasks_and_goals
                                      .toString()),

                              // Text(
                              //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam bibendum est rutrum leo vulputate congue. Aliquam erat volutpat. Fusce in mauris consectetur, aliquet elit vitae, accumsan eros. Vestibulum non diam sapien. Sed in pretium massa.",
                              //   style: TextStyle(
                              //       color: ColorUtils.black,
                              //       fontFamily: FontUtils.montserratRegular,
                              //       fontSize: 2.t),
                              // ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "Completed Tasks & Goals",
                                style: TextStyle(
                                    fontFamily: FontUtils.montserratSemiBold,
                                    fontSize: 2.5.t),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Html(
                                  data: model
                                      .selectedReport!.completed_tasks_and_goals
                                      .toString()),
                            ],
                          ),
                        ),

                        // Text(
                        //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam bibendum est rutrum leo vulputate congue. Aliquam erat volutpat. Fusce in mauris consectetur, aliquet elit vitae, accumsan eros. Vestibulum non diam sapien. Sed in pretium massa.",
                        //   style: TextStyle(
                        //       color: ColorUtils.black,
                        //       fontFamily: FontUtils.montserratRegular,
                        //       fontSize: 2.t),
                        // ),
                        SizedBox(
                          height: 4.h,
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
