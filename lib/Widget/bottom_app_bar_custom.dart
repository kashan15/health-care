import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:soulgood/Widget/bottom_app_bar.dart';
import 'package:soulgood/client-side-views/after_subs_chat.dart';
import 'package:soulgood/client-side-views/bottom_app_book_session.dart';
import 'package:soulgood/client-side-views/chats.dart';
import 'package:soulgood/client-side-views/home.dart';
import 'package:soulgood/client-side-views/main_chat.dart';
import 'package:soulgood/client-side-views/profile.dart';
import 'package:soulgood/common/index.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:stacked/stacked.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../app/locator.dart';
import '../utils/app_localization.dart';
import '../viewModels/main_view_model.dart';

class BottomAppBarCustom extends StatefulWidget {
  const BottomAppBarCustom({Key? key}) : super(key: key);

  @override
  _BottomAppBarCustomState createState() => _BottomAppBarCustomState();
}

class _BottomAppBarCustomState extends State<BottomAppBarCustom> {
  int currentTab = 0;
  Widget currentScreen = Home();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => locator<MainViewModel>(),
        disposeViewModel: false,
        onModelReady: (model) async {
          // var data = {"patientId": "72623b02-2379-45e1-a77a-4019ea1cb707", "therapistId": "7fcfdfc8-ab79-408a-bda3-2e791cb90703", "appointmentId": 193};
          // print(data);
          // if(model.userId == data['patientId']){
          //   if (model.upcomingSession.where((element) => element.id == data["appointmentId"]).isNotEmpty){
          //       model.appointment = model.upcomingSession.where((element) => element.id == data["appointmentId"]).first;
          //     }
          // }
          //jsonDecode(data.toString());
          model.socket =
              io('https://api.soulgoodhealth.com:5000', <String, dynamic>{
            'transports': ['websocket'],
            'autoConnect': false,
          });
          model.socket!.connect();
          model.socket!.onConnect((_) {
            print('connect');
            // model.socket!.emit('checkingResponse', 'test');
          });
          model.socket!.on('sessionCreated', (data) {
            print(data);

            HashMap map = HashMap();
            if (model.userId == data['patientId']) {
              if (model.upcomingSession
                  .where((element) => element.id == data["appointmentId"])
                  .isNotEmpty) {
                var index = model.upcomingSession.indexWhere(
                    (element) => element.id == data["appointmentId"]);
                if (index != -1) {
                  model.upcomingSession[index].isEnabled = 1;
                  model.getPatientAppointments();
                  model.notifyListeners();
                }
              }
            }
          });
          model.socket!.onDisconnect((_) => print('disconnect'));
          model.socket!.on('fromServer', (_) => print(_));
        },
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: ColorUtils.white,
              body: PageStorage(
                  bucket: PageStorageBucket(), child: currentScreen),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ColorUtils.greyLight.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 10,
                    )
                  ],
                ),
                child: BottomAppBar(
                  color: Colors.white,
                  child: Container(
                    height: 8.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          minWidth: 50,
                          onPressed: () {
                            setState(() {
                              currentScreen = Home();
                              currentTab = 0;
                            });
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              SvgPicture.asset(
                                ImageUtils.home,
                                color: currentTab == 0
                                    ? ColorUtils.purple
                                    : ColorUtils.black,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                AppLocalizations.of(context)!
                                    .translate('user_db_sidebar_text_13')!,
                                style: TextStyle(
                                    color: currentTab == 0
                                        ? ColorUtils.purple
                                        : ColorUtils.black),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 60,
                          onPressed: () {
                            setState(() {
                              currentScreen = BottomAppBookSession();
                              currentTab = 1;
                            });
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              SvgPicture.asset(
                                ImageUtils.appointment,
                                color: currentTab == 1
                                    ? ColorUtils.purple
                                    : ColorUtils.black,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                AppLocalizations.of(context)!
                                    .translate('user_db_sidebar_text_16')!,
                                style: TextStyle(
                                    color: currentTab == 1
                                        ? ColorUtils.purple
                                        : ColorUtils.black),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 60,
                          onPressed: () {
                            setState(() {
                              currentScreen = ChatScreenForBottom();
                              currentTab = 2;
                            });
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              SvgPicture.asset(
                                ImageUtils.chat,
                                color: currentTab == 2
                                    ? ColorUtils.purple
                                    : ColorUtils.black,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                AppLocalizations.of(context)!
                                    .translate('user_db_sidebar_text_1')!,
                                style: TextStyle(
                                    color: currentTab == 2
                                        ? ColorUtils.purple
                                        : ColorUtils.black),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 60,
                          onPressed: () {
                            setState(() {
                              currentScreen = Profile();
                              currentTab = 3;
                            });
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              SvgPicture.asset(
                                ImageUtils.profile,
                                color: currentTab == 3
                                    ? ColorUtils.purple
                                    : ColorUtils.black,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                AppLocalizations.of(context)!
                                    .translate('user_db_sidebar_text_15')!,
                                style: TextStyle(
                                    color: currentTab == 3
                                        ? ColorUtils.purple
                                        : ColorUtils.black),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              //   Container(
              // decoration: BoxDecoration(
              //   boxShadow: [
              //     BoxShadow(
              //       color: ColorUtils.greyLight.withOpacity(0.5),
              //       spreadRadius: 10,
              //       blurRadius: 10,
              //     )
              //   ],
              // ),
              // child: BottomNavigationBar(items: [
              // SvgPicture.asset(
              //       ImageUtils.home,
              //       color: selectedBottomApp == 0
              //           ? ColorUtils.purple
              //           : ColorUtils.black,
              //     ),
              //     label: 'Home',
              // ),
              // ]),
              // )
              );
        });
  }
}
