import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../utils/app_localization.dart';

class CustomerSupportChat extends StatefulWidget {
  String? id;
  CustomerSupportChat({Key? key, this.id}) : super(key: key);

  @override
  _CustomerSupportChatState createState() => _CustomerSupportChatState();
}

class _CustomerSupportChatState extends State<CustomerSupportChat> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        await model.createClient();
        await model.logIn(context);
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
                              model.counter = 1;
                              model.navigateBack();
                              model.notifyListeners();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: ColorUtils.black,
                              size: 4.i,
                            )),
                        // CircleAvatar(
                        //   backgroundColor: ColorUtils.blue,
                        //   foregroundImage: AssetImage(ImageUtils.chan),
                        // ),
                        // SizedBox(width: 2.w,),
                        SizedBox(
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: ColorUtils.blue,
                                foregroundImage: AssetImage(ImageUtils.support),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model.customerDetail!.name.toString(),
                                    style: TextStyle(
                                        fontFamily:
                                            FontUtils.montserratSemiBold,
                                        fontSize: 2.5.t),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  // Text(
                                  //   "Online",
                                  //   style: TextStyle(
                                  //       fontFamily: FontUtils.montserratMedium,
                                  //       fontSize: 1.5.t,
                                  //       color: ColorUtils.green),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Expanded(
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       InkWell(
                        //         onTap: (){
                        //           model.navigateToLiveVideo();
                        //         },
                        //         child: Container(
                        //             width: 13.w,
                        //             // height: 8.h,
                        //             padding: EdgeInsets.only(top: 0.5.h,bottom: 0.5.h),
                        //             decoration: BoxDecoration(
                        //                 color: ColorUtils.purple,
                        //                 shape: BoxShape.circle),
                        //             child: Icon(Icons.videocam,color: ColorUtils.white,)
                        //         ),
                        //       ),
                        //       InkWell(
                        //         onTap: (){
                        //         },
                        //         child: Container(
                        //             width: 13.w,
                        //             // height: 8.h,
                        //             padding: EdgeInsets.only(top: 0.5.h,bottom: 0.5.h),
                        //             decoration: BoxDecoration(
                        //                 color: ColorUtils.purple,
                        //                 shape: BoxShape.circle),
                        //             child: Icon(Icons.call,color: ColorUtils.white,)
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Column(
                      children: [
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Text("Welcome to Soulgood",style: TextStyle(fontFamily: FontUtils.montserratBold,color: ColorUtils.purple,fontSize: 2.5.t)),
                        //       ],
                        //     ),
                        //     Divider(indent: 36.w,endIndent: 35.w,color: ColorUtils.purple,thickness: 2,),
                        //     SizedBox(height: 10.h,),
                        //     Divider(indent: 3.w,endIndent: 3.w,thickness: 1,color: ColorUtils.border,),
                        //     SizedBox(height: 2.h,),
                        //     Text("Please choose a subscription plan to begin \nchat",style: TextStyle(fontFamily: FontUtils.montserratMedium,fontSize: 2.2.t),textAlign: TextAlign.center,),
                        //     SizedBox(height: 2.h,),
                        //     Divider(indent: 3.w,endIndent: 3.w,thickness: 1,color: ColorUtils.border,),
                        //     SizedBox(height: 4.h,),
                        //
                        //
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
                                .translate('user_db_therapist_chat_text_15')!,
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
                        SizedBox(
                          height: 1.h,
                        ),
                        Divider(
                          indent: 3.w,
                          endIndent: 3.w,
                          thickness: 1,
                          color: ColorUtils.border,
                        ),
                      ],
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        triggerMode: RefreshIndicatorTriggerMode.onEdge,
                        child: ValueListenableBuilder(
                          valueListenable: model.logController,
                          builder: (BuildContext context, log, Widget? child) {
                            return ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                controller: model.CustomerSuppChatScroll,
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
                                                  model.chats[index].sendBy != 1
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
                                                          Radius.circular(10))),
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
                                              .convertTimeToHonKong(
                                                  model.chats[index].createdAt!)
                                              .toString(),
                                          // DateFormat('hh:mm a').format(
                                          //     DateTime.parse(model
                                          //         .chats[index].createdAt!)),
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
                        // InkWell(
                        //   onTap: () {},
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
                                // SizedBox(
                                //   width: 5.w,
                                // ),
                                Expanded(
                                  child: TextFormField(
                                    maxLines: 1,
                                    controller: model.customerSupportChat,
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
                                  onTap: () {
                                    model.sendPeerMessage();
                                    model.saveMessageOfCustomer(widget.id);
                                    model.customerSupportChat.clear();
                                  },
                                  child: Container(
                                      padding: EdgeInsets.fromLTRB(
                                          5.w, 1.2.h, 5.w, 1.2.h),
                                      decoration: BoxDecoration(
                                          color: ColorUtils.purple,
                                          shape: BoxShape.circle),
                                      child:
                                          SvgPicture.asset(ImageUtils.sendMsg)),
                                )
                              ],
                            ),
                          ),
                        ),
                        // Icon(
                        //   Icons.mic,
                        //   color: ColorUtils.purple,
                        // )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
