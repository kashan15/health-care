// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:soulgood/client-side-views/review_detail.dart';
// import 'package:soulgood/utils/color_utils.dart';
// import 'package:soulgood/utils/dimensions.dart';
// import 'package:soulgood/utils/extensions.dart';
// import 'package:soulgood/utils/font_utils.dart';
// import 'package:soulgood/utils/image_utils.dart';

// Widget SubscriptionPlanCard(String label, String pay, String detail, context) {
//   return Container(
//     padding: EdgeInsets.only(bottom: 1.h),
//     width: 250.w,
//     // height: 40.h,
//     decoration: BoxDecoration(
//         border: Border.all(color: ColorUtils.purple),
//         borderRadius: BorderRadius.circular(10)),
//     child: Column(
//       children: [
//         Row(
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(20),
//                       topLeft: Radius.circular(8)),
//                   color: ColorUtils.purple),
//               child: Text(
//                 label,
//                 style: TextStyle(
//                     fontFamily: FontUtils.montserratMedium,
//                     color: ColorUtils.white,
//                     fontSize: 1.4.t),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 3.h,
//         ),
//         Container(
//           padding:
//               EdgeInsets.symmetric(horizontal: Dimensions.horizontalPadding),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   RichText(
//                     text: TextSpan(
//                       children: <TextSpan>[
//                         TextSpan(
//                             text: pay,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: ColorUtils.black,
//                                 fontSize: 3.t)),
//                         TextSpan(
//                             text: '/month',
//                             style: TextStyle(
//                                 fontFamily: FontUtils.montserratRegular,
//                                 fontSize: 2.t,
//                                 color: ColorUtils.black)),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 2.h,
//               ),
//               Text(
//                 detail,
//                 style: TextStyle(
//                     fontSize: 2.t, fontFamily: FontUtils.montserratSemiBold),
//               ),
//               SizedBox(height: 2.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SvgPicture.asset(
//                     ImageUtils.dot,
//                     height: 2.3.h,
//                     fit: BoxFit.scaleDown,
//                   ),
//                   Expanded(
//                     child: Text("Live Video Call",
//                         style: TextStyle(
//                             fontFamily: FontUtils.montserratRegular,
//                             fontSize: 1.8.t,
//                             color: ColorUtils.black.withOpacity(0.7))),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 15.h,
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => ReviewDetails(detail: ,)));
//                 },
//                 child: Container(
//                   width: 35.w,
//                   decoration: BoxDecoration(
//                       color: ColorUtils.purple,
//                       borderRadius: BorderRadius.circular(7)),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 1.7.h),
//                     child: Center(
//                       child: Text(
//                         "Select Package",
//                         style: TextStyle(
//                             color: ColorUtils.white,
//                             fontFamily: FontUtils.montserratBold,
//                             fontSize: 1.7.t),
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
