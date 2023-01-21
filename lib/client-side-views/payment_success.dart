import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:soulgood/Widget/bottom_app_bar.dart';
import 'package:soulgood/Widget/bottom_app_bar_custom.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/client-side-views/choose_your_plan.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';
// import 'package:url_launcher/url_launcher.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => locator<MainViewModel>(),
        disposeViewModel: false,
        onModelReady: (model) {
          // model.getJournals();
        },
        builder: (context, model, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                body: SafeArea(
                    child: Column(children: <Widget>[
              // TextField(
              //   decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
              //   controller: urlController,
              //   keyboardType: TextInputType.url,
              //   onSubmitted: (value) {
              //     var url =
              //         Uri.parse("https://www.google.com/search?q=" + value);
              //     if (url.scheme.isEmpty) {
              //       url = Uri.parse(value);
              //     }
              //     webViewController?.loadUrl(
              //         urlRequest: URLRequest(url: url));
              //   },
              // ),
              Expanded(
                child: Stack(
                  children: [
                    InAppWebView(
                      key: webViewKey,
                      initialUrlRequest: URLRequest(url: Uri.parse(model.url1)),
                      initialOptions: options,
                      pullToRefreshController: pullToRefreshController,
                      onWebViewCreated: (controller) {
                        webViewController = controller;
                      },
                      onLoadStart: (controller, url) {
                        setState(() {
                          this.url = url.toString();
                          urlController.text = this.url;
                        });
                        if (urlController.value ==
                                'https://web.soulgoodhealth.com/#/https://www.soulgoodhealth.com' ||
                            urlController.text ==
                                'https://web.soulgoodhealth.com/#/subscription-successfull') {
                          // urlController.dispose();
                          // controller.goBack();

                          model.navigation_Service
                              .navigateToUntil(to: BottomAppBarCustom())();
                        }

                        print(model.url1);
                        print('hello');
                        // if (urlController.value !=
                        //     'https://checkout.stripe.com/pay/cs_test_b1ot4jANxjaaTDg0apCjZnx1ziFdjfXiW7s9lrCMrtNNSzKd8J1EmHYarq#fidkdWxOYHwnPyd1blpxYHZxWjA0T1BJUGxAYnBnZFNOcTBPVWtiQVxqYGhVcH9wZF9JNFBIRFVDQk9NbX8zNjd%2FNjY9S243QHI0a2o2dDZnYzV2STx0QmpUQE1SSU5MVHxfSnNCMmphMGh2NTVMQUpsUEtHYCcpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPydocGlxbFpscWBoJyknYGtkZ2lgVWlkZmBtamlhYHd2Jz9xd3BgeCUl') {
                        //   // urlController.dispose();
                        //   // controller.goBack();
                        //   print('hello1');
                        //   print(model.url1);
                        //   // model.navigateToChooseYourPlan();
                        //   model.navigation_Service
                        //       .navigateToUntil(to: ChoosePlan());
                        // } else if (urlController.value ==
                        //     'https://web.soulgoodhealth.com/#/subscription-successfull') {
                        //   print('hello2');
                        //   // controller.goBack();
                        // }
                        //  else {
                        //   //  if (urlController.value !=
                        //   //     'https://checkout.stripe.com/pay/cs_test_b1ot4jANxjaaTDg0apCjZnx1ziFdjfXiW7s9lrCMrtNNSzKd8J1EmHYarq#fidkdWxOYHwnPyd1blpxYHZxWjA0T1BJUGxAYnBnZFNOcTBPVWtiQVxqYGhVcH9wZF9JNFBIRFVDQk9NbX8zNjd%2FNjY9S243QHI0a2o2dDZnYzV2STx0QmpUQE1SSU5MVHxfSnNCMmphMGh2NTVMQUpsUEtHYCcpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPydocGlxbFpscWBoJyknYGtkZ2lgVWlkZmBtamlhYHd2Jz9xd3BgeCUl') {
                        // }
                      },
                      androidOnPermissionRequest:
                          (controller, origin, resources) async {
                        return PermissionRequestResponse(
                            resources: resources,
                            action: PermissionRequestResponseAction.GRANT);
                      },
                      shouldOverrideUrlLoading:
                          (controller, navigationAction) async {
                        var uri = navigationAction.request.url!;

                        // if (![ "http", "https", "file", "chrome",
                        //   "data", "javascript", "about"].contains(uri.scheme)) {
                        //   if (await canLaunch(url)) {
                        //     // Launch the App
                        //     await launch(
                        //       url,
                        //     );
                        //     // and cancel the request
                        //     return NavigationActionPolicy.CANCEL;
                        //   }
                        // }

                        // return NavigationActionPolicy.ALLOW;
                      },
                      onLoadStop: (controller, url) async {
                        pullToRefreshController.endRefreshing();
                        setState(() {
                          this.url = url.toString();
                          urlController.text = this.url;
                        });
                        if (urlController.text ==
                                'https://web.soulgoodhealth.com/#/https://www.soulgoodhealth.com' ||
                            urlController.text ==
                                'https://web.soulgoodhealth.com/#/subscription-successfull') {
                          // urlController.dispose();
                          // controller.goBack();

                          model.navigation_Service
                              .navigateToUntil(to: BottomAppBarCustom());
                        }
                      },
                      onLoadError: (controller, url, code, message) {
                        pullToRefreshController.endRefreshing();
                      },
                      onProgressChanged: (controller, progress) {
                        if (progress == 100) {
                          pullToRefreshController.endRefreshing();
                        }
                        setState(() {
                          this.progress = progress / 100;
                          urlController.text = this.url;
                        });
                      },
                      onUpdateVisitedHistory:
                          (controller, url, androidIsReload) {
                        setState(() {
                          this.url = url.toString();
                          urlController.text = this.url;
                        });
                      },
                      onConsoleMessage: (controller, consoleMessage) {
                        print(consoleMessage);
                      },
                    ),
                    progress < 1.0
                        ? LinearProgressIndicator(value: progress)
                        : Container(),
                  ],
                ),
              ),
              // ButtonBar(
              //   alignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     ElevatedButton(
              //       child: Icon(Icons.arrow_back),
              //       onPressed: () {
              //         webViewController?.goBack();
              //       },
              //     ),
              //     ElevatedButton(
              //       child: Icon(Icons.arrow_forward),
              //       onPressed: () {
              //         webViewController?.goForward();
              //       },
              //     ),
              //     ElevatedButton(
              //       child: Icon(Icons.refresh),
              //       onPressed: () {
              //         webViewController?.reload();
              //       },
              //     ),
              //   ],
              // ),
            ]))),
          );
        });
  }

// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:soulgood/app/locator.dart';
// import 'package:soulgood/client-side-views/manage_subscription_plan.dart';
// import 'package:soulgood/utils/color_utils.dart';
// import 'package:soulgood/utils/dimensions.dart';
// import 'package:soulgood/utils/extensions.dart';
// import 'package:soulgood/utils/font_utils.dart';
// import 'package:soulgood/utils/image_utils.dart';
// import 'package:soulgood/viewModels/main_view_model.dart';
// import 'package:stacked/stacked.dart';

// class PaymentSuccess extends StatefulWidget {
//   const PaymentSuccess({Key? key}) : super(key: key);

//   @override
//   _PaymentSuccessState createState() => _PaymentSuccessState();
// }

// class _PaymentSuccessState extends State<PaymentSuccess> {
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<MainViewModel>.reactive(
//       viewModelBuilder: () => locator<MainViewModel>(),
//       disposeViewModel: false,
//       onModelReady: (model) {},
//       builder: (context, model, child) {
//         return SafeArea(
//           top: false,
//           bottom: false,
//           child: GestureDetector(
//               onTap: () {
//                 FocusScope.of(context).unfocus();
//               },
//               child: Scaffold(
//                 backgroundColor: Colors.white,
//                 body: Container(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: Dimensions.horizontalPadding),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         InAppWebView(

//                         ),
//                         SizedBox(
//                           height: Dimensions.topMargin,
//                         ),
//                         Row(
//                           children: [
//                             IconButton(
//                                 onPressed: () {
//                                   model.navigateBack();
//                                 },
//                                 icon: Icon(
//                                   Icons.arrow_back_ios,
//                                   color: ColorUtils.black,
//                                   size: 4.i,
//                                 )),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 10.h,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SvgPicture.asset(ImageUtils.success),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 2.h,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Payment Successful",
//                               style: TextStyle(
//                                   fontFamily: FontUtils.montserratBold,
//                                   fontSize: 3.t),
//                               textAlign: TextAlign.center,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 3.h,
//                         ),
//                         Text(
//                           "Thank you! You have successfully bought the subscription plan.",
//                           style: TextStyle(
//                               fontFamily: FontUtils.montserratRegular,
//                               fontSize: 1.8.t),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(
//                           height: 7.h,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             model.navigateToManageSubs();
//                           },
//                           child: Container(
//                             width: 50.w,
//                             decoration: BoxDecoration(
//                                 color: ColorUtils.purple,
//                                 borderRadius: BorderRadius.circular(7)),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(vertical: 1.7.h),
//                               child: Center(
//                                 child: Text(
//                                   "Complete Purchase",
//                                   style: TextStyle(
//                                       color: ColorUtils.white,
//                                       fontFamily: FontUtils.montserratBold,
//                                       fontSize: 1.7.t),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               )),
//         );
//       },
//     );
//   }
// }
}
