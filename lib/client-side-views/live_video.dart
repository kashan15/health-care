import 'package:flutter/material.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

class LiveVideo extends StatefulWidget {
  int? sessionId;
  LiveVideo({Key? key, this.sessionId}) : super(key: key);

  @override
  _LiveVideoState createState() => _LiveVideoState();
}

class _LiveVideoState extends State<LiveVideo> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        await model.initForAgora();
      },
      builder: (context, model, child) {
        return SafeArea(
          top: false,
          bottom: false,
          child: WillPopScope(
            onWillPop: () async => false,
            child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Scaffold(
                    // backgroundColor: ColorUtils.black,
                    body: Stack(
                  children: [
                    SizedBox(
                      height: Dimensions.topMargin,
                    ),
                    Center(
                      child: model.renderRemoteVideo(),
                    ),
                    model.cameraOpen == true
                        ? Container(
                            height: 20.h,
                            width: 15.h,
                            color: Colors.transparent,
                          )
                        : Positioned(
                            right: 20,
                            bottom: 120,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: SizedBox(
                                height: 20.h,
                                width: 15.h,
                                child: Center(
                                  child: model.renderLocalPreview(),
                                ),
                              ),
                            ),
                          ),
                    Positioned(
                      bottom: 5.h,
                      left: 17.w,
                      child: Row(
                        children: [
                          // model.cameraOpen == true
                          //     ?
                          InkWell(
                            onTap: () {
                              model.onCamera();
                              model.cameraOpen = !model.cameraOpen;
                              model.offVideo = true;

                              model.notifyListeners();
                            },
                            child: Container(
                                width: 13.w,
                                height: 8.h,
                                decoration: BoxDecoration(
                                    color: ColorUtils.white,
                                    shape: BoxShape.circle),
                                child: model.cameraOpen == false
                                    ? Image.asset(
                                        ImageUtils.camera1,
                                        color: ColorUtils.black,
                                      )
                                    : Icon(Icons.camera_alt)),
                          ),
                          // : InkWell(
                          //     onTap: () {
                          //       model.onCamera();
                          //       model.cameraOpen = !model.cameraOpen;
                          //       model.notifyListeners();
                          //     },
                          //     child: Container(
                          //         width: 13.w,
                          //         height: 8.h,
                          //         decoration: BoxDecoration(
                          //             color: ColorUtils.white,
                          //             shape: BoxShape.circle),
                          //         child: Image.asset(
                          //           ImageUtils.camera1,
                          //           color: ColorUtils.black,
                          //         ))),
                          SizedBox(
                            width: 4.w,
                          ),
                          InkWell(
                            onTap: () {
                              model.switchCamera();
                            },
                            child: Container(
                                width: 13.w,
                                height: 8.h,
                                decoration: BoxDecoration(
                                    color: ColorUtils.white,
                                    shape: BoxShape.circle),
                                child: Icon(Icons.switch_camera_outlined)),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          InkWell(
                              onTap: () {
                                model.callEnd();
                                // model.navigateToAfterChat();
                                // model.sessionChannel = "";
                                // model.sessionToken = "";
                                model.navigateBack();
                                model.notifyListeners();
                              },
                              child: Container(
                                  width: 13.w,
                                  height: 8.h,
                                  decoration: BoxDecoration(
                                      color: ColorUtils.text_red,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.call_end,
                                    color: ColorUtils.white,
                                  ))),
                          SizedBox(
                            width: 4.w,
                          ),
                          InkWell(
                            onTap: () {
                              model.micOnAndOff();
                              model.mic = !model.mic;
                              model.notifyListeners();
                            },
                            child: Container(
                                width: 13.w,
                                height: 8.h,
                                decoration: BoxDecoration(
                                    color: ColorUtils.white,
                                    shape: BoxShape.circle),
                                child: Icon(
                                    model.mic ? Icons.mic_off : Icons.mic)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))),
          ),
        );
      },
    );
  }
}
