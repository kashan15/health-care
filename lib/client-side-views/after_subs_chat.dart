import 'package:agora_rtm/agora_rtm.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soulgood/Widget/flutter_sound.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/client-side-views/log.dart';
import 'package:soulgood/client-side-views/threpist_details.dart';
import 'package:soulgood/common/index.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';
import '../utils/constants.dart';

class AfterSubsChats extends StatefulWidget {
  final LogController? logController;
  final AgoraRtmChannel? channel;
  final AgoraRtmClient? client;
  String? id;
  AfterSubsChats({
    Key? key,
    this.logController,
    this.channel,
    this.client,
    this.id,
  }) : super(key: key);

  @override
  _AfterSubsChatsState createState() => _AfterSubsChatsState();
}

class _AfterSubsChatsState extends State<AfterSubsChats> {
  // final recorder = SoundRecorder();

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   recorder.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // final isRecording = recorder.isRecording;

    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        await model.createClient();
        await model.logIn(context);
        model.isUserOnline(widget.id);
        // recorder.init();
        // await model.joinChannel(context);
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
                                model.counter = 1;
                                model.notifyListeners();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: ColorUtils.black,
                                size: 4.i,
                              )),
                          model.therapistDetail!.image!.isEmpty
                              ? CircleAvatar(
                                  backgroundColor: ColorUtils.blue,
                                  foregroundImage:
                                      AssetImage(ImageUtils.support),
                                )
                              : CircleAvatar(
                                  backgroundColor: ColorUtils.blue,
                                  foregroundImage: NetworkImage(
                                      'https://api.soulgoodhealth.com:5000' +
                                          Constants.blogImage +
                                          model.therapistDetail!.image
                                              .toString()),
                                ),
                          SizedBox(
                            width: 2.w,
                          ),
                          InkWell(
                            onTap: () {
                              model.navigation_Service
                                  .navigateTo(to: ThrepistDetails());
                            },
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model.therapistDetail!.name.toString(),
                                    style: TextStyle(
                                        fontFamily:
                                            FontUtils.montserratSemiBold,
                                        fontSize: 2.5.t),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  // Text(
                                  //   model.isOnline != true
                                  //       ? "Offline"
                                  //       : "Online",
                                  //   style: TextStyle(
                                  //       fontFamily: FontUtils.montserratMedium,
                                  //       fontSize: 1.5.t,
                                  //       color: model.isOnline != true
                                  //           ? ColorUtils.grey
                                  //           : ColorUtils.green),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Divider(
                        indent: 3.w,
                        endIndent: 3.w,
                        thickness: 1,
                        color: ColorUtils.border,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Center(
                        child: Text(
                          AppLocalizations.of(context)!
                              .translate('user_db_therapist_chat_text_14')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratMedium,
                              color: ColorUtils.black,
                              fontSize: 2.t),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Center(
                        child: Text(
                          AppLocalizations.of(context)!
                              .translate('user_db_therapist_chat_text_16')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratMedium,
                              color: ColorUtils.black,
                              fontSize: 2.t),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // Divider(
                      //   indent: 36.w,
                      //   endIndent: 35.w,
                      //   color: ColorUtils.purple,
                      //   thickness: 2,
                      // ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Divider(
                        indent: 3.w,
                        endIndent: 3.w,
                        thickness: 1,
                        color: ColorUtils.border,
                      ),
                      Expanded(
                        child: RefreshIndicator(
                          triggerMode: RefreshIndicatorTriggerMode.onEdge,
                          child: ValueListenableBuilder(
                            valueListenable: widget.logController!,
                            builder:
                                (BuildContext context, log, Widget? child) {
                              return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  controller: model.afterSubChatScroll,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Align(
                                          alignment:
                                              model.chats[index].sendBy != 1
                                                  ? Alignment.centerRight
                                                  : Alignment.centerLeft,
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                4.w, 2.h, 4.w, 2.h),
                                            decoration: BoxDecoration(
                                                color:
                                                    model.chats[index].sendBy !=
                                                            1
                                                        ? ColorUtils.baby
                                                        : ColorUtils.white,
                                                border: Border.all(
                                                  color: ColorUtils.border
                                                      .withOpacity(0.2),
                                                ),
                                                borderRadius: model.chats[index]
                                                            .sendBy !=
                                                        1
                                                    ? const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10))
                                                    : const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10))),
                                            child: Text(
                                                model.chats[index].data
                                                    .toString(),
                                                style: TextStyle(
                                                    fontFamily: FontUtils
                                                        .montserratRegular)),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              model.chats[index].sendBy != 1
                                                  ? Alignment.centerRight
                                                  : Alignment.centerLeft,
                                          child: Text(
                                            model
                                                .convertTimeToHonKong(model
                                                    .chats[index].createdAt!)
                                                .toString(),
                                            style: TextStyle(
                                                color: ColorUtils.border),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        )
                                      ],
                                    );
                                  },
                                  separatorBuilder: (BuildContext context, i) {
                                    return SizedBox(
                                      height: 4.h,
                                    );
                                  },
                                  itemCount: model.chats.length);
                            },
                          ),
                          onRefresh: () {
                            model.counter++;
                            return Future.delayed(Duration(milliseconds: 1000),
                                () {
                              model.getChatByUserOnRefresh();
                            });
                          },
                        ),
                      ),
                      Row(
                        children: [
                          // CustomPopupMenu(
                          //     child: Container(
                          //       decoration: BoxDecoration(
                          //           shape: BoxShape.circle,
                          //           border:
                          //               Border.all(color: ColorUtils.purple)),
                          //       child: Icon(
                          //         Icons.add,
                          //         color: ColorUtils.purple,
                          //         size: 6.i,
                          //       ),
                          //     ),
                          //     menuBuilder: () {
                          //       return Container(
                          //         padding: EdgeInsets.symmetric(
                          //             vertical: 2.h, horizontal: 5.w),
                          //         decoration: BoxDecoration(
                          //             shape: BoxShape.rectangle,
                          //             color: Colors.white,
                          //             borderRadius: BorderRadius.circular(10)),
                          //         child: Column(children: [
                          //           InkWell(
                          //             onTap: () {},
                          //             child: Row(
                          //               mainAxisSize: MainAxisSize.min,
                          //               children: [
                          //                 Icon(Icons.photo_camera_outlined),
                          //                 SizedBox(
                          //                   width: 2.w,
                          //                 ),
                          //                 Text("Open Camera"),
                          //               ],
                          //             ),
                          //           ),
                          //           SizedBox(
                          //             height: 2.h,
                          //           ),
                          //           InkWell(
                          //             onTap: () {
                          //               // model.getImage();
                          //             },
                          //             child: Row(
                          //               mainAxisSize: MainAxisSize.min,
                          //               children: [
                          //                 Icon(Icons.attachment_sharp),
                          //                 SizedBox(
                          //                   width: 2.w,
                          //                 ),
                          //                 Text("Attachments"),
                          //               ],
                          //             ),
                          //           ),
                          //         ]),
                          //       );
                          //     },
                          //     pressType: PressType.singleClick),
                          //
                          //
                          // InkWell(
                          //   onTap: () {

                          //     // model.getImage();
                          //   },
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         border: Border.all(color: ColorUtils.purple)),
                          //     child: Icon(
                          //       Icons.add,
                          //       color: ColorUtils.purple,
                          //       size: 6.i,
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: ColorUtils.purple),
                                  borderRadius: BorderRadius.circular(10)),
                              // padding: EdgeInsets.symmetric(horizontal: 0.5.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      onChanged: (value) {
                                        model.notifyListeners();
                                      },
                                      controller: model.afterSubChat,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                          fontSize: 2.t,
                                          fontFamily:
                                              FontUtils.montserratRegular),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: model.afterSubChat.text.length <= 0
                                        ? null
                                        : () {
                                            model.sendPeerMessage();
                                            model.saveMessage(widget.id);
// model.afterSubChat.animateTo(model.afterSubChat.position.maxScrollExtent, duration: Duration(seconds: 2), curve: Curves.easeIn);

                                            model.afterSubChat.clear();
                                            model.notifyListeners();
                                          },
                                    child: Container(
                                        padding: EdgeInsets.fromLTRB(
                                            5.w, 1.2.h, 5.5.w, 1.2.h),
                                        decoration: BoxDecoration(
                                            color: model.afterSubChat.text
                                                        .length <=
                                                    0
                                                ? ColorUtils.greyLight
                                                : ColorUtils.purple,
                                            shape: BoxShape.circle),
                                        child: SvgPicture.asset(
                                            ImageUtils.sendMsg)),
                                  )
                                ],
                              ),
                            ),
                          ),
                          // InkWell(
                          //     onTap: () async {
                          //       final isRecording =
                          //           await recorder.toggleRecording();
                          //     },
                          //     child: Icon(isRecording ? Icons.stop : Icons.mic,
                          //         color: isRecording
                          //             ? ColorUtils.text_red
                          //             : ColorUtils.purple))
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      )
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }

  // Widget buildStart() {
  //   final icon = isRecording ? Icons.stop : Icons.mic;
  //   final color = isRecording ? ColorUtils.text_red : ColorUtils.purple;
  //   return ;
  // }
}
