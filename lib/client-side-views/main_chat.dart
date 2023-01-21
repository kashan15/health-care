import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:soulgood/utils/constants.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';
import '../utils/app_localization.dart';
import '../utils/color_utils.dart';
import '../utils/dimensions.dart';
import '../utils/font_utils.dart';
import '../utils/image_utils.dart';
import '../viewModels/main_view_model.dart';
import 'after_subs_chat.dart';
import 'customer_support_chat.dart';

class ChatScreenForBottom extends StatefulWidget {
  const ChatScreenForBottom({Key? key}) : super(key: key);

  @override
  _ChatScreenForBottomState createState() => _ChatScreenForBottomState();
}

class _ChatScreenForBottomState extends State<ChatScreenForBottom> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        // await model.getUser();
        // model.getUserPlan();
        // model.getUserCredits();
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
                    horizontal: Dimensions.horizontalPadding, vertical: 1.h),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.topMargin,
                      ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       "Hello,",
                      //       style: TextStyle(
                      //           color: ColorUtils.purple,
                      //           fontFamily: FontUtils.montserratSemiBold,
                      //           fontSize: 3.t),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       model.username,
                      //       style: TextStyle(
                      //           color: ColorUtils.purple,
                      //           fontFamily: FontUtils.montserratSemiBold,
                      //           fontSize: 3.t),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 3.5.h,
                      // ),
                      // Container(
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //       border: Border.all(color: ColorUtils.purple),
                      //       borderRadius: BorderRadius.circular(15)),
                      //   padding: EdgeInsets.symmetric(
                      //       horizontal: 5.w, vertical: 2.h),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "Upcoming Session",
                      //         style: TextStyle(
                      //             fontSize: 2.t,
                      //             fontFamily: FontUtils.montserratBold),
                      //       ),
                      //       SizedBox(
                      //         height: 2.h,
                      //       ),
                      //       Text(
                      //         "1. You will not be able to reschedule or cancel within 24 hours of the session",
                      //         style: TextStyle(
                      //             fontSize: 1.7.t,
                      //             fontFamily: FontUtils.montserratRegular),
                      //       ),
                      //       SizedBox(
                      //         height: 2.h,
                      //       ),
                      //       Text(
                      //         "2. If you are absent or late for more than 15 minutes, you will forfeit your session",
                      //         style: TextStyle(
                      //             fontSize: 1.7.t,
                      //             fontFamily: FontUtils.montserratRegular),
                      //       ),
                      //       SizedBox(
                      //         height: 3.h,
                      //       ),
                      // Material(
                      //   borderRadius: BorderRadius.circular(15),
                      //   elevation: 10,
                      //   shadowColor: ColorUtils.grey.withOpacity(0.3),
                      //   child: Container(
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: Dimensions.horizontalPadding,
                      //         vertical: 2.h),
                      //     decoration: BoxDecoration(
                      //       border: Border.all(color: ColorUtils.purple),
                      //       borderRadius: BorderRadius.circular(15),
                      //     ),
                      //     child: Column(
                      //       children: [
                      // Row(
                      //   mainAxisAlignment:
                      //       MainAxisAlignment.spaceBetween,
                      // children: [
                      //     Text(
                      //       "Therapist Name",
                      //       style: TextStyle(
                      //           fontFamily:
                      //               FontUtils.montserratRegular,
                      //           fontSize: 2.t),
                      //     ),
                      //     Text(
                      //       "24 August, 2021",
                      //       style: TextStyle(
                      //           fontFamily:
                      //               FontUtils.montserratRegular,
                      //           fontSize: 2.t),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 0.5.h,
                      // ),
                      // Row(
                      //   mainAxisAlignment:
                      //       MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       "24 August, 2021",
                      //       style: TextStyle(
                      //           fontFamily:
                      //               FontUtils.montserratBold,
                      //           fontSize: 2.t),
                      //     ),
                      //     Text(
                      //       "08:00 PM",
                      //       style: TextStyle(
                      //           fontFamily:
                      //               FontUtils.montserratSemiBold,
                      //           fontSize: 2.t),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 1.h,
                      // ),
                      // Row(
                      //   mainAxisAlignment:
                      //       MainAxisAlignment.center,
                      //   children: [
                      //     InkWell(
                      //       onTap: () {
                      //         model.navigateToLiveVideo();
                      //       },
                      //       child: Container(
                      //           width: 13.w,
                      //           // height: 8.h,
                      //           padding: EdgeInsets.only(
                      //               top: 0.5.h, bottom: 0.5.h),
                      //           decoration: BoxDecoration(
                      //               color: ColorUtils.purple,
                      //               shape: BoxShape.circle),
                      //           child: Icon(
                      //             Icons.videocam,
                      //             color: ColorUtils.white,
                      //           )),
                      //     ),
                      //     InkWell(
                      //       onTap: () {},
                      //       child: Container(
                      //           width: 13.w,
                      //           // height: 8.h,
                      //           padding: EdgeInsets.only(
                      //               top: 0.5.h, bottom: 0.5.h),
                      //           decoration: BoxDecoration(
                      //               color: ColorUtils.purple,
                      //               shape: BoxShape.circle),
                      //           child: Icon(
                      //             Icons.call,
                      //             color: ColorUtils.white,
                      //           )),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisAlignment:
                      //       MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     InkWell(
                      //       onTap: () {
                      //         Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) =>
                      //                     ReSchedule()));
                      //       },
                      //       child: Container(
                      //           decoration: BoxDecoration(
                      //               color: ColorUtils.purple,
                      //               borderRadius:
                      //                   BorderRadius.circular(4)),
                      //           padding: EdgeInsets.symmetric(
                      //               horizontal: 6.w,
                      //               vertical: 1.3.h),
                      //           child: Text(
                      //             "Reschedule",
                      //             style: TextStyle(
                      //                 fontFamily: FontUtils
                      //                     .montserratMedium,
                      //                 fontSize: 2.2.t,
                      //                 color: ColorUtils.white),
                      //           )),
                      //     ),
                      //     InkWell(
                      //         onTap: () {
                      //           showDialog(
                      //             context: context,
                      //             builder: (context) =>
                      //                 AlertDialog(
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(
                      //                           8)),
                      //               title: SvgPicture.asset(
                      //                   ImageUtils.cancel),
                      //               contentPadding:
                      //                   EdgeInsets.symmetric(
                      //                       horizontal: Dimensions
                      //                           .horizontalPadding),
                      //               content: Container(
                      //                 padding: EdgeInsets.only(
                      //                     bottom: 3.h),
                      //                 child: Column(
                      //                   mainAxisSize:
                      //                       MainAxisSize.min,
                      //                   children: [
                      //                     SizedBox(height: 3.h),
                      //                     Text(
                      //                       "Do you want to cancel session?",
                      //                       style: TextStyle(
                      //                           fontFamily: FontUtils
                      //                               .montserratBold,
                      //                           fontSize: 2.t),
                      //                       textAlign:
                      //                           TextAlign.center,
                      //                     ),
                      //                     SizedBox(
                      //                       height: 2.h,
                      //                     ),
                      //                     Text(
                      //                       "You won’t be able to revert this action later!",
                      //                       style: TextStyle(
                      //                           fontFamily: FontUtils
                      //                               .montserratRegular,
                      //                           fontSize: 2.2.t),
                      //                       textAlign:
                      //                           TextAlign.center,
                      //                     ),
                      //                     SizedBox(
                      //                       height: 3.h,
                      //                     ),
                      //                     // SizedBox(height: 5.h),
                      //                     Row(
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment
                      //                               .spaceBetween,
                      //                       children: [
                      //                         InkWell(
                      //                           onTap: () {
                      //                             Navigator.pop(
                      //                                 context);
                      //                           },
                      //                           child: Container(
                      //                             decoration: BoxDecoration(
                      //                                 border: Border.all(
                      //                                     color: ColorUtils
                      //                                         .purple),
                      //                                 color: ColorUtils
                      //                                     .purple,
                      //                                 borderRadius:
                      //                                     BorderRadius.circular(
                      //                                         7)),
                      //                             padding: EdgeInsets
                      //                                 .only(
                      //                                     left:
                      //                                         1.w,
                      //                                     bottom:
                      //                                         2.h,
                      //                                     right:
                      //                                         1.w,
                      //                                     top: 2
                      //                                         .h),
                      //                             child: Text(
                      //                               "Yes, Cancel it",
                      //                               style:
                      //                                   TextStyle(
                      //                                 fontSize:
                      //                                     2.t,
                      //                                 color: ColorUtils
                      //                                     .white,
                      //                                 fontFamily:
                      //                                     FontUtils
                      //                                         .montserratSemiBold,
                      //                               ),
                      //                             ),
                      //                           ),
                      //                         ),
                      //                         InkWell(
                      //                           onTap: () {
                      //                             Navigator.pop(
                      //                                 context);
                      //                           },
                      //                           child: Container(
                      //                             decoration: BoxDecoration(
                      //                                 border: Border.all(
                      //                                     color: ColorUtils
                      //                                         .purple),
                      //                                 borderRadius:
                      //                                     BorderRadius.circular(
                      //                                         7)),
                      //                             padding: EdgeInsets
                      //                                 .only(
                      //                                     left:
                      //                                         3.w,
                      //                                     bottom:
                      //                                         2.h,
                      //                                     right:
                      //                                         3.w,
                      //                                     top: 2
                      //                                         .h),
                      //                             child: Text(
                      //                               "No, Keep it",
                      //                               style: TextStyle(
                      //                                   fontSize:
                      //                                       2.t,
                      //                                   fontFamily:
                      //                                       FontUtils
                      //                                           .montserratSemiBold,
                      //                                   color: ColorUtils
                      //                                       .purple),
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     )
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           );
                      //         },
                      //         child: SvgPicture.asset(
                      //             ImageUtils.delete))
                      //   ],
                      // ),
                      //             ],
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      Row(
                        children: [
                          // IconButton(
                          //     onPressed: () {
                          //       model.navigateBack();
                          //     },
                          //     icon: Icon(
                          //       Icons.arrow_back_ios,
                          //       color: ColorUtils.black,
                          //       size: 4.i,
                          //     )),
                          Text(
                            AppLocalizations.of(context)!
                                .translate('user_db_sidebar_text_1')!,
                            style: TextStyle(
                                fontFamily: FontUtils.montserratBold,
                                fontSize: 2.5.t),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                          AppLocalizations.of(context)!
                              .translate('user_db_sidebar_text_2')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratBold,
                              fontSize: 2.t)),
                      SizedBox(
                        height: 2.h,
                      ),

                      ListTile(
                        contentPadding:
                            const EdgeInsets.only(left: 0, right: 0),
                        onTap: () async {
                          await model.getChatByUser();
                          model.checkUserPlan.isEmpty ||
                                  model.checkUserPlan[0].type == null ||
                                  model.checkUserPlan[0].type! < 1
                              ? model.navigateToBeforeChat()
                              : model.navigation_Service.navigateTo(
                                  to: AfterSubsChats(
                                  id: model.therapistIdDo =
                                      model.therapistDetail!.therapist_id,
                                  logController: model.logController,
                                ));
                        },
                        leading: model.therapistDetail!.image!.isEmpty
                            ? Image.asset(ImageUtils.support)
                            : Image.network(
                                'https://api-prod.soulgoodhealth.com:5000' +
                                    Constants.blogImage +
                                    model.therapistDetail!.image.toString(),
                                height: 10.h,
                                width: 15.w,
                                fit: BoxFit.fill,
                              ),
                        title: Text(
                          model.therapistDetail!.name.toString(),
                          style: TextStyle(
                              fontSize: 2.t,
                              fontFamily: FontUtils.montserratSemiBold),
                        ),
                        // subtitle: SizedBox(
                        //   height: 3.h,
                        //   child: Html(
                        //       data: model.therapistDetail!.description),
                        // ),
                        trailing: model.LoadingChats == true
                            ? SizedBox(
                                height: 2.h,
                                width: 4.w,
                                child: CircularProgressIndicator(
                                  color: ColorUtils.green,
                                ),
                              )
                            : IconButton(
                                onPressed: () async {
                                  await model.getChatByUser();

                                  await model.getChatByUser();
                                  model.checkUserPlan.isEmpty ||
                                          model.checkUserPlan[0].type == null ||
                                          model.checkUserPlan[0].type! < 1
                                      ? model.navigateToBeforeChat()
                                      : model.navigation_Service.navigateTo(
                                          to: AfterSubsChats(
                                          id: model.therapistIdDo = model
                                              .therapistDetail!.therapist_id,
                                          logController: model.logController,
                                        ));
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: ColorUtils.black,
                                  size: 4.i,
                                )),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                          AppLocalizations.of(context)!
                              .translate('user_db_sidebar_text_3')!,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratBold,
                              fontSize: 2.t)),
                      SizedBox(
                        height: 2.h,
                      ),
                      ListTile(
                        contentPadding:
                            const EdgeInsets.only(left: 0, right: 0),
                        onTap: () async {
                          await model.getChatOfCustomer();
                          model.navigation_Service.navigateTo(
                              to: CustomerSupportChat(
                            id: model.therapistIdDo =
                                model.customerDetail!.therapist_id,
                          ));
                        },
                        leading:
                            Image.asset(ImageUtils.support, fit: BoxFit.cover),
                        title: Text(
                          model.customerDetail!.name.toString(),
                          style: TextStyle(
                              fontSize: 2.t,
                              fontFamily: FontUtils.montserratSemiBold),
                        ),
                        // subtitle: SizedBox(
                        //   height: 3.h,
                        //   child: Html(
                        //       data: model.therapistDetail!.description),
                        // ),
                        trailing: model.LoadingCustomSuppChats == true
                            ? SizedBox(
                                height: 2.h,
                                width: 4.w,
                                child: CircularProgressIndicator(
                                  color: ColorUtils.green,
                                ),
                              )
                            : IconButton(
                                onPressed: () async {
                                  await model.getChatOfCustomer();
                                  model.navigation_Service.navigateTo(
                                      to: CustomerSupportChat(
                                    id: model.therapistIdDo =
                                        model.customerDetail!.therapist_id,
                                  ));
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: ColorUtils.black,
                                  size: 4.i,
                                )),
                      ), // SizedBox(
                      //   height: 2.h,
                      // ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       "Tools",
                      //       style: TextStyle(
                      //           fontFamily: FontUtils.montserratBold,
                      //           fontSize: 2.5.t),
                      //     ),
                      //   ],
                      // ),

                      // SizedBox(
                      //   height: 2.h,
                      // ),
                      // ListView.separated(
                      //     shrinkWrap: true,
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     itemBuilder: (context, index) {
                      //       return MediaQuery(
                      //         data: const MediaQueryData(
                      //             padding: EdgeInsets.zero),
                      //         child: ListTile(
                      //           contentPadding:
                      //               const EdgeInsets.only(left: 0, right: 0),
                      //           onTap: () {
                      //             if (index == 0) {
                      //               model.getUserCredits();
                      //               model.navigateToBookSessionS();
                      //             } else if (index == 1) {
                      //               model.navigateToReports();
                      //             } else if (index == 2) {
                      //               model.navigateToMyJournal();
                      //             } else if (index == 3) {
                      //               model.navigateToBlog();
                      //             } else if (index == 4) {
                      //               if (model.checkUserPlan.isEmpty) {
                      //                 model.navigateToSubscription();
                      //               } else {
                      //                 model.navigateToManageSubs();
                      //               }
                      //             }
                      //           },
                      //           leading:
                      //               Image.asset(model.tools[index]["image"]),
                      //           title: Text(
                      //             model.tools[index]["name"],
                      //             style: TextStyle(
                      //                 fontSize: 2.t,
                      //                 fontFamily: FontUtils.montserratSemiBold),
                      //           ),
                      //           // subtitle: Text(
                      //           //   model.tools[index]["detail"],
                      //           //   style: TextStyle(fontSize: 1.6.t),
                      //           // ),
                      //           trailing: IconButton(
                      //               onPressed: () {
                      //                 if (index == 0) {
                      //                   model.navigateToBookSessionS();
                      //                 } else if (index == 1) {
                      //                   model.navigateToReports();
                      //                 } else if (index == 2) {
                      //                   model.navigateToMyJournal();
                      //                 } else if (index == 3) {
                      //                   model.navigateToBlog();
                      //                 } else if (index == 4) {
                      //                   if (model.checkUserPlan.isEmpty) {
                      //                     model.navigateToSubscription();
                      //                   } else {
                      //                     model.navigateToManageSubs();
                      //                   }
                      //                 }
                      //               },
                      //               icon: Icon(
                      //                 Icons.arrow_forward_ios_sharp,
                      //                 color: ColorUtils.black,
                      //                 size: 4.i,
                      //               )),
                      //         ),
                      //       );
                      //     },
                      //     separatorBuilder: (context, index) {
                      //       return SizedBox(
                      //         height: 2.h,
                      //       );
                      //     },
                      //     itemCount: model.tools.length),
                      SizedBox(
                        height: 2.h,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
