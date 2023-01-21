import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:soulgood/Widget/journals_container.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/therapist-side-view/clients_journals.dart';
import 'package:soulgood/therapist-side-view/info.dart';
import 'package:soulgood/therapist-side-view/reports.dart';
import 'package:soulgood/therapist-side-view/session_history.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class TherapistChats extends StatefulWidget {
  String? client;
  String? id;
  TherapistChats({Key? key, this.client, this.id}) : super(key: key);

  @override
  _TherapistChatsState createState() => _TherapistChatsState();
}

class _TherapistChatsState extends State<TherapistChats> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        await model.getChatByUserForTherapist(widget.id);

        await model.createClient();
        await model.logInForTherapist();

        model.AllUserData1();
        model.notifyListeners();
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
                    horizontal: Dimensions.horizontalPadding,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.topMargin,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                model.navigateBack();
                                model.chats = [];
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 4.i,
                                color: ColorUtils.black,
                              )),
                          Text(
                            widget.client.toString(),
                            style: TextStyle(
                                fontSize: 2.8.t,
                                fontFamily: FontUtils.montserratSemiBold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        height: 6.h,
                        child: ScrollablePositionedList.separated(
                          itemScrollController: model.scrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: model.therapistChatUpperlist.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                await model.scrollController.scrollTo(
                                    index: index,
                                    duration: Duration(milliseconds: 150));
                                if (index == 0) {
                                  model.patientKiId = widget.id;
                                  model.AllUserData1();
                                  model.getUserPlanForTherapist();
                                  model.getUser();
                                  model.getTherapistNote();
                                  await model.getUserPlanForTherapistOFPatient(
                                      widget.id);
                                  await model
                                      .getUserCreditsForTherapistOfPAtient(
                                          widget.id);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Info()));
                                } else if (index == 1) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TherapistJournals(
                                                client: widget.client,
                                                id: widget.id,
                                              )));
                                } else if (index == 2) {
                                  model.patientKiId = widget.id;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TherapistReports()));
                                } else if (index == 3) {
                                  model.idForSessionHistory = widget.id;
                                  print(model.idForSessionHistory);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SessionHistory(
                                                Id: widget.id,
                                                name: widget.client,
                                              )));
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 2.w,
                                  right: 4.w,
                                ),
                                decoration: BoxDecoration(
                                    color: ColorUtils.purple,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 3.h,
                                      child: SvgPicture.asset(
                                          model.therapistChatUpperlist[index]
                                              ['image']),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(),
                                      child: Text(
                                        model.therapistChatUpperlist[index]
                                            ['name'],
                                        style: TextStyle(
                                            fontSize: 2.t,
                                            fontFamily:
                                                FontUtils.montserratRegular,
                                            color: ColorUtils.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            width: 2.w,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Divider(),
                      SizedBox(
                        height: 2.h,
                      ),
                      Expanded(
                        child: RefreshIndicator(
                          triggerMode: RefreshIndicatorTriggerMode.onEdge,
                          onRefresh: () {
                            model.counterForTherapist++;
                            return Future.delayed(Duration(milliseconds: 1000),
                                () {
                              model.getChatByUserOnRefresh();
                            });
                          },
                          child: ValueListenableBuilder(
                            valueListenable: model.logController,
                            builder:
                                (BuildContext context, log, Widget? child) {
                              return ListView.separated(
                                  shrinkWrap: true,
                                  controller: model.therapistChatController,
                                  physics: ScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Align(
                                          alignment:
                                              model.chats[index].sendBy != 0
                                                  ? Alignment.centerRight
                                                  : Alignment.centerLeft,
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                4.w, 2.h, 4.w, 2.h),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: ColorUtils.border
                                                      .withOpacity(0.2),
                                                ),
                                                borderRadius: model.chats[index]
                                                            .sendBy !=
                                                        0
                                                    ? const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10))
                                                    : BorderRadius.only(
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
                                              model.chats[index].sendBy != 0
                                                  ? Alignment.centerRight
                                                  : Alignment.centerLeft,
                                          child: Text(
                                            DateFormat('hh:mm a').format(
                                                DateTime.parse(model
                                                    .chats[index].createdAt!)),
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
                          // SizedBox(
                          //   width: 2.w,
                          // ),
                          Expanded(
                            // flex: 8,
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
                                      controller: model.therapistChat,
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
                                    onTap: model.therapistChat.text.length <= 0
                                        ? null
                                        : () {
                                            model.sendPeerMessageForTherapist(
                                                widget.id);
                                            model.saveMessageForTherapist(
                                                widget.id);
                                            model.therapistChat.clear();
                                            model.notifyListeners();
                                          },
                                    child: Container(
                                        padding: EdgeInsets.fromLTRB(
                                            5.w, 1.2.h, 5.5.w, 1.2.h),
                                        decoration: BoxDecoration(
                                            color: model.therapistChat.text
                                                        .length <=
                                                    0
                                                ? ColorUtils.greyLight
                                                : ColorUtils.purple,
                                            shape: BoxShape.circle),
                                        child: Center(
                                            child: SvgPicture.asset(
                                                ImageUtils.sendMsg))),
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
                        height: 3.h,
                      )
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
