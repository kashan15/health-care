import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/Widget/error_widget.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/client-side-views/my_journals.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dialog_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class WriteJournal extends StatefulWidget {
  const WriteJournal({Key? key}) : super(key: key);

  @override
  _WriteJournalState createState() => _WriteJournalState();
}

class _WriteJournalState extends State<WriteJournal> {
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Dimensions.topMargin,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                  .translate('user_db_journal_text_2')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 2.8.t),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Center(
                          child: Text(
                              // "Your Journals will be shared with your therapist!",
                              AppLocalizations.of(context)!
                                  .translate('other_text_90')!,
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratSemiBold,
                                  fontSize: 1.8.t,
                                  color: ColorUtils.grey)),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('user_db_journal_text_4')!,
                          style:
                              TextStyle(fontFamily: FontUtils.montserratMedium),
                        ),
                        SizedBox(height: 1.h),
                        TextFormField(
                          controller: model.journaltitle,
                          maxLength: 150,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              fontSize: 2.5.t,
                              fontFamily: FontUtils.montserratBold),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorUtils.green)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorUtils.green)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: ColorUtils.green),
                              )),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextField(
                          controller: model.journalDes,
                          maxLength: 1500,
                          maxLines: 13,
                          style: TextStyle(
                              fontFamily: FontUtils.montserratRegular,
                              fontSize: 2.5.t),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorUtils.green)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorUtils.green)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: ColorUtils.green),
                              )),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                if (model.journaltitle.text.isEmpty) {
                                  DialogUtils().showDialog(MyErrorWidget(
                                      error: "Please Enter Title"));
                                } else if (model.journalDes.text.isEmpty) {
                                  DialogUtils().showDialog(MyErrorWidget(
                                      error: "Please Enter Description"));
                                } else {
                                  model.navigateBack();
                                  model.createJournal();
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .translate('other_text_57')!),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                model.navigateBack();
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             MyJournals()));
                                                // model.journaltitle.clear();
                                                // model.journalDes.clear();
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: ColorUtils.purple,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 1.7.h),
                                                  child: Center(
                                                    child: Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .translate(
                                                              'other_text_58')!,
                                                      style: TextStyle(
                                                          color:
                                                              ColorUtils.white,
                                                          fontFamily: FontUtils
                                                              .montserratSemiBold),
                                                    ),
                                                  ),
                                                ),
                                              )
                                              // Button(
                                              //                                                 AppLocalizations.of(context)!
                                              //                                                     .translate(
                                              //                                                         'other_text_58')!,
                                              //                                                 15)
                                              )
                                        ],
                                      ),
                                    ),
                                  );
                                } // // model.getJournals();
                                // model.notifyListeners();
                                // model.navigateBack();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: ColorUtils.green,
                                    borderRadius: BorderRadius.circular(15)),
                                padding: EdgeInsets.fromLTRB(
                                    10.w, 1.5.h, 10.w, 1.5.h),
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('user_db_journal_text_8')!,
                                  style: TextStyle(
                                      fontSize: 2.2.t,
                                      fontFamily: FontUtils.montserratSemiBold,
                                      color: ColorUtils.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: ColorUtils.green),
                                    borderRadius: BorderRadius.circular(15)),
                                padding:
                                    EdgeInsets.fromLTRB(8.w, 1.4.h, 8.w, 1.4.h),
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('other_text_29')!,
                                  style: TextStyle(
                                      fontSize: 2.2.t,
                                      fontFamily: FontUtils.montserratSemiBold,
                                      color: ColorUtils.green),
                                ),
                              ),
                            ),
                          ],
                        )
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
