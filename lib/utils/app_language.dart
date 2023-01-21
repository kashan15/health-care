import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulgood/Widget/bottom_app_bar.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class AppLanguage extends BaseViewModel {
  Locale? appLocale;
  SharedPreferences? prefs;

  Locale get appLocal => appLocale ?? Locale("en");
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('selectedAppLanguage') == null) {
      appLocale = Locale('en');
      print(appLocale);
      //return appLocale;
    } else {
      appLocale = prefs.getInt('selectedAppLanguage') == 1
          ? Locale('zh')
          : Locale('en');
      prefs.getInt('selectedAppLanguage') == 1
          ? model.selectedAppLanguage = 1
          : model.selectedAppLanguage = 0;
      print(appLocale);
      print(model.selectedAppLanguage);
      notifyListeners();
    }

    //return appLocale;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    // if (_appLocale == type) {
    //   return;
    // }
    if (type == Locale("zh")) {
      appLocale = Locale("zh");
      await prefs.setString('language_code', 'zh');
      //await prefs.setString('countryCode', '');
    } else {
      appLocale = Locale("en");
      await prefs.setString('language_code', 'en');
      // await prefs.setString('countryCode');
    }
    notifyListeners();
  }
}
