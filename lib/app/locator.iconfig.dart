import 'package:get_it/get_it.dart';
import 'package:soulgood/utils/app_language.dart';
import 'package:soulgood/viewModels/authentication_view_model.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:soulgood/viewModels/navigation_view_model.dart';

Future<void> $initGetIt(GetIt g, {String? environment}) async {
  g.registerLazySingleton<NavigationViewModel>(() => NavigationViewModel());
  g.registerLazySingleton<AuthenticationViewModel>(
      () => AuthenticationViewModel());
  g.registerLazySingleton<MainViewModel>(() => MainViewModel());
  g.registerLazySingleton<AppLanguage>(() => AppLanguage());

  //g.registerLazySingleton<MainViewModel>(() => MainViewModel());
}

// Future<void> $initGetItAppLanguage(GetIt g, {String? environment}) async {
//   //g.registerLazySingleton<MainViewModel>(() => MainViewModel());
//   // g.registerLazySingleton<AppLanguage>(() => AppLanguage());
//   //g.registerLazySingleton<NavigationViewModel>(() => NavigationViewModel());
//   // PrefrencesViewModel prefrencesViewModel = PrefrencesViewModel();
//   // await prefrencesViewModel.getUserData();
//   //g.registerLazySingleton<PrefrencesViewModel>(() => prefrencesViewModel);
// }
