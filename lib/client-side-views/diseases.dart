import 'package:flutter/material.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class Disease extends StatefulWidget {
  const Disease({Key? key}) : super(key: key);

  @override
  _DiseaseState createState() => _DiseaseState();
}

class _DiseaseState extends State<Disease> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.Diseases();
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
                        AppLocalizations.of(context)!.translate('mental_problems_text_3')!,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.montserratBold,
                            fontSize: 3.2.t),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        // "You can select multiple",
                        AppLocalizations.of(context)!.translate('mental_problems_text_2')!,
                        style: TextStyle(
                            color: ColorUtils.border,
                            fontFamily: FontUtils.montserratMedium,
                            fontSize: 2.t),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        width: 60.w,
                        height: 35.h,
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemCount: model.problems.length,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 3.h,
                              );
                            },
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  if (model.selectedDiseases
                                      .contains(model.problems[index].Id)) {
                                    model.selectedDiseases
                                        .remove(model.problems[index].Id);
                                  } else {
                                    model.selectedDiseases
                                        .add(model.problems[index].Id);
                                  }
                                  model.notifyListeners();
        
                                  // if(model.added == true){
                                  //   model.selectedDiseases.remove(index);
                                  //   model.notifyListeners();
                                  // }
                                },
                                child: Material(
                                  //elevation: model.selectedDisease== 4 ? 10 : 0,
                                  elevation: model.selectedDiseases
                                          .contains(model.problems[index].Id)
                                      ? 10
                                      : 0,
                                  shadowColor: ColorUtils.border.withOpacity(0.4),
        
                                  child: Container(
                                      width: 50.w,
                                      height: 6.h,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: model.selectedDiseases
                                                      .contains(model
                                                          .problems[index].Id)
                                                  ? ColorUtils.purple
                                                  : ColorUtils.border),
                                          borderRadius: BorderRadius.circular(6)),
                                      child: Center(
                                          child: Text(model.selectedAppLanguage != 1 ?
                                        model.problems[index].problemName : model.problems[index].problemNameInChinese,
                                        style: TextStyle(
                                            color: model.selectedDiseases
                                                    .contains(
                                                        model.problems[index].Id)
                                                ? ColorUtils.purple
                                                : ColorUtils.black,
                                            fontFamily:
                                                FontUtils.montserratMedium,
                                            fontSize: 2.t),
                                        textAlign: TextAlign.center,
                                      ))),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      InkWell(
                        onTap: () {
                          // model.navigateToCounsellorLang();\
                          model.sendingDiseases();
                        },
                        child: Button(AppLocalizations.of(context)!.translate('other_text_14')!,15),
                      ),
                    ],
                  ),
                )),
              )),
        );
      },
    );
  }
}
