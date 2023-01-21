import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dialog_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class Suicidal extends StatefulWidget {
  const Suicidal({Key? key}) : super(key: key);

  @override
  _SuicidalState createState() => _SuicidalState();
}

class _SuicidalState extends State<Suicidal> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
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
                body: SingleChildScrollView(
                    child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.horizontalPadding),
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
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: ColorUtils.black,
                                size: 4.i,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        AppLocalizations.of(context)!.translate('sucidal_idea_text_2')!,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.montserratBold,
                            fontSize: 3.5.t,
                            height: 0.19.h),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          model.selectedSuicidal = 1;
                          model.selectedSuicidalIdea = true;
                          model.selectedSuicidalHelp = false;
                          model.notifyListeners();
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(6),
                          elevation: model.selectedSuicidal == 1 ? 10 : 0,
                          shadowColor: ColorUtils.border.withOpacity(0.4),
                          child: Container(
                            width: 50.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: model.selectedSuicidal == 1
                                        ? ColorUtils.purple
                                        : ColorUtils.border),
                                borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.translate('other_text_23')!,
                                  style: TextStyle(
                                      color: model.selectedSuicidal == 1
                                          ? ColorUtils.purple
                                          : ColorUtils.black,
                                      fontFamily: FontUtils.montserratMedium,
                                      fontSize: 2.t),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      GestureDetector(
                        onTap: () {
                          model.selectedSuicidal = 2;
                          model.selectedSuicidalIdea = false;
                          model.selectedSuicidalHelp = true;
                          model.notifyListeners();
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(6),
                          shadowColor: ColorUtils.border.withOpacity(0.4),
                          elevation: model.selectedSuicidal == 2 ? 10 : 0,
                          child: Container(
                            width: 50.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: model.selectedSuicidal == 2
                                        ? ColorUtils.purple
                                        : ColorUtils.border),
                                borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.translate('other_text_24')!,
                                  style: TextStyle(
                                      color: model.selectedSuicidal == 2
                                          ? ColorUtils.purple
                                          : ColorUtils.black,
                                      fontFamily: FontUtils.montserratMedium,
                                      fontSize: 2.t),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7.5.h,
                      ),
                      InkWell(
                          onTap: () {
                            model.check();
                          },
                          child: Button(AppLocalizations.of(context)!.translate('other_text_14')!,15)),
                    ],
                  ),
                )),
              )),
        );
      },
    );
  }
}
