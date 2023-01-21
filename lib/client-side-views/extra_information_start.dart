import 'package:flutter/material.dart';
import 'package:soulgood/client-side-views/im_joining_As.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';
import '../utils/app_localization.dart';
import '../utils/font_utils.dart';
import '../viewModels/main_view_model.dart';

class ExtraInfoStart extends StatefulWidget {
  const ExtraInfoStart({Key? key}) : super(key: key);

  @override
  State<ExtraInfoStart> createState() => _ExtraInfoStartState();
}

class _ExtraInfoStartState extends State<ExtraInfoStart> {
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
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                ImageUtils.soulgood,
                                height: 10.i,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .translate('other_text_68')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 4.t),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .translate('other_text_77')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratMedium,
                                  fontSize: 3.t,
                                  height: 0.2.h),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InkWell(
                                onTap: () {
                                  // model.navigateToExtra();
                                  model.navigation_Service
                                      .navigateTo(to: JoiningAs());
                                },
                                child: Container(
                                  width: 45.w,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 2.h,
                                  ),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 6,
                                            offset: Offset(0, 10),
                                            color: ColorUtils.grey
                                                .withOpacity(0.2))
                                      ],
                                      color: ColorUtils.green,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .translate('other_text_14')!,
                                      style: TextStyle(
                                          color: ColorUtils.white,
                                          fontFamily:
                                              FontUtils.montserratSemiBold),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  )));
        });
  }
}
