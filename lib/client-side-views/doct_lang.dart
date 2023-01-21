// import 'package:flutter/material.dart';
// import 'package:soulgood/Widget/button.dart';
// import 'package:soulgood/app/locator.dart';
// import 'package:soulgood/utils/color_utils.dart';
// import 'package:soulgood/utils/dimensions.dart';
// import 'package:soulgood/utils/extensions.dart';
// import 'package:soulgood/utils/font_utils.dart';
// import 'package:soulgood/viewModels/main_view_model.dart';
// import 'package:stacked/stacked.dart';


// class DoctorLanguage extends StatefulWidget {
//   const DoctorLanguage({Key? key}) : super(key: key);

//   @override
//   _DoctorLanguageState createState() => _DoctorLanguageState();
// }

// class _DoctorLanguageState extends State<DoctorLanguage> {
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<MainViewModel>.reactive(
//       viewModelBuilder: () => locator<MainViewModel>(),
//       disposeViewModel: false,
//       onModelReady: (model){
//       },
//       builder: (context, model, child) {
//         return GestureDetector(
//             onTap: (){
//               FocusScope.of(context).unfocus();
//             },
//             child: Scaffold(
//               backgroundColor: Colors.white,
//               body:
//               SingleChildScrollView(
//                   child:
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontalPadding),
//                     child: Column(
//                       children: [
//                         SizedBox(height: Dimensions.topMargin,),

//                     IconButton(onPressed: (){model.navigateBack();}, icon: Icon(Icons.arrow_back_ios,color: ColorUtils.black,)),
//                         SizedBox(height: 5.h,),
//                         Text("What would you like to work on",style: TextStyle(color: ColorUtils.black,fontWeight: FontWeight.bold,fontFamily: FontUtils.montserratBold,fontSize: 5.t ),textAlign: TextAlign.center,),

//                         SizedBox(height: 5.h,),
//                         Text("You can select multiple",style: TextStyle(color: ColorUtils.greyLight,fontFamily: FontUtils.montserratBold,fontSize: 3.t ),textAlign: TextAlign.center,),
//                         SizedBox(height: 5.h,),
//                         SizedBox(
//                           width: 60.w,
//                           height: 30.h,
//                           child: ListView.separated(

//                               itemCount: model.diseases.length,
//                               separatorBuilder: (context, index){
//                                 return SizedBox(height: 4.h,);
//                               },

//                               itemBuilder: (context, index){
//                                 return GestureDetector(
//                                   onTap: (){
//                                       model.selectedGender = 4;
//                                     model.notifyListeners();
//                                   },
//                                   child: Material(
//                                     elevation: model.selectedGender== 4 ? 10 : 0,
//                                     shadowColor: ColorUtils.border.withOpacity(0.4),

//                                     child: Container(
//                                         width: 50.w,
//                                         height: 6.h,
//                                         decoration: BoxDecoration(
//                                             border: Border.all(color: model.selectedGender== 4 ? ColorUtils.purple : ColorUtils.black),
//                                             borderRadius: BorderRadius.circular(6)
//                                         ),
//                                         child:
//                                         Center(child: Text(model.diseases[index],style: TextStyle(color: model.selectedGender== 4 ? ColorUtils.purple : ColorUtils.black,fontFamily: FontUtils.montserratRegular,fontSize: 3.t ),textAlign: TextAlign.center,))

//                                     ),
//                                   ),
//                                 );
//                               }),
//                         ),



//                         SizedBox(height: 6.h,),
//                         InkWell(
//                           onTap: (){
//                           },
//                           child:Button("Next")
//                         ),




//                       ],
//                     ),

//                   )

//               ),));
//       },
//     );
//   }

// }
