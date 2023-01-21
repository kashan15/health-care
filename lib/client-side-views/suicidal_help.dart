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

class SuicidalHelp extends StatefulWidget {
  const SuicidalHelp({Key? key}) : super(key: key);

  @override
  _SuicidalHelpState createState() => _SuicidalHelpState();
}

class _SuicidalHelpState extends State<SuicidalHelp> {
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
                      horizontal: Dimensions.horizontalPadding,
                      vertical: Dimensions.verticalBtnPadding),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.topMargin,
                      ),
                      Text(
                        AppLocalizations.of(context)!
                            .translate('need_help_text_10')!,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.montserratBold,
                            fontSize: 3.t),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 2.h),
                        decoration: BoxDecoration(
                            color: ColorUtils.white,
                            border: Border.all(color: ColorUtils.text_red),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 6,
                                  offset: Offset(0, 10),
                                  color: ColorUtils.grey.withOpacity(0.2))
                            ]),
                        child: Column(
                          children: [
                            Text(
                              "The soulgood platform \nshould not be used during emergencies or crises.",
                              // AppLocalizations.of(context)!
                              //     .translate('need_help_text_9')!,
                              style: TextStyle(
                                color: ColorUtils.text_red,
                                fontFamily: FontUtils.montserratMedium,
                                fontSize: 2.2.t,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "Please contact the following services for help",
                              // AppLocalizations.of(context)!
                              //     .translate('need_help_text_9')!,
                              style: TextStyle(
                                color: ColorUtils.text_red,
                                fontFamily: FontUtils.montserratMedium,
                                fontSize: 2.2.t,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.9.h,
                      ),
                      // Divider(
                      //   thickness: 2,
                      // ),
                      // SizedBox(
                      //   height: 2.h,
                      // ),
                      // Text(
                      //   AppLocalizations.of(context)!
                      //       .translate('need_help_text_11')!,
                      //   style: TextStyle(
                      //       color: ColorUtils.black,
                      //       fontFamily: FontUtils.montserratBold,
                      //       fontSize: 3.t),
                      //   textAlign: TextAlign.center,
                      // ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        AppLocalizations.of(context)!
                            .translate('need_help_text_4')!,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.montserratBold,
                            fontSize: 2.t),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "2896 0000  The Samaritans ",

                        // AppLocalizations.of(context)!
                        //     .translate('need_help_text_5')!,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.montserratMedium,
                            fontSize: 1.8.t),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "2382 0000 Suicide Prevention Hotline",
                        // AppLocalizations.of(context)!
                        //     .translate('need_help_text_6')!,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.montserratMedium,
                            fontSize: 1.8.t),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "23892222  The Samaritan Befrienders",
                        // AppLocalizations.of(context)!
                        //     .translate('need_help_text_7')!,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.montserratMedium,
                            fontSize: 1.8.t),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "18288  Caritas Family Crisis Support Centre",
                        // AppLocalization"s.of(context)!
                        //     .translate('need_help_text_12')!,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.montserratMedium,
                            fontSize: 1.8.t),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      // Text(
                      //   AppLocalizations.of(context)!
                      //       .translate('need_help_text_8')!,
                      //   style: TextStyle(
                      //       color: ColorUtils.black,
                      //       fontFamily: FontUtils.montserratMedium,
                      //       fontSize: 1.8.t),
                      //   textAlign: TextAlign.center,
                      // ),
                      SizedBox(
                        height: 8.h,
                      ),
                      InkWell(
                          onTap: () {
                            model.navigateBack();
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: ColorUtils.green,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.7.h),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('other_text_21')!,
                                  style: TextStyle(
                                      color: ColorUtils.white,
                                      fontFamily: FontUtils.montserratSemiBold),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                )),
              )),
        );
      },
    );
  }
}
  /// OLD CODE

// }
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:soulgood/Widget/button.dart';
// import 'package:soulgood/app/locator.dart';
// import 'package:soulgood/utils/app_localization.dart';
// import 'package:soulgood/utils/color_utils.dart';
// import 'package:soulgood/utils/dimensions.dart';
// import 'package:soulgood/utils/extensions.dart';
// import 'package:soulgood/utils/font_utils.dart';
// import 'package:soulgood/utils/image_utils.dart';
// import 'package:soulgood/viewModels/main_view_model.dart';
// import 'package:stacked/stacked.dart';

// class SuicidalHelp extends StatefulWidget {
//   const SuicidalHelp({Key? key}) : super(key: key);

//   @override
//   _SuicidalHelpState createState() => _SuicidalHelpState();
// }

// class _SuicidalHelpState extends State<SuicidalHelp> {
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<MainViewModel>.reactive(
//       viewModelBuilder: () => locator<MainViewModel>(),
//       disposeViewModel: false,
//       onModelReady: (model){
//       },
//       builder: (context, model, child) {
//         return SafeArea(

//           top: false,
//           bottom: false,
//           child: GestureDetector(
//               onTap: (){
//                 FocusScope.of(context).unfocus();
//               },
//               child: Scaffold(
//                 backgroundColor: Colors.white,
//                 body:
//                 SingleChildScrollView(
//                     child:
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontalPadding,vertical: Dimensions.verticalBtnPadding),
//                       child: Column(
//                         children: [
//                                                   SizedBox(height: Dimensions.topMargin,),

//                           Text(AppLocalizations.of(context)!.translate('need_help_text_10')!,style: TextStyle(color: ColorUtils.black,fontFamily: FontUtils.montserratBold,fontSize: 3.t ),textAlign: TextAlign.center,),

//                           SizedBox(height: 3.h,),

//                           Text(AppLocalizations.of(context)!.translate('need_help_text_9')!,style: TextStyle(color: ColorUtils.border,fontFamily: FontUtils.montserratMedium,fontSize: 2.t, height: 0.22.h),textAlign: TextAlign.center,),

//                           SizedBox(height: 1.9.h,),
//                           Divider(thickness: 2,),
//                           SizedBox(height: 2.h,),
//                           Text(AppLocalizations.of(context)!.translate('need_help_text_11')!,style: TextStyle(color: ColorUtils.black,fontFamily: FontUtils.montserratBold,fontSize: 3.t ),textAlign: TextAlign.center,),
//                           SizedBox(height: 3.h,),
//                           Text(AppLocalizations.of(context)!.translate('need_help_text_4')!,style: TextStyle(color: ColorUtils.purple,fontFamily: FontUtils.montserratMedium,fontSize: 2.t ),textAlign: TextAlign.center,),
//                           SizedBox(height: 4.h,),
//                           Text(AppLocalizations.of(context)!.translate('need_help_text_5')!,style: TextStyle(color: ColorUtils.black,fontFamily: FontUtils.montserratMedium,fontSize: 1.8.t ),textAlign: TextAlign.center,),
//                           SizedBox(height: 4.h,),
//                           Text(AppLocalizations.of(context)!.translate('need_help_text_6')!,style: TextStyle(color: ColorUtils.black,fontFamily: FontUtils.montserratMedium,fontSize: 1.8.t ),textAlign: TextAlign.center,),
//                           SizedBox(height: 4.h,),
//                           Text(AppLocalizations.of(context)!.translate('need_help_text_7')!,style: TextStyle(color: ColorUtils.black,fontFamily: FontUtils.montserratMedium,fontSize: 1.8.t ),textAlign: TextAlign.center,),
//                           SizedBox(height: 4.h,),
//                           Text(AppLocalizations.of(context)!.translate('need_help_text_12')!,style: TextStyle(color: ColorUtils.black,fontFamily: FontUtils.montserratMedium,fontSize: 1.8.t ),textAlign: TextAlign.center,),
//                           SizedBox(height: 4.h,),
//                           Text(AppLocalizations.of(context)!.translate('need_help_text_8')!,style: TextStyle(color: ColorUtils.black,fontFamily: FontUtils.montserratMedium,fontSize: 1.8.t ),textAlign: TextAlign.center,),
//                           SizedBox(height: 8.h,),

//                           InkWell(
//                             onTap: (){
//                               model.navigateBack();
//                             },
//                             child:Button(AppLocalizations.of(context)!.translate('other_text_21')!,15)
//                           ),

//                         ],
//                       ),

//                     )

//                 ),)),
//         );
//       },
//     );
//   }

// }

