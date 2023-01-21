import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:soulgood/client-side-views/after_subs_chat.dart';
import 'package:soulgood/client-side-views/before_subs_chat.dart';
import 'package:soulgood/client-side-views/customer_support_chat.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';
import '../utils/app_localization.dart';
import '../utils/color_utils.dart';
import '../utils/constants.dart';
import '../utils/dimensions.dart';
import '../utils/font_utils.dart';
import '../viewModels/main_view_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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

                                  model.checkUserPlan.isEmpty ||
                                          model.checkUserPlan[0].type == null ||
                                          model.checkUserPlan[0].type! < 1
                                      ? model.navigateToBeforeChat()
                                      : model.navigateToAfterChat(
                                          model.therapistDetail!.therapist_id);
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
                        trailing: model.LoadingCustomSuppChats == true
                            ? SizedBox(
                                height: 2.h,
                                width: 4.w,
                                child:  CircularProgressIndicator(
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
                      ),
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
