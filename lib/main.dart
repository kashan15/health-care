// import 'dart:_http';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
// import 'package:flutter_cupertino_localizations/flutter_cupertino_localizations.dart'
//     as prefix;
import 'package:localization/localization.dart';
import 'package:soulgood/client-side-views/extra_information_start.dart';
import 'package:soulgood/client-side-views/selection_of_country_and_language.dart';
import 'package:soulgood/forgetpasss/encripted.dart';
import 'package:soulgood/forgetpasss/otp.dart';
import 'package:soulgood/forgetpasss/verify_email.dart';
import 'package:soulgood/splash.dart';
import 'package:soulgood/utils/app_language.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/screen_utils.dart';
import 'package:soulgood/utils/size_config.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:soulgood/viewModels/navigation_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:timezone/timezone.dart';
import 'app/locator.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:localization/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

NavigationViewModel navigationViewModel = NavigationViewModel();

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configure();
  HttpOverrides.global = MyHttpOverrides();

  // LocalJsonLocalization.delegate.directories = ['i18n'];
  runApp(Phoenix(
    child: ViewModelBuilder<AppLanguage>.reactive(
      builder: (context, model, child) {
        return MaterialApp(
          locale: model.appLocale,
          navigatorKey: StackedService.navigatorKey,
          debugShowCheckedModeBanner: false,
          localeListResolutionCallback: (locales, supportedLocales) {
            for (Locale locale in locales!) {
              // if device language is supported by the app,
              // just return it to set it as current app language
              if (supportedLocales.contains(locale)) {
                return locale;
              }
            }
            // if device language is not supported by the app,
            // the app will set it to english but return this to set to Bahasa instead
            return Locale('en');
          },
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale('en', ''), Locale('zh' '')],
          theme: ThemeData(
              pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
          })),
          home: MyApp(),
        );
      },
      viewModelBuilder: () => locator<AppLanguage>(),
      onModelReady: (model) async {
        //AppLanguage appLanguage = AppLanguage();
        await model.fetchLocale();
      },
      disposeViewModel: false,
    ),
  ));
  ErrorWidget.builder = (details) {
    return Material(
      child: Container(
          color: Colors.indigoAccent,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Center(
                child: Text(
              details.exceptionAsString(),
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            )),
          )),
    );
  };
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.getInstance()..init(context);
    initializeDateFormatting('az');

    /*ScreenUtil.instance = ScreenUtil(
        width: MediaQuery.of(context).size.width.round(),
        height: MediaQuery.of(context).size.height.round(),
        allowFontScaling: true);*/
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            //var prefService = locator<PrefrencesViewModel>();
            //return MainView(index: 2);
            return Splash();
          },
        );
      },
    );
  }
}
