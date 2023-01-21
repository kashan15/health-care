import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/onboard/appointment.dart';
import 'package:soulgood/onboard/on_board.dart';
import 'package:soulgood/onboard/potential.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  PageController first = PageController();
  double progressBarValue = 0.0;

  get model => null;
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
                  floatingActionButton: GestureDetector(
                      onTap: () {
                        print(first.page);
                        //progressBarValue = ((first.page! / 2) * 100) / 100;
                        print(progressBarValue);
                        if (first.page! < 2.0) {
                          first.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        } else {
                          model.navigateToLoginTabBar();
                        }
                        //model.notifyListeners();
                        //model.navigateToLogin();
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorUtils.purple,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                                size: 4.i,
                                // height: 1.h,
                                // width: 1.w,
                              ),
                            ),
                          ),
                          TweenAnimationBuilder(
                            tween: Tween(begin: 0.0, end: progressBarValue),
                            duration: Duration(seconds: 2),
                            builder: (context, value, child) {
                              return SizedBox(
                                width: 17.w,
                                height: 17.w,
                                child: CircularProgressIndicator(
                                  value: double.parse(value.toString()),
                                  color: ColorUtils.purple,
                                  backgroundColor: Colors.transparent,
                                  strokeWidth: 3,
                                ),
                              );
                            },
                          ),
                        ],
                      )),
                  body: Stack(
                    children: [
                      PageView(
                        onPageChanged: (value) {
                          print(value);
                          progressBarValue = ((value / 2) * 100) / 100;
                          print(progressBarValue);
                          model.notifyListeners();
                        },
                        controller: first,
                        children: [OnBoard(), Appointment(), Potential()],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 90.h),
                        // bottom: 15.h,
                        // left: 40.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: SmoothPageIndicator(
                                  controller: first,
                                  count: 3,
                                  effect: WormEffect(
                                      dotWidth: 2.w,
                                      dotHeight: 1.h,
                                      activeDotColor: ColorUtils.purple),
                                  onDotClicked: (index) => first.animateToPage(
                                      index,
                                      duration: Duration(seconds: 5),
                                      curve: Curves.fastLinearToSlowEaseIn),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          );
        });
  }
}
