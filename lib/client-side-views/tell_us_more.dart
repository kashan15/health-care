import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class HowWeHelp extends StatefulWidget {
  const HowWeHelp({Key? key}) : super(key: key);

  @override
  _HowWeHelpState createState() => _HowWeHelpState();
}

class _HowWeHelpState extends State<HowWeHelp> {
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
                            //IconButton(onPressed: (){model.navigateBack();}, icon: Icon(Icons.arrow_back_ios,color: ColorUtils.black,size: 4.i,)),
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
                          AppLocalizations.of(context)!.translate('tell_us_more_text_4')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratBold,
                              fontSize: 3.2.t),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 3.5.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!.translate('tell_us_more_text_5')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratMedium,
                              fontSize: 2.t,
                              color: ColorUtils.border,
                              height: 0.21.h),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          width: 100.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorUtils.border),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextField(
                            controller: model.tellUsMore,
                            maxLines: 10,
                            style: TextStyle(color: ColorUtils.purple),
                            decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)!.translate('tell_us_more_text_3')!,
                                hintStyle: TextStyle(color: ColorUtils.border),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 7.5.h,
                        ),
                        InkWell(
                          onTap: () {
                            model.tellMore();
                          },
                          child: Button(AppLocalizations.of(context)!.translate('tell_us_more_text_6')!,15),
                        )
                      ],
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }
}
