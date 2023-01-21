import 'package:dropdown_plus/dropdown_plus.dart';
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

class CounsellorLanguage extends StatefulWidget {
  const CounsellorLanguage({Key? key}) : super(key: key);

  @override
  _CounsellorLanguageState createState() => _CounsellorLanguageState();
}

class _CounsellorLanguageState extends State<CounsellorLanguage> {
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
                body: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.horizontalPadding),
                  child: SingleChildScrollView(
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
                          AppLocalizations.of(context)!
                              .translate('other_text_22')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratBold,
                              fontSize: 3.2.t),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .translate('other_text_22')!,
                              style: TextStyle(
                                  fontSize: 1.8.t,
                                  fontFamily: FontUtils.montserratMedium,
                                  color: ColorUtils.purple),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Material(
                          elevation: 10,
                          shadowColor: ColorUtils.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            // padding: EdgeInsets.all(20),
                            height: 8.h,
                            // width: 100.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorUtils.purple),
                                borderRadius: BorderRadius.circular(7)),
                            child: DropdownFormField<Map<String, dynamic>>(
                              onEmptyActionPressed: () async {},
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: ColorUtils.black,
                                ),
                              ),
                              onSaved: (dynamic str) {
                                //print("onSaved" + str);
                              },
                              onChanged: (dynamic str) {
                                //print("onChanged" + str);
                                model.selectedrole = str;
                              },
                              validator: (dynamic str) {},
                              findFn: (dynamic str) async => model.roles,
                              displayItemFn: (dynamic item) => Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Image.asset(
                                    (item ?? {})['image'] ??
                                        model.roles[0]["image"],
                                    scale: 5,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                    height: 20.h,
                                  ),
                                  Text(
                                    (item ?? {})['name'] ??
                                        model.roles[0]["name"],
                                    style: TextStyle(
                                        fontSize: 2.t,
                                        fontFamily: FontUtils.montserratMedium),
                                  ),
                                ],
                              ),
                              selectedFn: (dynamic item1, dynamic item2) {
                                if (item1 != null && item2 != null) {
                                  return item1['name'] == item2['name'];
                                }
                                return false;
                              },
                              // filterFn: (dynamic item, str) => item['name'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
                              dropdownItemFn: (dynamic item,
                                      int position,
                                      bool focused,
                                      bool selected,
                                      Function() onTap) =>
                                  ListTile(
                                title: Row(
                                  children: [
                                    Image.asset(
                                      (item ?? {})['image'] ?? '',
                                      scale: 5,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(item['name']),
                                  ],
                                ),
                                tileColor: focused
                                    ? ColorUtils.purplelight
                                    : Colors.transparent,
                                onTap: onTap,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                            onTap: () {
                              model.counsellorLanguage();
                            },
                            child: Button(
                                AppLocalizations.of(context)!
                                    .translate('other_text_14')!,
                                15))
                      ],
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }
}
