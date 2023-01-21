import 'dart:convert';
import 'package:lpinyin/lpinyin.dart';
import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/common/models.dart';
import 'package:soulgood/common/utils.dart';
import 'package:soulgood/models/paid_clients_list.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<ContactInfo> contactList = [];
  List<ContactInfo> topList = [];

  @override
  void initState() {
    super.initState();
    // topList.add(ContactInfo(
    //     name: '新的朋友',
    //     tagIndex: '↑',
    //     bgColor: Colors.orange,
    //     iconData: Icons.person_add));
    // topList.add(ContactInfo(
    //     name: '群聊',
    //     tagIndex: '↑',
    //     bgColor: Colors.green,
    //     iconData: Icons.people));
    // topList.add(ContactInfo(
    //     name: '标签',
    //     tagIndex: '↑',
    //     bgColor: Colors.blue,
    //     iconData: Icons.local_offer));
    // topList.add(ContactInfo(
    //     name: '公众号',
    //     tagIndex: '↑',
    //     bgColor: Colors.blueAccent,
    //     iconData: Icons.person));
    loadData();
  }

  void loadData() async {
    //加载联系人列表
    rootBundle.loadString('assets/data/car_models.json').then((value) {
      List list = json.decode(value);
      list.forEach((v) {
        contactList.add(ContactInfo.fromJson(v));
      });
      _handleList(contactList);
    });
  }

  void _handleList(List<ContactInfo> list) {
    if (list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(contactList);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(contactList);

    // add topList.
    contactList.insertAll(0, topList);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => locator<MainViewModel>(),
        disposeViewModel: false,
        onModelReady: (model) async {
          // model.isEmailInFocus = false;
          // model.isPasswordInFocus = false;
          // model.lemail.clear();
          // model.lpassword.clear();
          // model.sharedPreferences = await SharedPreferences.getInstance();
          model.getpaidTherapist();
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
                  appBar: AppBar(
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    backgroundColor: ColorUtils.white,
                    title: Text(
                      'Clients',
                      style: TextStyle(color: Color(0xFF171717)),
                    ),
                  ),
                  body: AzListView(
                    data: model.paidClientsList,
                    itemCount: model.paidClientsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      PaidClientsList paidClient = model.paidClientsList[index];
                      if (index == 0) {
                        return Container(
                          margin: EdgeInsets.only(top: 4.h, left: 4.w),
                          child: Utils.getWeChatListItem(
                            context,
                            MainViewModel(),
                            paidClient,
                            defHeaderBgColor: Color(0xFFE5E5E5),
                          ),
                        );
                      } else {
                        return Container(
                          margin: EdgeInsets.only(left: 4.w),
                          child: Utils.getWeChatListItem(
                            context,
                            MainViewModel(),
                            paidClient,
                            defHeaderBgColor: Color(0xFFE5E5E5),
                          ),
                        );
                      }
                    },
                    physics: BouncingScrollPhysics(),
                    susItemBuilder: (BuildContext context, int index) {
                      PaidClientsList paidClient = model.paidClientsList[index];
                      if ('↑' == paidClient.getSuspensionTag()) {
                        return Container();
                      }
                      return Utils.getSusItem(
                          context, paidClient.getSuspensionTag());
                    },
                    indexBarData: ['↑', '☆', ...kIndexBarData],
                    indexBarOptions: IndexBarOptions(
                      needRebuild: true,
                      ignoreDragCancel: true,
                      downTextStyle:
                          TextStyle(fontSize: 12, color: Colors.white),
                      downItemDecoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                      indexHintWidth: 120 / 2,
                      indexHintHeight: 100 / 2,
                      // indexHintDecoration: BoxDecoration(
                      //   image: DecorationImage(
                      //     image: AssetImage(
                      //         Utils.getImgPath('ic_index_bar_bubble_gray')),
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      indexHintAlignment: Alignment.centerRight,
                      indexHintChildAlignment: Alignment(-0.25, 0.0),
                      indexHintOffset: Offset(-20, 0),
                    ),
                  ),
                ),
              ));
        });
  }
}
