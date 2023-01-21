import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:soulgood/models/paid_clients_list.dart';
import 'package:soulgood/therapist-side-view/chats.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

import 'models.dart';

class Utils {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  static void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 2),
      ),
    );
  }

  static Widget getSusItem(BuildContext context, String tag,
      {double susHeight = 40}) {
    if (tag == '★') {
      tag = '★ 热门城市';
    }
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16.0),
      color: Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$tag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF666666),
        ),
      ),
    );
  }

  static Widget getListItem(BuildContext context, CityModel model,
      {double susHeight = 40}) {
    return ListTile(
      title: Text(model.name),
      onTap: () {
        LogUtil.e("onItemClick : $model");
        Utils.showSnackBar(context, 'onItemClick : ${model.name}');
      },
    );
//    return Column(
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        Offstage(
//          offstage: !(model.isShowSuspension == true),
//          child: getSusItem(context, model.getSuspensionTag(),
//              susHeight: susHeight),
//        ),
//        ListTile(
//          title: Text(model.name),
//          onTap: () {
//            LogUtil.e("onItemClick : $model");
//            Utils.showSnackBar(context, 'onItemClick : ${model.name}');
//          },
//        )
//      ],
//    );
  }

  static Widget getWeChatListItem(
    BuildContext context,
    MainViewModel m,
    PaidClientsList model, {
    double susHeight = 40,
    Color? defHeaderBgColor,
  }) {
    return getWeChatItem(context, m, model, defHeaderBgColor: defHeaderBgColor);
//    return Column(
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        Offstage(
//          offstage: !(model.isShowSuspension == true),
//          child: getSusItem(context, model.getSuspensionTag(),
//              susHeight: susHeight),
//        ),
//        getWeChatItem(context, model, defHeaderBgColor: defHeaderBgColor),
//      ],
//    );
  }

  static Widget getWeChatItem(
    BuildContext context,
    MainViewModel m,
    PaidClientsList model, {
    Color? defHeaderBgColor,
  }) {
    DecorationImage? image;
//    if (model.img != null && model.img.isNotEmpty) {
//      image = DecorationImage(
//        image: CachedNetworkImageProvider(model.img),
//        fit: BoxFit.contain,
//      );
//    }
    return ListTile(
      contentPadding: EdgeInsets.zero,
      selectedTileColor: ColorUtils.purplelight,
      // leading: model.iconData == null
      //     ? null
      //     : Icon(
      //         model.iconData,
      //         color: Colors.white,
      //         size: 20,
      //       ),
      title: Text(model.name!),
      onTap: () async {

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TherapistChats(client: model.name, id: model.patient_id)));
      },
    );
  }
}

class LogUtil {
  static const String _defTag = 'common_utils';
  static bool _debugMode = false; //是否是debug模式,true: log v 不输出.
  static int _maxLen = 128;
  static String _tagValue = _defTag;

  static void init({
    String tag = _defTag,
    bool isDebug = false,
    int maxLen = 128,
  }) {
    _tagValue = tag;
    _debugMode = isDebug;
    _maxLen = maxLen;
  }

  static void d(Object? object, {String? tag}) {
    if (_debugMode) {
      log('$tag d | ${object?.toString()}');
    }
  }

  static void e(Object? object, {String? tag}) {
    _printLog(tag, ' e ', object);
  }

  static void v(Object? object, {String? tag}) {
    if (_debugMode) {
      _printLog(tag, ' v ', object);
    }
  }

  static void _printLog(String? tag, String stag, Object? object) {
    String da = object?.toString() ?? 'null';
    tag = tag ?? _tagValue;
    if (da.length <= _maxLen) {
      print('$tag$stag $da');
      return;
    }
    print(
        '$tag$stag — — — — — — — — — — — — — — — — st — — — — — — — — — — — — — — — —');
    while (da.isNotEmpty) {
      if (da.length > _maxLen) {
        print('$tag$stag| ${da.substring(0, _maxLen)}');
        da = da.substring(_maxLen, da.length);
      } else {
        print('$tag$stag| $da');
        da = '';
      }
    }
    print(
        '$tag$stag — — — — — — — — — — — — — — — — ed — — — — — — — — — — — — — — — —');
  }
}
