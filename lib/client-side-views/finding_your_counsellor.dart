import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/Widget/bottom_app_bar.dart';
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

class FindingCounsellor extends StatefulWidget {
  const FindingCounsellor({Key? key}) : super(key: key);

  @override
  _FindingCounsellorState createState() => _FindingCounsellorState();
}

class _FindingCounsellorState extends State<FindingCounsellor> {
  // @override
  // void initState() {
  //   super.initState();
  //   navigate();
  // }

  // navigate() async {
  //   await Future.delayed(const Duration(milliseconds: 10000), () {});
  //   Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(builder: (context) => const BottomAppBar1()),
  //       (route) => false);
  // Navigator.pushReplacement(
  //     context, MaterialPageRoute(builder: (context) => BottomAppBar1()));
// }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.findingCounsellor();
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
                body: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.horizontalPadding),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          // "Finding your counsellor match",
                          AppLocalizations.of(context)!
                              .translate('finding_therapist_text_1')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratBold,
                              fontSize: 3.t),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Image.asset(ImageUtils.loader),
                        // InkWell(
                        //     onTap: () {
                        //       model.findingCounsellor();
                        //     },
                        //     child: Button("Get"))
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
