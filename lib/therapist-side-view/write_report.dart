import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class WriteReport extends StatefulWidget {
  const WriteReport({Key? key}) : super(key: key);

  @override
  _WriteReportState createState() => _WriteReportState();
}

class _WriteReportState extends State<WriteReport> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        model.reportTitle.clear();
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
                backgroundColor: Colors.white,
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
                              "Write Report",
                              style: TextStyle(
                                  fontFamily: FontUtils.montserratBold,
                                  fontSize: 2.8.t),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "Title:",
                          style:
                              TextStyle(fontFamily: FontUtils.montserratMedium),
                        ),
                        SizedBox(height: 1.h),
                        Material(
                          elevation: 10,
                          shadowColor: ColorUtils.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            // padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorUtils.purple),
                                borderRadius: BorderRadius.circular(7)),
                            // padding: EdgeInsets.symmetric(horizontal: 0.5.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: model.reportTitle,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontSize: 2.5.t,
                                        fontFamily: FontUtils.montserratBold),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        // Container(
                        //   width: 100.w,
                        //   height: 40.h,
                        //   decoration: BoxDecoration(
                        //       border: Border.all(color: ColorUtils.purple),
                        //       borderRadius: BorderRadius.circular(7)),
                        //   child: TextField(
                        //     maxLines: 10,
                        //     style: TextStyle(
                        //         fontFamily: FontUtils.montserratRegular,
                        //         fontSize: 2.5.t),
                        //     decoration: InputDecoration(
                        //         border: OutlineInputBorder(
                        //       borderSide: BorderSide.none,
                        //     )),
                        //   ),
                        // ),

                        Material(
                          elevation: 10,
                          shadowColor: ColorUtils.grey.withOpacity(0.2),
                          child: Container(
                            padding: EdgeInsets.only(top: 0.8.h, bottom: 0.8.h),
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorUtils.purple),
                                borderRadius: BorderRadius.circular(7)),
                            child: ExpandablePanel(
                              header: Padding(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                  "Problem List",
                                  style: TextStyle(
                                      fontSize: 2.t,
                                      fontFamily: FontUtils.montserratBold),
                                ),
                              ),
                              collapsed: Container(),
                              expanded: Container(
                                padding: EdgeInsets.only(bottom: 2),
                                child: Column(
                                  children: [
                                    Divider(
                                      color: ColorUtils.purple,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                      child: HtmlEditor(
                                        controller: model.textEditor, //required
                                        htmlEditorOptions: HtmlEditorOptions(
                                          hint: "Your text here...",
                                          //initalText: "text content initial, if any",
                                        ),
                                        otherOptions: OtherOptions(
                                          height: 400,
                                        ),
                                      ),
                                    )
                                    // FlutterSummernote(
                                    //   height: 40.h,
                                    //   hint: "Your text here...",
                                    //   key: model.keyEditor,
                                    //   hasAttachment: true,
                                    //   showBottomToolbar: false,
                                    //   customToolbar: """
                                    //       [
                                    //          ['style', ['bold', 'italic', 'underline', 'clear']],
                                    // ['font', ['strikethrough', 'superscript', 'subscript']],
                                    // ['fontsize', ['fontsize']],
                                    // ['color', ['color']],
                                    // ['para', ['ul', 'ol', 'paragraph']],
                                    // ['height', ['height']]
                                    //       ]
                                    //     """,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 2.h,
                        ),
                        Material(
                          elevation: 10,
                          shadowColor: ColorUtils.grey.withOpacity(0.2),
                          child: Container(
                            padding: EdgeInsets.only(top: 0.8.h, bottom: 0.8.h),
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorUtils.purple),
                                borderRadius: BorderRadius.circular(7)),
                            child: ExpandablePanel(
                              header: Padding(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                  "Formulation",
                                  style: TextStyle(
                                      fontSize: 2.t,
                                      fontFamily: FontUtils.montserratBold),
                                ),
                              ),
                              collapsed: Container(),
                              expanded: Container(
                                padding: EdgeInsets.only(bottom: 2),
                                child: Column(
                                  children: [
                                    Divider(
                                      color: ColorUtils.purple,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                      child: HtmlEditor(
                                        controller:
                                            model.textEditor1, //required
                                        htmlEditorOptions: HtmlEditorOptions(
                                          hint: "Your text here...",
                                          //initalText: "text content initial, if any",
                                        ),
                                        otherOptions: OtherOptions(
                                          height: 400,
                                        ),
                                      ),
                                    )
                                    // FlutterSummernote(
                                    //   height: 40.h,
                                    //   hint: "Your text here...",
                                    //   key: model.keyEditor1,
                                    //   hasAttachment: true,
                                    //   showBottomToolbar: false,
                                    //   customToolbar: """
                                    //       [
                                    //          ['style', ['bold', 'italic', 'underline', 'clear']],
                                    // ['font', ['strikethrough', 'superscript', 'subscript']],
                                    // ['fontsize', ['fontsize']],
                                    // ['color', ['color']],
                                    // ['para', ['ul', 'ol', 'paragraph']],
                                    // ['height', ['height']]
                                    //       ]
                                    //     """,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Material(
                          elevation: 10,
                          shadowColor: ColorUtils.grey.withOpacity(0.2),
                          child: Container(
                            padding: EdgeInsets.only(top: 0.8.h, bottom: 0.8.h),
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorUtils.purple),
                                borderRadius: BorderRadius.circular(7)),
                            child: ExpandablePanel(
                              header: Padding(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                  "Task & Goals",
                                  style: TextStyle(
                                      fontSize: 2.t,
                                      fontFamily: FontUtils.montserratBold),
                                ),
                              ),
                              collapsed: Container(),
                              expanded: Container(
                                padding: EdgeInsets.only(bottom: 2),
                                child: Column(
                                  // mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Divider(
                                      color: ColorUtils.purple,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                      child: HtmlEditor(
                                        controller:
                                            model.textEditor2, //required
                                        htmlEditorOptions: HtmlEditorOptions(
                                          hint: "Your text here...",
                                          //initalText: "text content initial, if any",
                                        ),
                                        otherOptions: OtherOptions(
                                          height: 300,
                                        ),
                                      ),
                                    )

                                    //                                 FlutterSummernote(
                                    //                                   hint: "Your text here...",
                                    //                                   key: model.keyEditor2,
                                    //               apk
                                    //                     hasAttachment: true,
                                    //                                     showBottomToolbar: false,

                                    //                                   customToolbar: """
                                    //       [
                                    //          ['style', ['bold', 'italic', 'underline', 'clear']],
                                    // ['font', ['strikethrough', 'superscript', 'subscript']],
                                    // ['fontsize', ['fontsize']],
                                    // ['color', ['color']],
                                    // ['para', ['ul', 'ol', 'paragraph']],
                                    // ['height', ['height']]
                                    //       ]
                                    //     """,
                                    //                                 ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Material(
                          elevation: 10,
                          shadowColor: ColorUtils.grey.withOpacity(0.2),
                          child: Container(
                            padding: EdgeInsets.only(top: 0.8.h, bottom: 0.8.h),
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorUtils.purple),
                                borderRadius: BorderRadius.circular(7)),
                            child: ExpandablePanel(
                              header: Padding(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                  "Completed Task & Goals",
                                  style: TextStyle(
                                      fontSize: 2.t,
                                      fontFamily: FontUtils.montserratBold),
                                ),
                              ),
                              collapsed: Container(),
                              expanded: Container(
                                padding: EdgeInsets.only(bottom: 2),
                                child: Column(
                                  children: [
                                    Divider(
                                      color: ColorUtils.purple,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                      child: HtmlEditor(
                                        controller:
                                            model.textEditor3, //required
                                        htmlEditorOptions: HtmlEditorOptions(
                                          hint: "Your text here...",
                                          //initalText: "text content initial, if any",
                                        ),
                                        otherOptions: OtherOptions(
                                          height: 400,
                                        ),
                                      ),
                                    )
                                    // MarkdownTextInput(
                                    //   (String value) => setState(
                                    //       () => model.description1 = value),
                                    //   model.description1,
                                    //   label: 'Description',
                                    //   maxLines: 10,
                                    //   actions: MarkdownType.values,
                                    //   controller: model.controller,
                                    // ),
                                    // Expanded(
                                    //   child: FlutterSummernote(
                                    //     hint: "Your text here...",
                                    //     key: model.keyEditor3,
                                    //     hasAttachment: true,
                                    //     showBottomToolbar: false,
                                    //     customToolbar: """
                                    //           [
                                    //              ['style', ['bold', 'italic', 'underline', 'clear']],
                                    //     ['font', ['strikethrough', 'superscript', 'subscript']],
                                    //     ['fontsize', ['fontsize']],
                                    //     ['color', ['color']],
                                    //     ['para', ['ul', 'ol', 'paragraph']],
                                    //     ['height', ['height']]
                                    //           ]
                                    //         """,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "You will not be able to make any changes after saving!",
                          style: TextStyle(
                              fontFamily: FontUtils.montserratMedium,
                              fontSize: 2.2.t,
                              color: ColorUtils.text_red),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                // print(await model.textEditor.getText());
                                model.createReport();
                                Navigator.pop(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: ColorUtils.purple,
                                    borderRadius: BorderRadius.circular(7)),
                                padding: EdgeInsets.fromLTRB(
                                    15.w, 1.5.h, 15.w, 1.5.h),
                                child: Text(
                                  "Save",
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
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: SvgPicture.asset(ImageUtils.cancel),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal:
                                            Dimensions.horizontalPadding),
                                    content: Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Text(
                                            "Are you sure you want to cancel?",
                                            style: TextStyle(
                                                fontFamily:
                                                    FontUtils.montserratBold,
                                                fontSize: 2.2.t),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            "You want be able revert your action after this.",
                                            style: TextStyle(
                                                fontFamily:
                                                    FontUtils.montserratRegular,
                                                fontSize: 2.2.t),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: ColorUtils.purple,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  padding: EdgeInsets.fromLTRB(
                                                      15, 15, 15, 15),
                                                  child: Text(
                                                    "Yes, Cancel it",
                                                    style: TextStyle(
                                                        fontSize: 2.2.t,
                                                        fontFamily: FontUtils
                                                            .montserratSemiBold,
                                                        color:
                                                            ColorUtils.white),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: ColorUtils
                                                              .purple),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  padding: EdgeInsets.fromLTRB(
                                                      15, 15, 15, 15),
                                                  child: Text(
                                                    "No, Keep it",
                                                    style: TextStyle(
                                                        fontSize: 2.2.t,
                                                        fontFamily: FontUtils
                                                            .montserratSemiBold,
                                                        color:
                                                            ColorUtils.purple),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: ColorUtils.purple),
                                    borderRadius: BorderRadius.circular(7)),
                                padding: EdgeInsets.fromLTRB(
                                    10.w, 1.4.h, 10.w, 1.4.h),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: 2.2.t,
                                      fontFamily: FontUtils.montserratSemiBold,
                                      color: ColorUtils.purple),
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

// class MyHomePage extends StatefulWidget {
//   MyHomePage({
//     Key? key,
//   }) : super(key: key);
//   // final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   GlobalKey<FlutterSummernoteState> _keyEditor = GlobalKey();
//   String result = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("testing"),
//         elevation: 0,
//       ),
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               FlutterSummernote(
//                 hint: "Your text here...",
//                 key: _keyEditor,
//                 hasAttachment: true,
//                 customToolbar: """
//           [
//              ['style', ['bold', 'italic', 'underline', 'clear']],
//     ['font', ['strikethrough', 'superscript', 'subscript']],
//     ['fontsize', ['fontsize']],
//     ['color', ['color']],
//     ['para', ['ul', 'ol', 'paragraph']],
//     ['height', ['height']]
//           ]
//         """,
//               ),
//               // Padding(
//               //   padding: const EdgeInsets.all(8.0),
//               //   child: Row(
//               //     mainAxisAlignment: MainAxisAlignment.center,
//               //     children: <Widget>[
//               //       FlatButton(
//               //         color: Colors.blueGrey,
//               //         onPressed: () {
//               //           setState(() {
//               //             keyEditor.currentState?.setEmpty();
//               //           });
//               //         },
//               //         child:
//               //             Text("Reset", style: TextStyle(color: Colors.white)),
//               //       ),
//               //       SizedBox(
//               //         width: 16,
//               //       ),
//               //       FlatButton(
//               //         color: Colors.blue,
//               //         onPressed: () async {
//               //           final txt = await keyEditor.currentState?.getText();
//               //           setState(() {
//               //             result = txt!;
//               //           });
//               //         },
//               //         child: Text(
//               //           "Submit",
//               //           style: TextStyle(color: Colors.white),
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               // Padding(
//               //   padding: const EdgeInsets.all(8.0),
//               //   child: Text(result),
//               // )
//             ],
//           ),
//         ),
//       ),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
