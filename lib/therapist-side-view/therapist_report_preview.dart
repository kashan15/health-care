import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class TherapistReportPreview extends StatefulWidget {
  const TherapistReportPreview({Key? key}) : super(key: key);

  @override
  _TherapistReportPreviewState createState() => _TherapistReportPreviewState();
}

class _TherapistReportPreviewState extends State<TherapistReportPreview> {
  @override
  void initState() {
    //setup();
    super.initState();
  }

  // Future<void> setup() async {
  //   MainViewModel mainmodel = locator<MainViewModel>();
  //   await tz.initializeTimeZone();
  //   var detroit = tz.getLocation('America/Detroit');
  //   var now = tz.TZDateTime.from(
  //       DateTime.parse(mainmodel.selectedReport!.createdAt!), detroit);
  //   print(now);
  // }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.getPatientReports();
        model.getTime();
        // model.age.clear();
        // model.name.clear();
        // model.Phone.clear();
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
                      // mainAxisAlignment: MainAxisAlignment.start,
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
                        Text(
                          model.timeZone!,
                          // DateTime.parse(model.selectedReport!.createdAt!)
                          //     .toString(),
                          style: TextStyle(
                              color: ColorUtils.black,
                              fontFamily: FontUtils.montserratMedium,
                              fontSize: 1.8.t),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          model.reports[0]['detail'],
                          style: TextStyle(
                              fontFamily: FontUtils.montserratSemiBold,
                              fontSize: 2.t),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
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
                            data:
                                model.selectedReport!.problem_list.toString()),
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
                          "Formulation",
                          style: TextStyle(
                              fontFamily: FontUtils.montserratSemiBold,
                              fontSize: 2.5.t),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Html(
                            data: model.selectedReport!.formulation.toString()),
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

                        // Text(
                        //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam bibendum est rutrum leo vulputate congue. Aliquam erat volutpat. Fusce in mauris consectetur, aliquet elit vitae, accumsan eros. Vestibulum non diam sapien. Sed in pretium massa.",
                        //   style: TextStyle(
                        //       color: ColorUtils.black,
                        //       fontFamily: FontUtils.montserratRegular,
                        //       fontSize: 2.t),
                        // ),
                        // SizedBox(
                        //   height: 4.h,
                        // )
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
