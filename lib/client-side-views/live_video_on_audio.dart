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

class LiveVideoOnAudio extends StatefulWidget {
  int? sessionId;
  LiveVideoOnAudio({Key? key, this.sessionId}) : super(key: key);

  @override
  _LiveVideoOnAudioState createState() => _LiveVideoOnAudioState();
}

class _LiveVideoOnAudioState extends State<LiveVideoOnAudio> {
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
        await model.initForAgoraForAudioCall();
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
                    Container(
                      color: ColorUtils.black,
                    ),
                    model.remoteUid == null
                        ? Center(
                            child: Text(
                              "Please Wait For Remote User To Join",
                              style: TextStyle(color: ColorUtils.white),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: ColorUtils.black,
                          ),
                    // Center(
                    //     child:
                    //  model.cameraOpen1 == false
                    //     ?
                    //         Container(
                    //   width: double.infinity,
                    //   height: double.infinity,
                    //   color: ColorUtils.black,
                    // )
                    // : model.renderRemoteVideo(),
                    // ),
                    // model.cameraOpen1 == false
                    //     ? Container()
                    //     : Positioned(
                    //         right: 20,
                    //         bottom: 120,
                    //         child: Align(
                    //           alignment: Alignment.bottomRight,
                    //           child: SizedBox(
                    //             height: 20.h,
                    //             width: 15.h,
                    //             child: Center(
                    //               child: model.renderLocalPreview(),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    Positioned(
                      bottom: 5.h,
                      left: 35.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // model.cameraOpen == false
                          // InkWell(
                          //   onTap: () {
                          //     model.cameraOpen = !model.cameraOpen;
                          //     model.cameraOpen1 = !model.cameraOpen1;
                          //     model.onCamera();
                          //     model.notifyListeners();
                          //   },
                          //   child: Container(
                          //       width: 13.w,
                          //       height: 8.h,
                          //       decoration: BoxDecoration(
                          //           color: ColorUtils.white,
                          //           shape: BoxShape.circle),
                          //       child: model.cameraOpen == false
                          //           ? Image.asset(
                          //               ImageUtils.camera1,
                          //               color: ColorUtils.black,
                          //             )
                          //           : Icon(Icons.camera_alt)),
                          // ),
                          // SizedBox(
                          //   width: 4.w,
                          // ),
                          // InkWell(
                          //   onTap: () {
                          //     model.switchCamera();
                          //   },
                          //   child: Container(
                          //       width: 13.w,
                          //       height: 8.h,
                          //       decoration: BoxDecoration(
                          //           color: ColorUtils.white,
                          //           shape: BoxShape.circle),
                          //       child: Icon(Icons.switch_camera_outlined)),
                          // ),
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
                          //         child: )),
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