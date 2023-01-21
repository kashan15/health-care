import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

class Encripted extends StatefulWidget {
  const Encripted({Key? key}) : super(key: key);

  @override
  _EncriptedState createState() => _EncriptedState();
}

class _EncriptedState extends State<Encripted> {
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
                        Image.asset(
                          ImageUtils.soulgood,
                          height: 10.i,
                        ),

                        // Row(
                        //   children: [
                        //     SizedBox(width: 1.2.w,),
                        //     InkWell(
                        //         onTap: (){model.navigateBack();},
                        //         child: Icon(Icons.arrow_back_ios,color: ColorUtils.black,size: 4.i,)),
                        //   ],
                        // ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('encrypted_text_1')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratBold,
                              fontSize: 3.t),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('encrypted_text_2')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratMedium,
                              fontSize: 2.2.t,
                              color: ColorUtils.border),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        SvgPicture.asset(ImageUtils.encripted),
                        SizedBox(
                          height: 10.h,
                        ),
                        InkWell(
                            onTap: () {
                              model.navigateToExtra();
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
                                        color: ColorUtils.grey.withOpacity(0.2))
                                  ],
                                  color: ColorUtils.green,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('other_text_14')!,
                                  style: TextStyle(
                                      color: ColorUtils.white,  
                                      fontFamily: FontUtils.montserratSemiBold),
                                ),
                              ),
                            )),
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

                                              /// OLD CODE 

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
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

// class Encripted extends StatefulWidget {
//   const Encripted({Key? key}) : super(key: key);

//   @override
//   _EncriptedState createState() => _EncriptedState();
// }

// class _EncriptedState extends State<Encripted> {
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<MainViewModel>.reactive(
//       viewModelBuilder: () => locator<MainViewModel>(),
//       disposeViewModel: false,
//       onModelReady: (model) {},
//       builder: (context, model, child) {
//         return SafeArea(
//           top: false,
//           bottom: false,
//           child: GestureDetector(
//             onTap: () {
//               FocusScope.of(context).unfocus();
//             },
//             child: Scaffold(
//                 backgroundColor: Colors.white,
//                 body: Container(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: Dimensions.horizontalPadding),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: Dimensions.topMargin,
//                         ),

//                         // Row(
//                         //   children: [
//                         //     SizedBox(width: 1.2.w,),
//                         //     InkWell(
//                         //         onTap: (){model.navigateBack();},
//                         //         child: Icon(Icons.arrow_back_ios,color: ColorUtils.black,size: 4.i,)),
//                         //   ],
//                         // ),
//                         SizedBox(
//                           height: 5.h,
//                         ),
//                         Text(
//                           AppLocalizations.of(context)!
//                               .translate('encrypted_text_1')!,
//                           style: TextStyle(
//                               fontFamily: FontUtils.montserratBold,
//                               fontSize: 3.t),
//                         ),
//                         SizedBox(
//                           height: 4.h,
//                         ),
//                         Text(
//                           AppLocalizations.of(context)!
//                               .translate('encrypted_text_2')!,
//                           style: TextStyle(
//                               fontFamily: FontUtils.montserratMedium,
//                               fontSize: 2.2.t,
//                               color: ColorUtils.border),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(
//                           height: 3.h,
//                         ),
//                         SvgPicture.asset(ImageUtils.encripted),
//                         SizedBox(
//                           height: 7.h,
//                         ),
//                         InkWell(
//                             onTap: () {
//                               model.navigateToExtra();
//                             },
//                             child: Button(
//                                 AppLocalizations.of(context)!
//                                     .translate('other_text_14')!,
//                                 10)),
//                       ],
//                     ),
//                   ),
//                 )),
//           ),
//         );
//       },
//     );
//   }
// }

