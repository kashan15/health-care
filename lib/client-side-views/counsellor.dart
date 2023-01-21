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

class Counsellor extends StatefulWidget {
  const Counsellor({Key? key}) : super(key: key);

  @override
  _CounsellorState createState() => _CounsellorState();
}

class _CounsellorState extends State<Counsellor> {
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
                backgroundColor: Colors.white,
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
                        // "Select preferred counsellor gender",
                        AppLocalizations.of(context)!.translate('prefered_lang_text_1')!,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.montserratBold,
                            fontSize: 3.t),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            model.selectedCounsellor = 1;
                          });
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(6),
                          elevation: model.selectedCounsellor == 1 ? 10 : 0,
                          shadowColor: ColorUtils.border.withOpacity(0.4),
                          child: Container(
                            width: 50.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: model.selectedCounsellor == 1
                                        ? ColorUtils.purple
                                        : ColorUtils.border),
                                borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SvgPicture.asset(ImageUtils.male,color: model.selectedCounsellor== 1 ? ColorUtils.purple : ColorUtils.black),
                                // SizedBox(width: 3.w,),
                                Text(
                                  AppLocalizations.of(context)!.translate('select_your_gender_text_2')!,
                                  style: TextStyle(
                                      color: model.selectedCounsellor == 1
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
                          setState(() {
                            model.selectedCounsellor = 2;
                          });
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(6),
                          elevation: model.selectedCounsellor == 2 ? 10 : 0,
                          shadowColor: ColorUtils.border.withOpacity(0.4),
                          child: Container(
                            width: 50.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: model.selectedCounsellor == 2
                                        ? ColorUtils.purple
                                        : ColorUtils.border),
                                borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SvgPicture.asset(ImageUtils.female,color: model.selectedCounsellor== 2 ? ColorUtils.purple : ColorUtils.black),
                                // SizedBox(width: 3.w,),
                                Text(
                               AppLocalizations.of(context)!.translate('select_your_gender_text_3')!,

                                  style: TextStyle(
                                      color: model.selectedCounsellor == 2
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
                          model.selectedCounsellor = 3;
                          model.notifyListeners();
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(6),
                          elevation: model.selectedCounsellor == 3 ? 10 : 0,
                          shadowColor: ColorUtils.border.withOpacity(0.4),
                          child: Container(
                              width: 50.w,
                              height: 6.h,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: model.selectedCounsellor == 3
                                          ? ColorUtils.purple
                                          : ColorUtils.border),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Center(
                                  child: Text(
                                AppLocalizations.of(context)!.translate('counsellor_lang_text_2')!,
                                style: TextStyle(
                                    color: model.selectedCounsellor == 3
                                        ? ColorUtils.purple
                                        : ColorUtils.black,
                                    fontFamily: FontUtils.montserratMedium,
                                    fontSize: 2.t),
                                textAlign: TextAlign.center,
                              ))),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      InkWell(
                          onTap: () {
                            model.therapistGender();
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
