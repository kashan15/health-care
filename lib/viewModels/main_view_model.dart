import 'dart:async';
import 'dart:developer';
import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'dart:io';
import 'dart:math';
import 'package:agora_rtm/agora_rtm.dart';
import 'package:crypto/crypto.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:soulgood/Widget/button.dart';
import 'package:soulgood/client-side-views/after_subs_chat.dart';
import 'package:soulgood/client-side-views/extra_info.dart';
import 'package:soulgood/client-side-views/live_video.dart';
import 'package:soulgood/client-side-views/live_video_on_audio.dart';
import 'package:soulgood/client-side-views/looking_for.dart';
import 'package:soulgood/client-side-views/organisation_code.dart';
import 'package:soulgood/models/all_user_data.dart';
import 'package:soulgood/models/assigned_customer_support.dart';
import 'package:soulgood/models/assigned_therapist.dart';
import 'package:soulgood/models/chat_Data.dart';
import 'package:soulgood/models/for_therapist_upcoming_data.dart';
import 'package:soulgood/models/session_detail.dart';
import 'package:soulgood/models/session_history.dart';
import 'package:soulgood/models/session_history_data.dart';
import 'package:soulgood/models/therapist_data.dart';
import 'package:soulgood/therapist-side-view/live_call.dart';
import 'package:soulgood/therapist-side-view/live_video_for_therapist.dart';
import 'package:soulgood/therapist-side-view/session_history.dart';
import 'package:soulgood/utils/app_language.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// import 'package:timezone/browser.dart' as tz;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:mime/mime.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulgood/Widget/bottom_app_bar_custom.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/client-side-views/counsellor.dart';
import 'package:soulgood/client-side-views/counsellor_lang.dart';
import 'package:soulgood/client-side-views/diseases.dart';
import 'package:soulgood/client-side-views/doct_lang.dart';
import 'package:soulgood/client-side-views/finding_your_counsellor.dart';
import 'package:soulgood/client-side-views/gender.dart';
import 'package:soulgood/client-side-views/log.dart';
import 'package:soulgood/client-side-views/payment_success.dart';
import 'package:soulgood/client-side-views/suicidal_help.dart';
import 'package:soulgood/client-side-views/suicidal_idea.dart';
import 'package:soulgood/common/index.dart';
import 'package:soulgood/forgetpasss/otp.dart';
import 'package:soulgood/models/appointment_data.dart';
import 'package:soulgood/models/blogs.dart';
import 'package:soulgood/models/get_therapist_notes.dart';
import 'package:soulgood/models/package.dart';
import 'package:soulgood/models/paid_clients.dart';
import 'package:soulgood/models/paid_clients_list.dart';
import 'package:soulgood/models/patient_journal.dart';
import 'package:soulgood/models/problem.dart';
import 'package:soulgood/models/slots.dart';
import 'package:soulgood/models/subscription_logs.dart';
import 'package:soulgood/models/therapist_report_patient.dart';
import 'package:soulgood/models/user.dart';
import 'package:soulgood/models/user_plan.dart';
import 'package:soulgood/registeration-login/login_tab_bar.dart';
import 'package:soulgood/utils/constants.dart';
import 'package:soulgood/utils/extensions.dart';
import 'package:soulgood/utils/font_utils.dart';
import 'package:soulgood/viewModels/navigation_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';

// import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulgood/Widget/bottom_app_bar.dart';
import 'package:soulgood/Widget/error_widget.dart';
import 'package:soulgood/Widget/therapis_bottom_app_bar.dart';
import 'package:soulgood/forgetpasss/create_new_pass.dart';
import 'package:soulgood/forgetpasss/encripted.dart';
import 'package:soulgood/forgetpasss/otp_before_create_pass.dart';
import 'package:soulgood/forgetpasss/verify_email.dart';
import 'package:soulgood/onboard/on_board.dart';
import 'package:soulgood/registeration-login/login.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dialog_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:get_it/get_it.dart';
import 'package:get/get.dart';
import '../client-side-views/update_payment.dart';
import '../main.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:simple_moment/simple_moment.dart';
import '../models/appointment_upcoming_data.dart';

class MainViewModel extends BaseViewModel {
  // final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();
  //
  // Completer<GoogleMapController> controller = Completer();
  // final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  var navigationService = navigationViewModel;
  var navigation_Service = Navigation_Service();

  // late SharedPreferences prefs;
  final mapSearchController = TextEditingController();
  final searchScreenController = TextEditingController();
  final friendListSearchController = TextEditingController();
  bool openGroupMenu = false;
  bool privateGroupSelected = false;
  bool publicGroupSelected = false;
  bool deleteSelected = false;
  bool deleteUnselected = false;
  XFile? _pickedFile;
  File? profileFileImage;
  bool emojiShowing = false;
  bool emojiSelected = false;
  final chatController = TextEditingController();
  AppLanguage appLanguage = locator<AppLanguage>();
  int selectedAppLanguage = 0;
  bool groupScreenEmojiShowing = false;
  bool groupScreenEmojiSelected = false;
  final groupScreenChatController = TextEditingController();
  final myContactsSearchController = TextEditingController();
  bool myContactEmojiShowing = false;
  bool myContactEmojiSelected = false;
  final myContactsChatController = TextEditingController();
  bool eventSelected = false;
  int? currentEventSelected;
  bool timeSelected = false;
  int? timeValue;
  double sliderValue = 0.0;
  String? lowValue = "50";
  String? highValue = "180";
  bool bottomSheetSelected = false;
  bool messageScreenEmojiShowing = false;
  bool messageScreenEmojiSelected = false;
  final messageScreenChatController = TextEditingController();
  bool userNewsFeed = false;

  double lowerValue = 50;
  double upperValue = 180;

  bool selectedBtn = true;
  bool selectedBtn1 = true;
  bool selectedTxF = true;
  bool selectedpass = true;
  bool changeselectedpass = true;
  bool cselectedpass = true;
  bool validate = false;
  bool phone = true;
  int selectedGender = 0;
  int selectedDisease = 0;
  int selectedCounsellor = 0;
  int selectionOfPages = 1;
  int selectionOfTherapist = 0;
  bool selectedSuicidalIdea = false;
  int selectedSuicidal = 0;
  int hadTherapistOrCoach = 0;
  int? selectedDropDownItem;
  int? selectedDropDownItemWhatYouBring;
  int? selectedDropDownItemHowDidYouhear;
  int? selectedDropDownItemAnythingElse;
  int? selectedDropDownLanguage;
  bool selectedSuicidalHelp = false;
  int homeNavigtor = 0;
  int? selectedTime;
  String? selectedTimeForAppointment;
  int selectedReTime = 0;
  bool mic = false;
  bool mic1 = false;
  bool colorDropdown = false;
  bool selectTime = false;
  bool buttonVisible = false;
  bool floating = false;
  bool focusTextField = false;
  bool onPressed = false;
  bool dropDownPressed = false;
  bool dropDownOfBringsYou = false;
  bool dropDownOfHowDidYouHearAboutUs = false;
  bool dropDownOfDescribtionForTherapist = false;
  bool dropDownOfAnythingElse = false;
  bool languageDropDownPressed = false;
  final isRecording = false;
  int selectedSessionHistory = 0;
  int selectedLanguage = 0;
  String? selectedLang;
  final otp = TextEditingController();
  final search = TextEditingController();
  final therapistChat = TextEditingController();
  final afterSubChat = TextEditingController();
  final customerSupportChat = TextEditingController();
  final tellUsMore = TextEditingController();
  final changeName = TextEditingController();
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  ScrollController therapistChatController = ScrollController();
  ScrollController CustomerSuppChatScroll = ScrollController();
  ScrollController afterSubChatScroll = ScrollController();
  final therapistCurrentPassword = TextEditingController();
  final theNewPassword = TextEditingController();
  final therapaistConfirmPassword = TextEditingController();
  final scrollController = ItemScrollController();
  final journalDes = TextEditingController();
  final journaltitle = TextEditingController();
  final codeController = TextEditingController();
  final textEditor = HtmlEditorController();
  final textEditor1 = HtmlEditorController();
  final textEditor2 = HtmlEditorController();
  final textEditor3 = HtmlEditorController();
  final codeFocus = FocusNode();
  String description1 = 'My great package';
  TextEditingController controller = TextEditingController();
  bool emergency = false;
  final sectionFormKey = GlobalKey<FormState>();
  final clientloginKey = GlobalKey<FormState>();
  final clientRegisterKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  String result = "";
  final onBoard =
      PageController(keepPage: true, initialPage: 0, viewportFraction: 0.8);
  SharedPreferences? sharedPreferences;
  User1 user1 = User1();
  String userEmail = "";
  int selectedApplicationLanguage = 0;
  String username = "";
  String userId = "";
  String userToken = "";
  String emcName = "";
  String emcRelation = "";
  String emcPhoneNumber = "";
  int? id;
  String title = "";
  String title_in_chinese = "";
  String author_name = "";
  String posted_date = "";
  String description = "";
  String description_in_chinese = "";
  String image = "";
  String createdAt = "";
  String updatedAt = "";
  String facebookUserId = "";
  String selectedDropDownLang = "";
  String yourLanguage = "";
  //int selectedBlog = 0;
  // List<String> locations = ['image','English (US)', 'B'];
  // String selectedva = "";
  ImagePicker imagePick = ImagePicker();
  XFile? file;
  var dateUtc = DateTime.now().toUtc();
  List<String> selectedName = [];
  List<String> selectedNameofBring = [];
  List<String> selectedNameofDescribe = [];
  List<String> selectedNameofAnythingElse = [];
  List<String> selectedNameofHowDidYouHear = [];
  List therapistChatUpperlist = [
    {'image': ImageUtils.info, 'name': 'INFO'},
    {'image': ImageUtils.journal, 'name': 'Journal'},
    {'image': ImageUtils.thereport, 'name': 'Report'},
    {'image': ImageUtils.historySession, 'name': 'Session\nHistory'},
  ];

  List<String> fonts = [
    'Billabong',
    'AlexBrush',
    'Allura',
    'Arizonia',
    'ChunkFive',
    'GrandHotel',
    'GreatVibes',
    'Lobster',
    'OpenSans',
    'OstrichSans',
    'Oswald',
    'Pacifico',
    'Quicksand',
    'Roboto',
    'SEASRN',
    'Windsong',
  ];
  List<Color> paletteColors = [
    Colors.black,
    Colors.white,
    Color(int.parse('0xffEA2027')),
    Color(int.parse('0xff006266')),
    Color(int.parse('0xff1B1464')),
    Color(int.parse('0xff5758BB')),
    Color(int.parse('0xff6F1E51')),
    Color(int.parse('0xffB53471')),
    Color(int.parse('0xffEE5A24')),
    Color(int.parse('0xff009432')),
    Color(int.parse('0xff0652DD')),
    Color(int.parse('0xff9980FA')),
    Color(int.parse('0xff833471')),
    Color(int.parse('0xff112CBC4')),
    Color(int.parse('0xffFDA7DF')),
    Color(int.parse('0xffED4C67')),
    Color(int.parse('0xffF79F1F')),
    Color(int.parse('0xffA3CB38')),
    Color(int.parse('0xff1289A7')),
    Color(int.parse('0xffD980FA'))
  ];
  TextStyle? textStyle;
  TextAlign? textAlign;
  bool edit = false;
  List fixedSlots = [
    {'time': '06:00'},
    {'time': '07:00'},
    {'time': '08:00'},
    {'time': '09:00'},
    {'time': '10:00'},
    {'time': '11:00'},
    {'time': '12:00'},
    {'time': '13:00'},
    {'time': '14:00'},
    {'time': '15:00'},
    {'time': '16:00'},
    {'time': '17:00'},
    {'time': '18:00'},
    {'time': '19:00'},
    {'time': '20:00'},
    {'time': '21:00'},
    {'time': '22:00'},
    {'time': '23:00'},
  ];
  var checkLang;
  int cehclLang1 = 0;
  final List<Map<String, dynamic>> language = [
    {
      "id": 0,
      "name": "English",
    },
    {
      "id": 2,
      "name": "廣東話 (Cantonese)",
    },
    {
      "id": 3,
      "name": "普通話 (Mandarin)",
    },
  ];

  final List<Map<String, dynamic>> roles = [
    {
      "image": ImageUtils.eng,
      "name": "English (US)",
    },
    {
      "image": ImageUtils.china,
      "name": "中文",
    },
  ];
  final List<Map<String, dynamic>> country = [
    {
      "id": 0,
      "name": "Hong Kong",
      "nameInChinese": "香港",
    },
    {
      "id": 1,
      "name": "Singapore",
      "nameInChinese": "新加坡",
    },
    {
      "id": 2,
      "name": "Malaysia",
      "nameInChinese": "馬來西亞",
    },
    {
      "id": 3,
      "name": "Indonesia",
      "nameInChinese": "印尼",
    },
    {
      "id": 4,
      "name": "Thailand",
      "nameInChinese": "泰國",
    },
    {
      "id": 5,
      "name": "Philippines",
      "nameInChinese": "菲律賓",
    },
    {
      "id": 6,
      "name": "Vietnam",
      "nameInChinese": "越南",
    },
    {
      "id": 7,
      "name": "Australia",
      "nameInChinese": "澳洲",
    },
  ];

  final List<Map<String, dynamic>> brignsYou = [
    {
      "id": 0,
      "name": "Improve wellbeing and health",
      "nameInChinese": "改善身心健康",
    },
    {
      "id": 1,
      "name": "Personal growth / Getting to know myself",
      "nameInChinese": "個人成長/更了解自己",
    },
    {
      "id": 2,
      "name": "Career support",
      "nameInChinese": "事業教練/指導",
    },
    {
      "id": 3,
      "name": "Relationships / Family",
      "nameInChinese": "關係/家庭",
    },
    {
      "id": 4,
      "name": "Stress or life events",
      "nameInChinese": "壓力或人生事件",
    },
    {
      "id": 5,
      "name": "Mood problems",
      "nameInChinese": "情緒問題",
    },
    {
      "id": 6,
      "name": "Others",
      "nameInChinese": "其他",
    },
  ];
  final List<Map<String, dynamic>> howDidYouHear = [
    {
      "id": 0,
      "name": "Google",
      "nameInChinese": "改善身心健康",
    },
    {
      "id": 1,
      "name": "Facebook",
      "nameInChinese": "個人成長/更了解自己",
    },
    {
      "id": 2,
      "name": "Instagram",
      "nameInChinese": "事業教練/指導",
    },
    {
      "id": 3,
      "name": "Friends or Referral",
      "nameInChinese": "關係/家庭",
    },
    {
      "id": 4,
      "name": "Press / News",
      "nameInChinese": "壓力或人生事件",
    },
    {
      "id": 5,
      "name": "Organisation",
      "nameInChinese": "情緒問題",
    },
    {
      "id": 6,
      "name": "Insurance",
      "nameInChinese": "其他",
    },
  ];
  final List<Map<String, dynamic>> bestDescribtionForTherapist = [
    {
      "id": 0,
      "name": "Career support, Goals setting",
      "nameInChinese": "事業支援和教練",
    },
    {
      "id": 1,
      "name": "Someone who can listen and provide guidance",
      "nameInChinese": "聆聽我的苦惱及支持我",
    },
    {
      "id": 2,
      "name": "Help with relationships",
      "nameInChinese": "幫助解決個人關係問題",
    },
    {
      "id": 3,
      "name": "Adjusting or coping with stress / life events",
      "nameInChinese": "面對壓力或人生事件",
    },
    {
      "id": 4,
      "name": "Mindfulness",
      "nameInChinese": "靜觀訓練 ",
    },
    {
      "id": 5,
      "name": "Analyse and change thought processes",
      "nameInChinese": "分析及改變我的想法",
    },
    {
      "id": 6,
      "name": "Explore past trauma or experiences",
      "nameInChinese": "了解過往的創傷",
    },
    {
      "id": 7,
      "name": "Others",
      "nameInChinese": "其他",
    },
    {
      "id": 8,
      "name": "Not sure",
      "nameInChinese": "不肯定",
    },
  ];
  final List<Map<String, dynamic>> anythingElse = [
    {
      "id": 0,
      "name": "Depression",
      "nameInChinese": "改善身心健康",
    },
    {
      "id": 1,
      "name": "Post Traumatic Stress Disorder ",
      "nameInChinese": "個人成長/更了解自己",
    },
    {
      "id": 2,
      "name": "Anxiety",
      "nameInChinese": "事業教練/指導",
    },
    {
      "id": 3,
      "name": "Stress",
      "nameInChinese": "關係/家庭",
    },
    {
      "id": 4,
      "name": "Family and Relationships",
      "nameInChinese": "壓力或人生事件",
    },
    {
      "id": 5,
      "name": "Obsessive Compulsive Symptoms",
      "nameInChinese": "情緒問題",
    },
    {
      "id": 6,
      "name": "None of the above",
      "nameInChinese": "其他",
    },
  ];

  Map selectedrole = {
    "image": ImageUtils.eng,
    "name": "English (US)",
  };

  List alphabets = [
    {
      "alphabets": "A",
    },
    {
      "alphabets": "B",
    },
    {
      "alphabets": "C",
    },
    {
      "alphabets": "D",
    },
    {
      "alphabets": "E",
    },
    {
      "alphabets": "F",
    },
    {
      "alphabets": "G",
    },
    {
      "alphabets": "I",
    },
    {
      "alphabets": "J",
    },
    {
      "alphabets": "K",
    },
    {
      "alphabets": "L",
    },
    {
      "alphabets": "M",
    },
    {
      "alphabets": "N",
    },
    {
      "alphabets": "O",
    },
    {
      "alphabets": "P",
    },
    {
      "alphabets": "Q",
    },
    {
      "alphabets": "R",
    },
    {
      "alphabets": "S",
    },
    {
      "alphabets": "T",
    },
    {
      "alphabets": "U",
    },
    {
      "alphabets": "V",
    },
    {
      "alphabets": "W",
    },
    {
      "alphabets": "X",
    },
    {
      "alphabets": "Y",
    },
    {
      "alphabets": "Z",
    },
  ];
  List elements = [
    {'name': 'John', 'group': 'Team A'},
    {'name': 'Will', 'group': 'Team B'},
    {'name': 'Beth', 'group': 'Team A'},
    {'name': 'Miranda', 'group': 'Team B'},
    {'name': 'Mike', 'group': 'Team C'},
    {'name': 'Danny', 'group': 'Team C'},
  ];

  List<int> sessionHistorySelection = [];
  final List<Map<String, dynamic>> sessionHistory = [
    {
      "name": "Amelia",
    },
    {
      "name": "Ava Johnson",
    },
    {
      "name": "Bobby",
    },
    {
      "name": "Benson",
    },
    {
      "name": "Amelia",
    },
    {
      "name": "Ava Johnson",
    },
    {
      "name": "Benson",
    },
  ];

  final List<Map<String, dynamic>> sessionHistoryList = [
    {
      "date": "14",
      "month": "Aug",
      "name": "Amelia Clark",
      "time": "08: 17 AM",
      "problem": "Depression & Stress",
      "duration": "Duration: 30 Minutes"
    },
    {
      "date": "14",
      "month": "Aug",
      "name": "Amelia Clark",
      "time": "08: 17 AM",
      "problem": "Depression & Stress",
      "duration": "Duration: 30 Minutes"
    },
    {
      "date": "14",
      "month": "Aug",
      "name": "Amelia Clark",
      "time": "08: 17 AM",
      "problem": "Depression & Stress",
      "duration": "Duration: 30 Minutes"
    },
    {
      "date": "14",
      "month": "Aug",
      "name": "Amelia Clark",
      "time": "08: 17 AM",
      "problem": "Depression & Stress",
      "duration": "Duration: 30 Minutes"
    },
    {
      "date": "14",
      "month": "Aug",
      "name": "Amelia Clark",
      "time": "08: 17 AM",
      "problem": "Depression & Stress",
      "duration": "Duration: 30 Minutes"
    },
    {
      "date": "14",
      "month": "Aug",
      "name": "Amelia Clark",
      "time": "08: 17 AM",
      "problem": "Depression & Stress",
      "duration": "Duration: 30 Minutes"
    },
    {
      "date": "14",
      "month": "Aug",
      "name": "Amelia Clark",
      "time": "08: 17 AM",
      "problem": "Depression & Stress",
      "duration": "Duration: 30 Minutes"
    },
    {
      "date": "14",
      "month": "Aug",
      "name": "Amelia Clark",
      "time": "08: 17 AM",
      "problem": "Depression & Stress",
      "duration": "Duration: 30 Minutes"
    },
  ];

  // final List<Map<String, dynamic>> Task_Goals = [
  //   {
  //     "name": "Task & Goals",
  //   },
  //   {
  //     "name": "Corona Virus",
  //   },
  //   {
  //     "name": "Flu",
  //   },
  //   {
  //     "name": "Cough",
  //   },
  //   {
  //     "name": "Cold",
  //   },
  // ];

  // final List<Map<String, dynamic>> completed_Task_Goals = [
  //   {
  //     "name": "Completed Task & Goals",
  //   },
  //   {
  //     "name":
  //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse pulvinar odio a odio congue placerat. Fusce sit amet accumsan diam.",
  //   },
  // ];

  List selectedDiseases = [];

  static const appId = "4f9c6481baad4525a29746d4eed088e6";
  // static const token =
  //     "006e2340f4f23ed4a5088cc55e53f57927fIADbCAMq+tjFg5VLn6r7W2EoNHRv0wJrjmopa3Ye//AwDItPAgwAAAAAEABGkIsg5IvFYQEAAQDki8Vh";

  void animateController() {
    // therapistChatController.animateTo(therapistChatController.position.maxScrollExtent, duration: Duration(seconds: 2), curve: Curves.easeIn);
    therapistChatController.jumpTo(
      therapistChatController.position.maxScrollExtent,
    );
  }

  getCallToken(String channel, String uid) async {
    try {
      // final ioc = new HttpClient();
      // // ioc.badCertificateCallback =
      // //     (X509Certificate cert, String host, int port) => true;
      // final http = new IOClient(ioc);
      // https: //agora-token-generator--test.herokuapp.com/generatetoken?channel=abc
      var url = Uri.parse(
          'https://agora-token-generator--test.herokuapp.com/generatetoken?channel=$channel');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body)["token"];
      } else {
        throw Exception('Failed to load token');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  var remoteUid;
  RtcEngine? engine;

  renderLocalPreview() {
    return Transform.rotate(
        angle: 90 * 0.0 / 180, child: RtLocalView.SurfaceView());
  }

  bool offVideo = false;
  bool offVideo1 = false;
  renderRemoteVideo() {
    if (remoteUid != null) {
      print(remoteUid);
      return RtcRemoteView.SurfaceView(
        uid: remoteUid,
      );
    } else {
      return Stack(children: [
        Container(
          color: ColorUtils.black,
        ),
        Center(
          child: Text(
            "Please Wait For Remote User To Join",
            style: TextStyle(color: ColorUtils.white),
            textAlign: TextAlign.center,
          ),
        ),
      ]);
    }
  }

  switchCamera() {
    RtLocalView.SurfaceView();
    engine!.switchCamera();
  }

  bool cameraOpen = false;
  bool cameraOpen1 = false;
  onCamera() async {
    if (cameraOpen == false) {
      engine!.enableLocalVideo(cameraOpen);
      print(engine!.enableLocalVideo(cameraOpen));
      // RtcRemoteView.SurfaceView(
      //   uid: remoteUid,
      //   renderMode:
      //       cameraOpen == true ? VideoRenderMode.Hidden : VideoRenderMode.FILL,
      // );
    } else {
      engine!.enableLocalVideo(cameraOpen);
      // engine!.startPreview();
      // await  engine!.stopPreview();
      print(engine!.enableLocalVideo(cameraOpen));

      // RtcRemoteView.SurfaceView(
      //   uid: remoteUid,
      //   renderMode:
      //       cameraOpen == true ? VideoRenderMode.Hidden : VideoRenderMode.FILL,
      // );
    }
  }

  onCameraFT() {
    if (cameraOpen1 == true) {
      engine!.enableLocalVideo(cameraOpen1);
      // engine!.stopPreview();
    } else {
      engine!.enableLocalVideo(cameraOpen1);
      // engine!.startPreview();
    }

    // RtcRemoteView.SurfaceView(
    //   uid: remoteUid,
    //   renderMode:
    //       cameraOpen1 == true ? VideoRenderMode.Hidden : VideoRenderMode.FILL,
    // );
  }

  micOnAndOff() {
    if (mic == true) {
      //engine!.enableAudio();
      engine!.enableLocalAudio(mic);
    } else {
      //engine!.disableAudio();
      engine!.enableLocalAudio(mic);
    }
  }

  micOnAndOffFT() {
    if (mic1 == true) {
      engine!.enableLocalAudio(mic1);
    } else {
      engine!.enableLocalAudio(mic1);
    }
  }

  callEnd() {
    engine!.leaveChannel();
  }

  Future<void> initForAgora() async {
    // Retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    //engine = await RtcEngine.createWithConfig(RtcEngineConfig(appId));
    RtcEngineContext engineContext = RtcEngineContext(appId);
    engine = await RtcEngine.createWithContext(engineContext);

    await engine!.enableVideo();
    engine!.setEventHandler(RtcEngineEventHandler(userMuteVideo: (uid, muted) {
      print(muted);
      print(uid);
    }, userMuteAudio: (uid, mic) {
      print("object muted");
    }, cameraFocusAreaChanged: (rect) {
      print(rect);
    }, joinChannelSuccess: (String channel, int uid, int elapsed) {
      print("local user $uid joined");
    }, userJoined: (int uid, int elapsed) {
      print("Remote user $uid joined");
      remoteUid = uid;
      notifyListeners();
    }, userOffline: (int uid, UserOfflineReason reason) {
      print("local user $uid left channel");
      remoteUid = null;
      notifyListeners();
    }));
    //  await joinSessionByPatient();
    String token = await joinSessionByPatientCheck();

    // String token = await getCallToken("sessionChannel!", userId);

    // await engine!.joinChannel(token, 'sessionChannel!', null, 0);
    await engine!.joinChannelWithUserAccount(token, sessionChannel!, userId);

    notifyListeners();
  }

  Future<void> initForAgoraForAudioCall() async {
    // Retrieve permissions
    await [Permission.microphone].request();

    //create the engine
    //engine = await RtcEngine.createWithConfig(RtcEngineConfig(appId));
    RtcEngineContext engineContext = RtcEngineContext(appId);
    engine = await RtcEngine.createWithContext(engineContext);

    await engine!.disableVideo();
    engine!.setEventHandler(RtcEngineEventHandler(userMuteVideo: (uid, muted) {
      print(muted);
      print(uid);
    }, userMuteAudio: (uid, mic) {
      print("object muted");
    }, cameraFocusAreaChanged: (rect) {
      print(rect);
    }, joinChannelSuccess: (String channel, int uid, int elapsed) {
      print("local user $uid joined");
    }, userJoined: (int uid, int elapsed) {
      print("Remote user $uid joined");
      remoteUid = uid;
      notifyListeners();
    }, userOffline: (int uid, UserOfflineReason reason) {
      print("local user $uid left channel");
      remoteUid = null;
      notifyListeners();
    }));
    //  await joinSessionByPatient();
    String token = await joinSessionByPatientCheck();

    // String token = await getCallToken("sessionChannel!", userId);

    // await engine!.joinChannel(token, 'sessionChannel!', null, 0);
    await engine!.joinChannelWithUserAccount(token, sessionChannel!, userId);

    notifyListeners();
  }

  Future<void> initForAgoraForTherapist() async {
    // Retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    RtcEngineContext engineContext = RtcEngineContext(appId);
    engine = await RtcEngine.createWithContext(engineContext);

    await engine!.enableVideo();
    engine!.setEventHandler(RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
      print("local user $uid joined");
    }, userJoined: (int uid, int elapsed) {
      print("Remote user $uid joined");
      remoteUid = uid;
      notifyListeners();
    }, userOffline: (int uid, UserOfflineReason reason) {
      print("local user $uid left channel");
      remoteUid = null;
      notifyListeners();
    }));
    //  await joinSessionByPatient();
    String token = await joinSessionByTherapistForToken();

    await engine!
        .joinChannelWithUserAccount(token, sessionChannel!, therapistId);

    notifyListeners();
  }

  Future<void> initForAgoraOnCallForTherapist() async {
    // Retrieve permissions
    await [Permission.microphone].request();

    //create the engine
    RtcEngineContext engineContext = RtcEngineContext(appId);
    engine = await RtcEngine.createWithContext(engineContext);

    await engine!.disableVideo();
    engine!.setEventHandler(RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
      print("local user $uid joined");
    }, userJoined: (int uid, int elapsed) {
      print("Remote user $uid joined");
      remoteUid = uid;
      notifyListeners();
    }, userOffline: (int uid, UserOfflineReason reason) {
      print("local user $uid left channel");
      remoteUid = null;
      notifyListeners();
    }));
    //  await joinSessionByPatient();
    String token = await joinSessionByTherapistForToken();

    await engine!
        .joinChannelWithUserAccount(token, sessionChannel!, therapistId);

    notifyListeners();
  }

  String? errorMessage;

  void showErrorMessage(String error) async {
    errorMessage = error;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    errorMessage = null;
    notifyListeners();
  }

  // registerUser() async {
  //   try {
  //     if (password.text.toString() != cpassword.text.toString()) {

  //     }
  //     var data = {
  //       'email': email.text.toString(),
  //       'password': password.text.toString()
  //     };
  //     String encodedData = jsonEncode(data);
  //     var response = await http.post(
  //         Uri.https('api.soulgoodhealth.com:5000', '/createPatient'),
  //         headers: {
  //           "content-type": "application/json",
  //           "accept": "application/json",
  //         },
  //         body: encodedData);
  //     var jsonData = jsonDecode(response.body);
  //     print(jsonData);
  //     if (response.statusCode == 200) {
  //       print("registered!!");
  //     }
  //   } catch (e) {
  //     print("is printing error");
  //     print(e);
  //   }
  // }

  FocusNode emailFocus = FocusNode();
  bool isEmailInFocus = false;
  final email = TextEditingController();

  void onEmailFocus() {
    if (emailFocus.hasFocus) {
      isEmailInFocus = true;
    } else {
      isEmailInFocus = false;
    }
    notifyListeners();
  }

  FocusNode passwordFocus = FocusNode();
  bool isPasswordInFocus = false;
  final password = TextEditingController();

  void onPasswordFocus() {
    if (passwordFocus.hasFocus) {
      isPasswordInFocus = true;
    } else {
      isPasswordInFocus = false;
    }
    notifyListeners();
  }

  FocusNode NewpasswordFocus = FocusNode();
  bool isNewPasswordInFocus = false;
  final newpassword = TextEditingController();

  void onNewPasswordFocus() {
    if (NewpasswordFocus.hasFocus) {
      isNewPasswordInFocus = true;
    } else {
      isNewPasswordInFocus = false;
    }
    notifyListeners();
  }

  FocusNode CNewpasswordFocus = FocusNode();
  bool isCNewPasswordInFocus = false;
  final cnewpassword = TextEditingController();

  void onCNewPasswordFocus() {
    if (CNewpasswordFocus.hasFocus) {
      isCNewPasswordInFocus = true;
    } else {
      isCNewPasswordInFocus = false;
    }
    notifyListeners();
  }

  void check() {
    if (selectedSuicidalIdea == true) {
      navigateToSuicidalHelp();
    } else if (selectedSuicidalHelp == true) {
      navigateToTellUsMore();
    } else {
      DialogUtils().showDialog(MyErrorWidget(error: "PLease Select Any One!"));
    }
  }

  bool individualSelect = false;
  bool EmployeeSelect = false;

  void checkForJoiningAs() {
    if (individualSelect == true) {
      selectionOfPages = 3;
      notifyListeners();
    } else if (EmployeeSelect == true) {
      selectionOfPages++;
      notifyListeners();
    } else {
      DialogUtils().showDialog(MyErrorWidget(error: "PLease Select Any One!"));
    }
  }

  bool coachingSelect = false;
  bool TherapistSelect = false;

  void checkForLookingFor() {
    if (coachingSelect == true) {
      selectionOfPages++;
      // individualSelect = false;
      notifyListeners();
      // navigation_Service.navigateTo(to: ExtraInformation());
    } else if (TherapistSelect == true) {
      selectionOfPages++;
      // individualSelect = false;

      notifyListeners();
      // navigation_Service.navigateTo(to: ExtraInformation());
    } else {
      DialogUtils().showDialog(MyErrorWidget(error: "PLease Select Any One!"));
    }
  }
  // void phoneNumber(){
  //   if(Phone.text.length>15){
  //     ScaffoldMessenger.of(navigationService.navigationKey.currentContext!).showSnackBar(SnackBar(content: const Text("must be 15 digits")));
  //   }
  // }

  FocusNode CpasswordFocus = FocusNode();
  bool isCPasswordInFocus = false;
  final cpassword = TextEditingController();

  void onCPasswordFocus() {
    if (CpasswordFocus.hasFocus) {
      isCPasswordInFocus = true;
    } else {
      isCPasswordInFocus = false;
    }
    notifyListeners();
  }

  FocusNode LemailFocus = FocusNode();
  bool isLEmailInFocus = false;
  final lemail = TextEditingController();

  void onLEmailFocus() {
    if (LemailFocus.hasFocus) {
      isLEmailInFocus = true;
    } else {
      isLEmailInFocus = false;
    }
    notifyListeners();
  }

  FocusNode LpasswordFocus = FocusNode();
  bool isLPasswordInFocus = false;
  final lpassword = TextEditingController();

  void onLPasswordFocus() {
    if (LpasswordFocus.hasFocus) {
      isLPasswordInFocus = true;
    } else {
      isLPasswordInFocus = false;
    }
    notifyListeners();
  }

  FocusNode FemailFocus = FocusNode();
  bool isFEmailInFocus = false;
  final femail = TextEditingController();

  void FonEmailFocus() {
    if (FemailFocus.hasFocus) {
      isFEmailInFocus = true;
    } else {
      isFEmailInFocus = false;
    }
    notifyListeners();
  }

  FocusNode phoneFocus = FocusNode();
  bool isPhoneInFocus = false;
  final Phone = TextEditingController();

  void onPhoneFocus() {
    if (phoneFocus.hasFocus) {
      isPhoneInFocus = true;
    } else {
      isPhoneInFocus = false;
    }
    notifyListeners();
  }

  FocusNode ageFocus = FocusNode();
  bool isAgeInFocus = false;
  final age = TextEditingController();

  void onAgeFocus() {
    if (ageFocus.hasFocus) {
      isAgeInFocus = true;
    } else {
      isAgeInFocus = false;
    }
    notifyListeners();
  }

  FocusNode nameFocus = FocusNode();
  bool isNameInFocus = false;
  final name = TextEditingController();

  void onNameFocus() {
    if (nameFocus.hasFocus) {
      isNameInFocus = true;
    } else {
      isNameInFocus = false;
    }
    notifyListeners();
  }

  List diseases = [
    "Anxiety Disorder",
    "Behavioural Disorder",
    "Emotional Disorder",
    "Paranoia",
    "Bipolar Affective Disorder",
    "Depression",
    "Eating Disorders",
    "Psychosis",
  ];

  List chat = [
    {
      'image': ImageUtils.chan,
      'name': "Karen Chan",
      'detail': "Your Therapist"
    },
    {'image': ImageUtils.support, 'name': "Customer Support", 'detail': " "},
  ];

  List tools = [
    {
      'image': ImageUtils.chats,
      'name': "user_db_sidebar_text_1",
      'detail': "No sessions scheduled"
    },
    {
      'image': ImageUtils.session,
      'name': "user_db_home_text_5",
      'detail': "No sessions scheduled"
    },
    {
      'image': ImageUtils.report,
      'name': "user_db_home_text_6",
      'detail': "View detailed reports"
    },
    {
      'image': ImageUtils.journey,
      'name': "user_db_home_text_7",
      'detail': "View your journals"
    },
    {
      'image': ImageUtils.helpZone,
      'name': "user_db_home_text_8",
      'detail': "View our curated mental health tips"
    },
    {
      'image': ImageUtils.manage,
      'name': "user_db_home_text_9",
      'detail': "Subscriptions"
    },
  ];

  List reports = [
    {'date': 'August, 2021', 'detail': 'Monthly Report by Ashfaq'},
    // {'date': 'July, 2021', 'detail': 'Monthly Report by Nikki Cross'},
    // {'date': 'June, 2021', 'detail': 'Monthly Report by Nikki Cross'},
    // {'date': 'May, 2021', 'detail': 'Monthly Report by Nikki Cross'},
    // {'date': 'April, 2021', 'detail': 'Monthly Report by Nikki Cross'},
    // {'date': 'March, 2021', 'detail': 'Monthly Report by Nikki Cross'},
    // {'date': 'February, 2021', 'detail': 'Monthly Report by Nikki Cross'},
  ];

  List<Problems> problems = [];
  List<PatientJournals> patientjournal = [];
  List<ApiBlogs> jsonConvert = [];
  ApiBlogs? selectedBlog;
  List<PaidClients> paidClients = [];
  List<PaidClientsList> paidClientsList = [];
  List<PatientJournals> clientJournalForTherapist = [];
  List<therapistReports> reportList = [];
  List<therapistNotes> notesList = [];
  therapistReports? selectedReport;

  // var list = [];
  //
  // void disease (){
  //  for(var i in list){
  //    list.add(diseases);
  //  return disease();
  //  }
  // }

  // List<bool>? selected;
  // bool? selectedValue;
  // int? currentIndex;
  // List groupList = [];
  // Map<dynamic,dynamic> groupMap = {};
  //
  // int drinkMotivationValue = 1;
  // String drinkMotivationValueStr = "Drink light";
  // List<String> drinkMotivationList = ["Drink light", "Drink normal", "Drink hard"];
  // Map<String, int> drinkMotivationMap = {
  //   'Drink light': 1,
  //   'Drink normal': 2,
  //   'Drink hard': 3,
  // };

  // int drinkIndex = -1;
  // List<int> drinkIndexList = [];
  //
  // List<String> interestList = ["White Wine", "Hard Seltzer", "Whiskey", "Club 1", "Club 2", "Goldstrand"];
  //
  // Future<bool> openCamera() async {
  //   ImagePicker picker = ImagePicker();
  //   var image = await picker.pickImage(source: ImageSource.camera);
  //   _pickedFile = image;
  //   if(_pickedFile != null){
  //     profileFileImage = File(_pickedFile!.path);
  //   }
  //   if (profileFileImage==null)
  //   {
  //     return false;
  //   }
  //   else{
  //     notifyListeners();
  //     return true;
  //   }
  // }

  Future<bool> getImage() async {
    ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    _pickedFile = image;
    if (_pickedFile != null) {
      profileFileImage = File(_pickedFile!.path);
      print(profileFileImage);
    }
    if (profileFileImage == null) {
      return false;
    } else {
      notifyListeners();
      return true;
    }
  }

  int? planType;
  String userPhoneNumber = "";
  String userkaGender = "";
  bool isLoading1 = false;
  bool isPatient = false;
  bool istherapist = false;
  loginAccount() async {
    isPatient = true;
    if (lemail.text.isEmpty) {
      showErrorMessage("Please Enter Your EmailAddres");
    } else if (!lemail.text.isEmail) {
      showErrorMessage("invalid EmailAddres");
    } else if (lpassword.text.isEmpty) {
      showErrorMessage("Please Enter Your Password");
    } else {
      isLoading1 = true;
      notifyListeners();

      var data = {
        'email': lemail.text.toString(),
        'password': lpassword.text.toString()
      };
      String encodedData = jsonEncode(data);

      var response = await http.post(
          Uri.https(Constants.baseUrl, Constants.loginUser),
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json'
          },
          body: encodedData);

      var jsonData = jsonDecode(response.body);
      print(jsonData);
      if (response.statusCode == 200) {
        sharedPreferences!.setString('UserId', jsonData['data']['userId']);
        sharedPreferences!
            .setString('userToken', jsonData['data']['tokens']['accessToken']);
        sharedPreferences!.setString('userEmail', lemail.text.toString());
        sharedPreferences!.setBool('isPatient', isPatient);
        // userAllData();
        User1 user1 = User1.withData(
          null,
          null,
          null,
          null,
          userToken = jsonData['data']['tokens']['accessToken'],
          userId = jsonData['data']['userId'],
          jsonData['data']['patientStatus'],
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
        );
        notifyListeners();
        if (user1.patientStatus == 0) {
          navigation_Service.navigateToUntil(to: OTP());
        } else if (user1.patientStatus == 1) {
          navigation_Service.navigateToUntil(to: Encripted());
        } else if (user1.patientStatus! >= 2) {
          var response = await http.get(
              Uri.https(
                  Constants.baseUrl, "/getUserById", {"Id": user1.patient_id!}),
              headers: {
                'content-type': 'application/json',
                'accept': 'application/json',
                'authorization': 'bearer ${user1.access_token} '
              });
          print(response.body);
          var data = jsonDecode(response.body);
          var json = User1.fromJson(data['data']);
          json.access_token = user1.access_token;
          json.patient_id = user1.patient_id;
          user1 = json;
          userId = user1.patient_id.toString();
          userEmail = user1.email.toString();
          username = user1.name.toString();
          userPhoneNumber = user1.phone_number.toString();
          userkaGender = user1.gender.toString();

          emergencyName.text = user1.emc_name.toString();
          emergencyRelation.text = user1.emc_relation.toString();
          emergencyPhoneNumber.text = user1.emc_phone_number.toString();
          planType = user1.planType;
          notifyListeners();
          await saveUser(user1);
          print(json);

          isLoading1 = false;
          notifyListeners();
          await navigation_Service.navigateToUntil(to: BottomAppBarCustom());
        }
        // navigation_Service.navigateTo(to: BottomAppBar1());
        // saveUser(jsonData['data']['userId'],
        //     jsonData['data']['tokens']['accessToken']);
      } else {
        showErrorMessage(jsonData['message']);
        isLoading1 = false;
        notifyListeners();
      }

      // navigationService.navigationKey.currentState!
      //     .push(MaterialPageRoute(builder: (context) => BottomAppBar1()));
      // navigation_Service.navigateToUntil(to: BottomAppBar1());
    }
  }

  bool isLoading = false;

  createAccount() async {
    if (email.text.isEmpty) {
      showErrorMessage("Please Enter Your EmailAddres");
    } else if (!email.text.isEmail) {
      showErrorMessage("invalid EmailAddres");
    } else if (password.text.isEmpty) {
      showErrorMessage("Please Enter Your Password");
    } else if (cpassword.text.isEmpty) {
      showErrorMessage("PLease Re-Enter Your Password");
    } else if (password.text != cpassword.text) {
      showErrorMessage("Password and Confirm Password Don't Match!");
    } else {
      isLoading = true;
      notifyListeners();
      var data = {
        'email': email.text.toString(),
        'password': password.text.toString()
      };
      String encodedData = jsonEncode(data);
      var response =
          await http.post(Uri.https(Constants.baseUrl, Constants.registerUser),
              headers: {
                "content-type": "application/json",
                "accept": "application/json",
              },
              body: encodedData);
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      if (response.statusCode == 200) {
        print("registered!!");
        isLoading = false;
        notifyListeners();
        print(jsonData);
        User1 user1 = User1.withData(
          null,
          null,
          null,
          null,
          userToken = jsonData['data']['tokens']['accessToken'],
          userId = jsonData['data']['userId'],
          jsonData['data']['patientStatus'],
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
        );
        saveUser(user1);
        navigation_Service.navigateToUntil(to: VerifyEmail());
        // saveUser(jsonData['data']['userId'],
        //     jsonData['data']['tokens']['accessToken']);
      } else {
        showErrorMessage(jsonData["message"]);
        isLoading = false;
        notifyListeners();
      }

      // navigationService.navigationKey.currentState!
      //     .push(MaterialPageRoute(builder: (context) => VerifyEmail()));
      // navigation_Service.navigateToUntil(to: VerifyEmail());
    }
  }

  bool forgetLoading = false;
  forgetPassword(context) async {
    if (femail.text.isEmpty) {
      DialogUtils().showDialog(MyErrorWidget(error: "Please Enter Your Email"));
    } else if (!femail.text.isEmail) {
      DialogUtils()
          .showDialog(MyErrorWidget(error: "Please Enter a Valid Email"));
    } else {
      forgetLoading = true;
      notifyListeners();
      var data = {'email': femail.text.toString()};
      var encodedData = jsonEncode(data);
      var response = await http.post(
          Uri.https(Constants.baseUrl, Constants.sendResetPassEmail),
          body: encodedData,
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json',
            'authorization': 'bearer ${userToken}'
          });
      print(response.body);
      var jsonData = jsonDecode(response.body);
      forgetLoading = false;
      notifyListeners();
      // DialogUtils().showDialog(Column(
      //   children: [
      //     Text(
      //             "Email has been sended!",
      //             style: TextStyle(
      //                 fontFamily: FontUtils.montserratSemiBold, fontSize: 2.t),
      //           ),
      //           InkWell(
      //             onTap: () {
      //               navigation_Service.navigateToUntil(
      //                   to: BottomAppBarCustom());
      //             },
      //             child: Container(
      //               width: double.infinity,
      //               decoration: BoxDecoration(
      //                   color: ColorUtils.purple,
      //                   borderRadius: BorderRadius.circular(7)),
      //               child: Padding(
      //                 padding: EdgeInsets.symmetric(vertical: 1.7.h),
      //                 child: Center(
      //                   child: Text(
      //                     "Ok",
      //                     style: TextStyle(
      //                         color: ColorUtils.white,
      //                         fontFamily: FontUtils.montserratSemiBold),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //   ],
      // ));
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Center(
                  child: Text(
                    "Email has been sended!",
                    style: TextStyle(
                        fontFamily: FontUtils.montserratSemiBold,
                        fontSize: 2.t),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                content: InkWell(
                  onTap: () {
                    navigation_Service.navigateToUntil(to: LoginTabBar());
                  },
                  child: Container(
                    height: 3.h,
                    // width: double.infinity,
                    // padding: EdgeInsets.symmetric(horizontal: 3.w),
                    decoration: BoxDecoration(
                        color: ColorUtils.purple,
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                      child: Text(
                        "Ok",
                        style: TextStyle(
                            color: ColorUtils.white,
                            fontFamily: FontUtils.montserratSemiBold),
                      ),
                    ),
                  ),
                ),
              ));
    }
  }

  TextEditingController therapistfemail = TextEditingController();

  FocusNode therapistFemailFocus = FocusNode();
  bool istherapistFEmailInFocus = false;

  void therapistForgetEmailFocus() {
    if (therapistFemailFocus.hasFocus) {
      istherapistFEmailInFocus = true;
    } else {
      istherapistFEmailInFocus = false;
    }
    notifyListeners();
  }

  bool theForgetLoadiing = false;
  forgetPasswordForTherapist(context) async {
    if (therapistfemail.text.isEmpty) {
      DialogUtils().showDialog(MyErrorWidget(error: "Please Enter Your Email"));
    } else if (!therapistfemail.text.isEmail) {
      DialogUtils()
          .showDialog(MyErrorWidget(error: "Please Enter a Valid Email"));
    } else {
      theForgetLoadiing = true;
      notifyListeners();
      var data = {'email': therapistfemail.text.toString()};
      var encodedData = jsonEncode(data);
      var response = await http.post(
          Uri.https(Constants.baseUrl, Constants.sendResetPassEmailTherapist),
          body: encodedData,
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json',
            'authorization': 'bearer ${userToken}'
          });
      print(response.body);
      var jsonData = jsonDecode(response.body);
      theForgetLoadiing = false;
      notifyListeners();
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Center(
                  child: Text(
                    "Email has been sended!",
                    style: TextStyle(
                        fontFamily: FontUtils.montserratSemiBold,
                        fontSize: 2.t),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                content: InkWell(
                  onTap: () {
                    navigation_Service.navigateToUntil(to: LoginTabBar());
                  },
                  child: Container(
                    height: 3.h,
                    // width: double.infinity,
                    // padding: EdgeInsets.symmetric(horizontal: 3.w),
                    decoration: BoxDecoration(
                        color: ColorUtils.purple,
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                      child: Text(
                        "Ok",
                        style: TextStyle(
                            color: ColorUtils.white,
                            fontFamily: FontUtils.montserratSemiBold),
                      ),
                    ),
                  ),
                ),
              ));
    }
  }

  confirmNewPassword() {
    if (newpassword.text.isEmpty) {
      DialogUtils()
          .showDialog(MyErrorWidget(error: "Please Enter Your Password"));
    } else if (cnewpassword.text.isEmpty) {
      DialogUtils()
          .showDialog(MyErrorWidget(error: "PLease Re-Enter Your Password"));
    } else if (newpassword.text != cnewpassword.text) {
      DialogUtils().showDialog(
          MyErrorWidget(error: "Password and Confirm Password Do not Match!"));
    } else {
      // navigationService.navigationKey.currentState!
      //     .push(MaterialPageRoute(builder: (context) => Patient()));
      navigation_Service.navigateToUntil(to: Patient());
    }
  }

  // final changepassword = TextEditingController();
  // final cChangepassword = TextEditingController();
  bool isloading5 = false;
  changePassword() async {
    if (newPassword.text.isEmpty) {
      DialogUtils()
          .showDialog(MyErrorWidget(error: "Please Enter Your Password"));
    } else if (confirmPassword.text.isEmpty) {
      DialogUtils()
          .showDialog(MyErrorWidget(error: "PLease Re-Enter Your Password"));
    } else if (newPassword.text != confirmPassword.text) {
      DialogUtils().showDialog(
          MyErrorWidget(error: "Password and Confirm Password Do not Match!"));
    }
    //else if (currentPassword.text.isEmpty) {
    //   DialogUtils().showDialog(
    //       MyErrorWidget(error: "Please Enter Your Current Password"));
    // }
    else {
      var data = {
        'Id': userId,
        'currentPassword': currentPassword.text.toString(),
        'newPassword': newPassword.text.toString()
      };
      String encodedData = jsonEncode(data);
      var response = await http.put(
          Uri.https(Constants.baseUrl, Constants.userChangePassword),
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json',
            'authorization': 'bearer $userToken'
          },
          body: encodedData);
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      if (response.statusCode == 200) {
        DialogUtils().showDialog(MyErrorWidget(error: jsonData['data']));
      } else {
        DialogUtils().showDialog(MyErrorWidget(error: jsonData['message']));
      }
    }
  }

  // TheRapist Side //
  FocusNode therapistEmailFocus = FocusNode();
  bool isTherapistEmailInFocus = false;
  final therapistEmail = TextEditingController();

  void ontheRapistEmailFocus() {
    if (therapistEmailFocus.hasFocus) {
      isTherapistEmailInFocus = true;
    } else {
      isTherapistEmailInFocus = false;
    }
    notifyListeners();
  }

  FocusNode therapistPasswordFocus = FocusNode();
  bool isTherapistPasswordInFocus = false;
  final therapistPassword = TextEditingController();

  void ontheRapistPasswordFocus() {
    if (therapistPasswordFocus.hasFocus) {
      isTherapistPasswordInFocus = true;
    } else {
      isTherapistPasswordInFocus = false;
    }
    notifyListeners();
  }

  String therapistToken = "";
  String therapistId = "";
  String therapistEmailForshared = "";
  bool isLoading3 = false;
  therapistLoginAccount() async {
    istherapist = true;
    if (therapistEmail.text.isEmpty) {
      showErrorMessage("Please Enter Your correct Email");
    } else if (!therapistEmail.text.isEmail) {
      showErrorMessage("Invalid EmailAddress");
    } else if (therapistPassword.text.isEmpty) {
      showErrorMessage("Please Enter Your Password");
    } else {
      isLoading3 = true;
      notifyListeners();
      var data = {
        'email': therapistEmail.text.toString(),
        'password': therapistPassword.text.toString()
      };
      String encodedData = jsonEncode(data);
      var response = await http.post(
          Uri.https(Constants.baseUrl, Constants.therapistLogin),
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json'
          },
          body: encodedData);
      var jsonData = jsonDecode(response.body);

      print(jsonData);
      if (response.statusCode == 200) {
        isLoading3 = false;
        notifyListeners();
        sharedPreferences!.setString('TherapistId', jsonData['data']['userId']);
        sharedPreferences!.setString(
            'TherapistToken', jsonData['data']['tokens']['accessToken']);
        sharedPreferences!
            .setString('therapistEmail', therapistEmail.text.toString());
        sharedPreferences!.setBool('isTherapist', istherapist);
        navigation_Service.navigateToUntil(to: TherapistBottomAppBar());
        User1 user1 = User1.withData(
          null,
          null,
          null,
          null,
          therapistToken = jsonData['data']['tokens']['accessToken'],
          therapistId = jsonData['data']['userId'],
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
        );
        saveUser(user1);
        notifyListeners();

        //print(saveUser('userId', 'accessToke'));
      } else {
        showErrorMessage(jsonData['message']);
        isLoading3 = false;
        notifyListeners();
      }
      // navigationService.navigationKey.currentState!.push(
      //     MaterialPageRoute(builder: (context) => TherapistBottomAppBar()));
      // navigation_Service.navigateToUntil(to: TherapistBottomAppBar());
    }
  }

  bool isLoading4 = false;
  otpcheck() async {
    user1 = await getUser();
    if (otp.text.length != 4) {
      showErrorMessage("Please Enter OTP");
    } else {
      isLoading4 = true;
      notifyListeners();
      var data = {'Id': userId, 'code': otp.text.toString()};
      String encodedData = jsonEncode(data);
      var response =
          await http.post(Uri.https(Constants.baseUrl, Constants.otpCheck),
              headers: {
                'content-type': 'application/json',
                'accept': 'application/json',
                'authorization': 'bearer ${userToken}'
              },
              body: encodedData);
      var jsonData = jsonDecode(response.body);
      print(response.body);
      if (response.statusCode == 200) {
        print("correct");
        isLoading4 = false;
        notifyListeners();
        print(jsonData);
        // saveUser(jsonData['data']['userId'],
        //     jsonData['data']['tokens']['accessToken']);
        navigation_Service.navigateToUntil(to: Encripted());
      } else {
        isLoading4 = false;
        notifyListeners();
        showErrorMessage(jsonData['message']);
      }
      // return navigationService.navigationKey.currentState!
      //     .push(MaterialPageRoute(builder: (context) => Encripted()));
      // navigation_Service.navigateTo(to: Encripted());
    }
  }

  reSendOtp() async {
    // User user = User();
    user1 = await getUser();
    var data = {'Id': userId};
    String encodedData = jsonEncode(data);
    var response =
        await http.post(Uri.https(Constants.baseUrl, Constants.resendOtp),
            headers: {
              'content-type': 'application/json',
              'accept': 'application/json',
              'authorization': 'bearer ${userToken}'
            },
            body: encodedData);
    var jsonData = jsonDecode(response.body);
    print(response.body);
    if (response.statusCode == 200) {
      print(jsonData);

      // navigation_Service.navigateTo(to: Encripted());
    } else {
      showErrorMessage(jsonData['message']['name']);
    }
  }

  forgetOtpcheck() {
    if (otp.text.length != 4) {
      showErrorMessage("Please Enter OTP");
    } else {
      // return navigationService.navigationKey.currentState!
      //     .push(MaterialPageRoute(builder: (context) => CreateNewPassword()));
      navigation_Service.navigateTo(to: CreateNewPassword());
    }
  }

  userExtraInfo() async {
    // sharedPreferences = await SharedPreferences.getInstance();
    // user = await getUser();
    user1.name = name.text.toString();
    user1.age = int.parse(age.text);
    user1.phone_number = Phone.text.toString();
    print(user1.name);
    print(user1.age);
    print(user1.phone_number);
    saveUser(user1);
    // print(saveUser(user));
    selectionOfPages++;
    notifyListeners();
    navigation_Service.navigateTo(to: Gender());
  }

  userGender() async {
    user1 = await getUser();
    user1.gender = selectedGender == 1
        ? "Male"
        : selectedGender == 2
            ? "Female"
            : selectedGender == 3
                ? "Non-Binary"
                : selectedGender == 4
                    ? "Prefer Not To Say"
                    : null;
    // user.gender = selectedGender == 1
    //     ? "Male"
    //     : selectedGender == 2
    //         ? "Female"
    //         : selectedGender == 3
    //             ? "Non-Binary"
    //             : selectedGender == 4
    //                 ? "Prefer Not To Say"
    //                 : null;
    print(user1.gender);
    saveUser(user1);
    selectionOfPages++;
    notifyListeners();
    navigation_Service.navigateTo(to: Disease());
  }

  Diseases() async {
    user1 = await getUser();

    var response = await http
        .get(Uri.https(Constants.baseUrl, Constants.diseases), headers: {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': 'bearer ${userToken}'
    });
    var data = jsonDecode(response.body);
    problems = (data["data"] as List).map((e) => Problems.fromJson(e)).toList();
    // List diseaseId = problems.map((e) => e.Id).toList();
    // print(diseaseId);
    notifyListeners();
    // print(problems);
    print(data);
  }

  sendingDiseases() async {
    user1 = await getUser();
    // var response = await http
    //     .get(Uri.https(Constants.baseUrl, Constants.diseases), headers: {
    //   'content-type': 'application/json',
    //   'accept': 'application/json',
    //   'authorization': 'bearer ${user.access_token}'
    // });

    // var data = jsonDecode(response.body);
    // print(selectedDiseases[0]);
    user1.problems = selectedDiseases;
    saveUser(user1);
    print(user1.problems);
    navigation_Service.navigateTo(to: CounsellorLanguage());
  }

  counsellorLanguage() async {
    user1 = await getUser();
    user1.prefered_lang = selectedrole['name'];
    print(user1.prefered_lang);
    saveUser(user1);
    navigation_Service.navigateTo(to: Counsellor());
  }

  therapistGender() async {
    user1 = await getUser();
    user1.councelor_gender = selectedCounsellor == 1
        ? "Male"
        : selectedCounsellor == 2
            ? "Female"
            : selectedCounsellor == 3
                ? "I don't mind"
                : null;
    print(user1.councelor_gender);
    saveUser(user1);
    navigation_Service.navigateTo(to: Suicidal());
  }

  tellMore() async {
    user1 = await getUser();
    user1.tell_us_more = tellUsMore.text.toString();
    print(user1.tell_us_more);
    saveUser(user1);
    navigation_Service.navigateTo(to: FindingCounsellor());
  }

  findingCounsellor() async {
    // user = await getUser();
    // user.id =
    var data = {
      'Id': userId,
      'email': userEmail,
      'name': user1.name,
      'age': user1.age,
      'phone_number': Phone.text,
      'gender': selectedGender == 1
          ? "Male"
          : selectedGender == 2
              ? "Female"
              : selectedGender == 3
                  ? "Non-Binary"
                  : selectedGender == 4
                      ? "Prefer Not To Say"
                      : null,
      'councelor_gender': user1.councelor_gender,
      'prefered_lang': user1.prefered_lang,
      'tell_us_more': user1.tell_us_more,
      'mental_problems': user1.problems
    };
    String encodedData = jsonEncode(data);

    var response = await http.put(
        Uri.https(Constants.baseUrl, Constants.completeProfile),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken} '
        });
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    print(saveUser(user1));
    if (jsonData["code"] == 'Success') {
      user1.patientStatus = 2;
      userId;
      username = user1.name.toString();
      userEmail = email.text.toString();
      userkaGender = selectedGender == 1
          ? "Male"
          : selectedCounsellor == 2
              ? "Female"
              : selectedCounsellor == 3
                  ? "Non-Binary"
                  : selectedGender == 4
                      ? "Prefer Not To Say"
                      : null.toString();
      userPhoneNumber = Phone.text.toString();
      final emergencyName = null;
      final emergencyRelation = null;
      final emergencyPhoneNumber = null;

      saveUser(user1);
      if (jsonData["errorCode"] != null && jsonData["errorCode"] == 2288) {
        DialogUtils().showDialog(MyErrorWidget(
          error: "No Therapist found currently.",
          customCall: () {
            navigation_Service.navigateToUntil(to: BottomAppBarCustom());
          },
        ));
      } else {
        navigation_Service.navigateToUntil(to: BottomAppBarCustom());
      }
    }
  }

  userChangeName() async {
    if (changeName.text.isEmpty) {
      DialogUtils()
          .showDialog(MyErrorWidget(error: "This TextField can't be null"));
    } else {
      var data = {'Id': userId, "name": changeName.text.toString()};
      String encodedData = jsonEncode(data);
      var response = await http.put(
          Uri.https(Constants.baseUrl, Constants.userChangeName),
          body: encodedData,
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json',
            'authorization': 'bearer ${userToken} '
          });
      var jsonData = jsonDecode(response.body);
      var response1 = await http.get(
          Uri.https(Constants.baseUrl, "/getUserById", {"Id": userId}),
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json',
            'authorization': 'bearer ${user1.access_token} '
          });
      print(response1.body);
      var data1 = jsonDecode(response.body);
      var json = User1.fromJson(data1['data']);
      // json.access_token = user.access_token;
      // json.patient_id = user.patient_id;
      user1 = json;
      // userId = user.patient_id.toString();
      // userEmail = user.email.toString();
      username = user1.name.toString();

      // emergencyName.text = user.emc_name.toString();
      // emergencyRelation.text = user.emc_relation.toString();
      // emergencyPhoneNumber.text = user.emc_phone_number.toString();
      notifyListeners();
      saveUser(user1);
      print(json);

      isLoading1 = false;
      notifyListeners();
      print(jsonData);
    }
  }

  final emergencyName = TextEditingController();
  final emergencyRelation = TextEditingController();
  final emergencyPhoneNumber = TextEditingController();

  emergencyContact() async {
    var data = {
      'Id': userId,
      'name': emergencyName.text,
      'relation': emergencyRelation.text,
      'phone_number': emergencyPhoneNumber.text.toString()
    };
    String encodedData = jsonEncode(data);
    var response = await http.post(
        Uri.https(Constants.baseUrl, Constants.emergencyContact),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    var jsonData = jsonDecode(response.body);
    // saveUser();
    print(jsonData);
  }

  therapistChangePassword() async {
    if (therapistCurrentPassword.text.isEmpty) {
      DialogUtils().showDialog(
          MyErrorWidget(error: "Please Enter Your Current Password"));
    } else if (theNewPassword.text.isEmpty) {
      DialogUtils()
          .showDialog(MyErrorWidget(error: "Please Enter Your New Password"));
    } else if (therapaistConfirmPassword.text.isEmpty) {
      DialogUtils()
          .showDialog(MyErrorWidget(error: "Please Re-Enter Your Password"));
    } else if (theNewPassword.text != therapaistConfirmPassword.text) {
      DialogUtils().showDialog(MyErrorWidget(
          error: "New Password and Confirm Password Do not Match!"));
    } else {
      var data = {
        'Id': userId,
        'currentPassword': therapistCurrentPassword.text.toString(),
        'newPassword': theNewPassword.text.toString()
      };
      String encodedData = jsonEncode(data);
      var response = await http.put(
          Uri.https(Constants.baseUrl, Constants.therapistChangePassword),
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json',
            'authorization': 'bearer ${userToken}'
          },
          body: encodedData);
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      if (response.statusCode == 200) {
        DialogUtils().showDialog(MyErrorWidget(error: jsonData['data']));
      } else {
        DialogUtils().showDialog(MyErrorWidget(error: jsonData['message']));
      }
    }
  }

  createJournal() async {
    var data = {
      'title': journaltitle.text.toString(),
      'description': journalDes.text.toString(),
      'Id': userId
    };
    String encodedData = jsonEncode(data);
    var response = await http.post(
        Uri.https(Constants.baseUrl, Constants.createJournal),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    journalWaiting = true;
    var response1 = await http.get(
        Uri.https(
            Constants.baseUrl, Constants.getPatientJournals, {'Id': userId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    var data1 = jsonDecode(response1.body);
    patientjournal = (data1["data"] as List)
        .map((e) => PatientJournals.fromJson(e))
        .toList();
    notifyListeners();
    notifyListeners();
    journalWaiting = false;
    notifyListeners();
  }

  bool journalWaiting = false;
  getJournals() async {
    journalWaiting = true;
    // notifyListeners();
    var response = await http.get(
        Uri.https(
            Constants.baseUrl, Constants.getPatientJournals, {'Id': userId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    var data = jsonDecode(response.body);
    patientjournal =
        (data["data"] as List).map((e) => PatientJournals.fromJson(e)).toList();
    notifyListeners();
    journalWaiting = false;
    notifyListeners();
  }

  bool clientJournal = false;

  getClientJournal(String id) async {
    clientJournal = true;
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getPatientJournals, {'Id': id}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken}'
        });
    var jsonData = jsonDecode(response.body);
    clientJournalForTherapist = (jsonData['data'] as List)
        .map((e) => PatientJournals.fromJson(e))
        .toList();
    notifyListeners();
    clientJournal = false;
    notifyListeners();
    print(jsonData);
  }

  // String testImage = "";
  // String ImageOfBlog = "";
  // final mimeType = lookupMimeType('1641038176461-Asset%205', headerBytes: [0xFF, 0xD8]);
  // bool isImage() {
  //   final mimeType = lookupMimeType('https://api.soulgoodhealth.com:5000' +
  //       Constants.fullBlog +
  //       Constants.blogImage +
  //       jsonConvert[index].image.toString());

  //   return mimeType!.startsWith('image/');
  // }

  bool waitingBlog = false;
  fullBlog() async {
    waitingBlog = true;
    notifyListeners();
    var response = await http
        .get(Uri.https(Constants.baseUrl, Constants.fullBlog), headers: {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': 'bearer ${userToken}'
    });
    var jsonData = jsonDecode(response.body);
    jsonConvert =
        (jsonData['data'] as List).map((e) => ApiBlogs.fromJson(e)).toList();

    print(jsonConvert);
    waitingBlog = false;
    notifyListeners();
  }

  getpaidTherapist() async {
    var response = await http.get(
        Uri.https(
            Constants.baseUrl, Constants.paidTherapist, {'Id': therapistId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken}'
        });
    var jsonData = jsonDecode(response.body);
    var data = jsonData['data'];
    paidClients =
        (jsonData['data'] as List).map((e) => PaidClients.fromJson(e)).toList();
    print(jsonData);
    paidClientsList = [];
    for (PaidClients paidClient
        in (data as List).map((e) => PaidClients.fromJson(e)).toList()) {
      for (PaidClientsList client in paidClient.clients) {
        PaidClientsList tempClient = client;
        tempClient.tagIndex = tempClient.name!.substring(0, 1).toUpperCase();
        paidClientsList.add(tempClient);
      }
    }
    notifyListeners();

    // paidClientsList =
    //     (jsonData['data'] as List).map((e) => PaidClients.fromJson(e)).toList();
    // print(paidClientsList);

    //  var jsonData = jsonDecode(response.body);
    // var check = jsonData["data"];
    // for (var jData in check) {
    //   paidClients.add(PaidClientsList.fromJson(jsonData));
    // }
    // print(paidClients);
  }

  List<Package> plans = [];
  var plankiId;
  bool planLoading = false;
  getPlans() async {
    planLoading = true;
    var response = await http.get(
      Uri.https(Constants.baseUrl, Constants.getPlans),
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': 'bearer ${userToken}',
      },
    );
    var jsonData = jsonDecode(response.body);
    print(response.body);
    plans = (jsonData['data'] as List).map((e) => Package.fromJson(e)).toList();
    // planType = jsonData['data']['']
    planLoading = false;
    notifyListeners();
  }

  var patientKiId;
  final reportTitle = TextEditingController();
  createReport() async {
    var data = {
      'title': reportTitle.text,
      'problem_list': (await textEditor.getText()).toString(),
      'formulation': (await textEditor1.getText()).toString(),
      'tasks_and_goals': (await textEditor2.getText()).toString(),
      'completed_tasks_and_goals': (await textEditor3.getText()).toString(),
      'Id': therapistId,
      'patientId': patientKiId
    };
    var encodedData = jsonEncode(data);
    var response = await http.post(
      Uri.https(Constants.baseUrl, Constants.createReport),
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': 'bearer ${therapistToken}'
      },
      body: encodedData,
    );
    var jsonData = jsonDecode(response.body);
    print(jsonData);
  }

  bool isLoadingForReport = false;
  getPatientReports() async {
    isLoadingForReport = true;
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getPatientReports,
            {'Id': patientKiId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken}'
        });
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    reportList = (jsonData['data'] as List)
        .map((e) => therapistReports.fromJson(e))
        .toList();
    isLoadingForReport = false;
    notifyListeners();
  }

  getReportsFromTherapist() async {
    isLoadingForReport = true;
    var response = await http.get(
        Uri.https(
            Constants.baseUrl, Constants.getPatientReports, {'Id': userId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    reportList = (jsonData['data'] as List)
        .map((e) => therapistReports.fromJson(e))
        .toList();
    isLoadingForReport = false;
    notifyListeners();
  }

  String? timeZone;
  getTime() {
    var checking = selectedReport!.createdAt!.replaceAll('Z', '');
    var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss")
        .parse(checking.replaceAll('T', ' '), true);
    var dateLocal = dateTime.toLocal();
    timeZone = dateLocal.toString();
    print(dateLocal);
    return dateLocal;
  }

  writeNote() async {
    var data = {
      'note': journalDes.text,
      'therapistId': therapistId,
      'patientId': patientKiId,
    };
    var encodedData = jsonEncode(data);

    var reposnse =
        await http.post(Uri.https(Constants.baseUrl, Constants.writeNote),
            headers: {
              'content-type': 'application/json',
              'accept': 'application/json',
              'authorization': 'bearer ${therapistToken}'
            },
            body: encodedData);
    var jsonData = jsonDecode(reposnse.body);
    print(jsonData);
  }

  getTherapistNote() async {
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getTherapistNote,
            {'patientId': patientKiId, 'therapistId': therapistId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken}'
        });
    var jsonData = jsonDecode(response.body);
    notesList = (jsonData['data'] as List)
        .map((e) => therapistNotes.fromJson(e))
        .toList();
    journalDes.text = notesList[0].note.toString();
    notifyListeners();
  }

  var url1;
  bool checkLoading = false;
  checkOutSession() async {
    var data = {'Id': userId, 'plan_id': plankiId, 'locale': 'en'};
    print(data);
    var encodedData = jsonEncode(data);
    var response = await http.post(
        Uri.https(Constants.baseUrl, Constants.createCheckoutSession),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}',
        });
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    url1 = jsonData['data'];
    navigateToPaymentSuccess();
  }

  openBroweser() async {
    await FlutterWebBrowser.openWebPage(
      safariVCOptions: SafariViewControllerOptions(),
      url: url1,
    ).then((value) => InAppWebView(
          onLoadStop: (controller1, url1) {
            if (url1 ==
                'https://web.soulgoodhealth.com/#/subscription-successfull') {
              controller1.goBack();
              print(url1);
            }
          }, // initialUrlRequest: url,
          onLoadStart: (controller, url1) {
            if (url1 ==
                'https://web.soulgoodhealth.com/#/subscription-successfull') {
              controller.goBack();
              print(url1);
            }
          },
        ));

    print(url1);
  }

  facebookLogin() async {
    final LoginResult result = await FacebookAuth.instance.login();
    final userData = await FacebookAuth.instance.getUserData();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  var loading = false;
  void logInwithFacebook() async {
    loading = true;
    notifyListeners();
    try {
      final loginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      final facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      print(userData);
      var data = {"email": userData['email']};
      var encodedData = jsonEncode(data);

      var response = await http.post(
        Uri.https(Constants.baseUrl, Constants.facebookSignup),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
        },
      );
      print(response.body);
      var jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print("registered!!");
        isLoading = false;
        notifyListeners();
        print(jsonData);
        User1 user1 = User1.withData(
          null,
          null,
          null,
          null,
          userToken = jsonData['data']['tokens']['accessToken'],
          userId = jsonData['data']['userId'],
          jsonData['data']['patientStatus'],
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
        );
        saveUser(user1);
        navigation_Service.navigateToUntil(to: Encripted());
        // saveUser(jsonData['data']['userId'],
        //     jsonData['data']['tokens']['accessToken']);
      } else {
        showErrorMessage(jsonData["message"]);
        isLoading = false;
        notifyListeners();
      }
      // if (user1.patientStatus == 1) {
      //   navigation_Service.navigateToUntil(to: Encripted());
      // } else if (user1.patientStatus! >= 2) {
      //   await navigation_Service.navigateToUntil(to: BottomAppBarCustom());
      // }
      // await FirebaseFirestore.instance.collection('users').add({
      //   'email': userData['email'],
      //   'imageUrl': userData['picture']['data']['url'],
      //   'name': userData['name']
      // });

      // Navigator.pushAndRemoveUntil(
      //     navigation_Service.navigationKey.currentContext!,
      //     MaterialPageRoute(builder: (context) => const BottomAppBarCustom()),
      // (route) => false);
    } on FirebaseAuthException catch (e) {
      var content = '';
      switch (e.code) {
        case 'account-exists-with-different-credential':
          content = 'This account exist with a diffrent sign in provider';
          break;
        case 'invalid-credential':
          content = 'Unknown error has occuerrd';
          break;
        case 'This operation is not allowed':
          content = 'This operation is not allowed';
          break;
        case 'user-disabled':
          content = 'This user you tried to log into is disabled';
          break;
        case 'user-not-found':
          content = 'The user you tried to log into is not found';
          break;
      }

      DialogUtils().showDialog(MyErrorWidget(error: content));

      // showDialog(
      //     context: context,
      //     builder: (context) => AlertDialog(
      //           title: const Text("login with Facebook Failed"),
      //           content: Text(content),
      //           actions: [
      //             TextButton(
      //                 onPressed: () {
      //                   Navigator.of(context).pop();
      //                 },
      //                 child: const Text("OK"))
      //           ],
      //         ));
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  bool appleLoading = false;
  Future signInWithApple() async {
    appleLoading = true;
    notifyListeners();
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );
    print(AppleIDAuthorizationScopes.email);
    print(AppleIDAuthorizationScopes.fullName);
    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    var response1 =
        await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    appleLoading = false;
    notifyListeners();
    userEmail = response1.user!.email.toString();
    var data = {"email": response1.user!.email};
    print(data);
    var encodedData = jsonEncode(data);

    var response = await http.post(
      Uri.https(Constants.baseUrl, Constants.googleSignup),
      body: encodedData,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
    );
    print(response.body);
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      isPatient = true;
      print("registered!!");
      isLoading = false;
      notifyListeners();
      print(jsonData);
      print(jsonData['data']['tokens']['accessToken']);
      sharedPreferences!.setString('UserId', jsonData['data']['userId']);
      sharedPreferences!
          .setString('userToken', jsonData['data']['tokens']['accessToken']);
      sharedPreferences!.setString('userEmail', userEmail.toString());
      sharedPreferences!.setBool('isPatient', isPatient);
      User1 user1 = User1.withData(
        null,
        null,
        null,
        null,
        userToken = jsonData['data']['tokens']['accessToken'],
        userId = jsonData['data']['userId'],
        jsonData['data']['patientStatus'],
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
      );

      await saveUser(user1);
      if (user1.patientStatus == 1) {
        navigation_Service.navigateToUntil(to: Encripted());
      } else if (user1.patientStatus! >= 2) {
        navigation_Service.navigateToUntil(to: BottomAppBarCustom());
      }

      // saveUser(jsonData['data']['userId'],
      //     jsonData['data']['tokens']['accessToken']);
    } else {
      showErrorMessage(jsonData["message"]);
      appleLoading = false;
      notifyListeners();
    }
  }

  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;
  bool googleLoading = false;
  Future googleLogin() async {
    googleLoading = true;
    notifyListeners();
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      googleLoading = false;
      notifyListeners();
      return;
    }

    _user = googleUser;

    final googlAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googlAuth.accessToken, idToken: googlAuth.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential);
    print(user);
    googleLoading = false;
    notifyListeners();
    // username = user.displayName!;
    userEmail = user.email;
    var data = {"email": user.email};
    var encodedData = jsonEncode(data);

    var response = await http.post(
      Uri.https(Constants.baseUrl, Constants.googleSignup),
      body: encodedData,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
    );
    print(response.body);
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      isPatient = true;
      print("registered!!");
      isLoading = false;
      notifyListeners();
      print(jsonData);
      print(jsonData['data']['tokens']['accessToken']);
      sharedPreferences!.setString('UserId', jsonData['data']['userId']);
      sharedPreferences!.setString('userToken', jsonData['data']['tokens']['accessToken']);
      sharedPreferences!.setString('userEmail', userEmail.toString());
      sharedPreferences!.setBool('isPatient', isPatient);
      User1 user1 = User1.withData(
        null,
        null,
        null,
        null,
        userToken = jsonData['data']['tokens']['accessToken'],
        userId = jsonData['data']['userId'],
        jsonData['data']['patientStatus'],
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
      );

      await saveUser(user1);
      if (user1.patientStatus == 1) {
        navigation_Service.navigateToUntil(to: Encripted());
      } else if (user1.patientStatus! >= 2) {
        navigation_Service.navigateToUntil(to: BottomAppBarCustom());
      }

      // saveUser(jsonData['data']['userId'],
      //     jsonData['data']['tokens']['accessToken']);
    } else {
      showErrorMessage(jsonData["message"]);
      googleLoading = false;
      notifyListeners();
    }
  }

  var date;
  var startDate;
  List<userPlan> checkUserPlan = [];
  getUserPlan() async {
    try {
      var response = await http.get(
          Uri.https(Constants.baseUrl, Constants.getUserPlan, {"Id": userId}),
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json',
            'authorization': 'bearer ${userToken}'
          });
      print(response.body);
      var jsonData = jsonDecode(response.body);
      checkUserPlan =
          (jsonData['data'] as List).map((e) => userPlan.fromJson(e)).toList();
      print(checkUserPlan);
      //date = DateTime.parse(checkUserPlan[0].end_date!).hour;
      date = DateFormat("EEE MMM dd yyyy").parse(checkUserPlan[0].end_date!);

      print(date.toString().substring(0, 10));
      startDate = DateFormat('EEE MMM dd yyyy hh:mm:ss')
          .parse(checkUserPlan[0].starts_date!);
      print(startDate);
    } catch (e) {
      print(e);
    }
  }

  getUserPlanForTherapistOFPatient(tappedId) async {
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getUserPlan, {"Id": tappedId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    checkUserPlan =
        (jsonData['data'] as List).map((e) => userPlan.fromJson(e)).toList();
    print(checkUserPlan);
    print(checkUserPlan[0].end_date!);
    //date = DateTime.parse(checkUserPlan[0].end_date!).hour;
    date = DateFormat("EEE MMM dd yyyy").parse(checkUserPlan[0].end_date!);

    print(date.toString().substring(0, 10));
    startDate = DateFormat('EEE MMM dd yyyy hh:mm:ss')
        .parse(checkUserPlan[0].starts_date!);
    print(startDate);
  }

  String? subPlanId;
  String? planDetail;
  int? subType;
  var StripeUrl;
  var planData;
  bool createLoading = false;
  createBillingPortal(context, planData) async {
    try {
      createLoading = true;
      notifyListeners();
      var data = {
        "Id": userId,
        "userPlan": subPlanId,
        "locale": 'en',
        "plan": planData,
        "type": 1
      };
      var encodedData = jsonEncode(data);
      var response = await http.post(
          Uri.https(Constants.baseUrl, Constants.createBillingPortal),
          body: encodedData,
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json',
            'Authorization': 'bearer ${userToken}'
          });
      print(response.body);
      var jsonData = jsonDecode(response.body);
      StripeUrl = jsonData['data'];
      createLoading = false;
      notifyListeners();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UpdateSubs(
                    url: model.StripeUrl,
                  )));
    } catch (e) {
      print(e.toString());
      createLoading = false;
      notifyListeners();
    }
  }

  bool cancelLodaing = false;
  cancelBillingPortal(context) async {
    cancelLodaing = true;
    notifyListeners();
    var data = {"Id": userId, "locale": 'en', "type": 2};
    var encodedData = jsonEncode(data);
    var response = await http.post(
        Uri.https(Constants.baseUrl, Constants.createBillingPortal),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    StripeUrl = jsonData['data'];
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UpdateSubs(
                  url: model.StripeUrl,
                )));
  }

  List<subscriptionLog> subsLog = [];
  getSubscriptionLogs() async {
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getSubscriptionLogs,
            {'patientId': userId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    subsLog = (jsonData['data'] as List)
        .map((e) => subscriptionLog.fromJson(e))
        .toList();
    notifyListeners();
  }

  List data = [];
  getUserCredits() async {
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getUserCredits, {"Id": userId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    data = jsonData['data'];
  }

  getUserCreditsForTherapistOfPAtient(tappedId) async {
    var response = await http.get(
        Uri.https(
            Constants.baseUrl, Constants.getUserCredits, {"Id": tappedId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    data = jsonData['data'];
  }

  bool purchaseLoading = false;
  createAdhocPortal() async {
    purchaseLoading = true;
    notifyListeners();
    var data = {"Id": userId, "locale": 'en'};
    var encodedData = jsonEncode(data);
    var response = await http.post(
        Uri.https(Constants.baseUrl, Constants.createAdhocPortal),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    StripeUrl = jsonData['data'];
    purchaseLoading = false;
    notifyListeners();
    navigation_Service.navigateTo(
        to: UpdateSubs(
      url: model.StripeUrl,
    ));
  }

  List<TherapistSlots> slots = [];
  List dates = [];
  List slot = [];
  var dateString;
  var dateString1;
  var diff;
  var offset;
  var selectedDate;
  getTherapistSlotsByUserId() async {
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getTherapistSlotsByUserId,
            {"Id": userId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    slots = (jsonData['data'] as List)
        .map((e) => TherapistSlots.fromJson(e))
        .toList();
    dates = slots.map((e) => e.date.toString()).toList();
    // slot = slots.map((e) => e.slots).toList();
    print(dates);
  }

  bool timeLoading = false;
  Future getTherapistSlotsByDateAndUserId() async {
    timeLoading = true;
    notifyListeners();
    var data = {'date': selectedDate, 'Id': userId};
    var encodedData = jsonEncode(data);
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getTherapistSlotsByDateAndUserId,
            {'data': encodedData}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    slot = (jsonData['data'] as List).map((e) => e).toList();
    print(slot);
    timeLoading = false;
    notifyListeners();
  }

  List finalSlot = [];

  convert12To24(time) {
    var newTime = time.toString().split(':');
    print(newTime);
    var meridiam = newTime[1].substring(2, 4);
    print(meridiam);
    if (meridiam == 'PM') {
      var newTime1 = int.parse(newTime[0]) + 12;
      if (newTime1 == 24) {
        return '00:' + newTime[1].substring(0, 2);
      } else {
        return newTime1.toString() + ':' + newTime[1].substring(0, 2);
      }
    } else {
      return time.toString().substring(0, 5);
    }
    // const meridiam = newTime[1].slice(2,4)
    // if(meridiam === 'PM'){
    //     const newTime1 = parseInt(newTime[0]) + 12
    //     if(newTime1 === 24)
    //     {
    //         return '00:' + newTime[1].slice(0,2)
    //     }
    //     else{
    //         return newTime1 + ':' + newTime[1].slice(0,2)
    //     }
    // }
    // else{
    //     return time.slice(0,5)
    // }
  }

  //  bool timeLoading1 = false;
  getTherapistReSlotsByDateAndUserId() async {
    timeLoading = true;
    notifyListeners();
    var data = {'date': selectedDateForReAppointment, 'Id': userId};
    var encodedData = jsonEncode(data);
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getTherapistSlotsByDateAndUserId,
            {'data': encodedData}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    slot = (jsonData['data'] as List).map((e) => e).toList();
    print(slot);
    timeLoading = false;
    notifyListeners();
  }

  var time;
  var offset1;
  var duration;
  var now;
  var now1;
  var now2;
  var hKTime;
  var waqt;
  var appointmentDate1;
  var hongKong;
  bool popUP = false;
  AppointmantData? appointmentData;
  bool createAppointmentLoading = false;
  createAppointment(context) async {
    createAppointmentLoading = true;
    notifyListeners();
    tz.initializeTimeZones();
    hongKong = tz.getLocation('Asia/Hong_Kong');
    tz.setLocalLocation(hongKong);
    now = DateFormat('yyyy-MM-dd hh:mma')
        .parse(selectedDate + (' ') + selectedTimeForAppointment);
    offset1 = tz.TZDateTime.from(now, hongKong).toUtc();
    // duration = (offset1 as Duration);
    print(offset1.toString().substring(1, 24));

    // if (duration.isNegative){
    //   now1 = (now.toIso8601String() + "-${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
    // }
    // else{
    //     now1 = (now.toIso8601String() + "+${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
    // }

    // now1 = now.toIso8601String() + (time as Duration).inHours.toString().padLeft(2 ,'0');
    //now = DateFormat()'yyyy-MM-dd hh:mm a').parse();

    time = offset1.toString();
    var splitted = time.toString().split(" ");
    var finalTime = splitted[0] + "T" + splitted[1].replaceAll(".000", "");

    // hKTime = DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(now1);
    print(finalTime);

    var data = {'patientId': userId, 'appointmentDate': finalTime};
    var encodedData = jsonEncode(data);
    var response = await http.post(
        Uri.https(Constants.baseUrl, Constants.createAppointment),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      createAppointmentLoading = false;
      notifyListeners();
      if (jsonData['code'] == 'Success') {
        appointmentData = AppointmantData.fromJson(jsonData['data']);
        // print();
        appointmentDate1 =
            tz.TZDateTime.parse(hongKong, appointmentData!.appointmentDate!);
        waqt = DateFormat('hh:mma\nyyyy/MM/dd').format(appointmentDate1);
        print(waqt);
      }
      showDialog(
          context: StackedService.navigatorKey!.currentContext!,
          builder: (context) => AlertDialog(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                content: Container(
                  padding: EdgeInsets.only(bottom: 0.5.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      SizedBox(
                        width: 40.w,
                        height: 15.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .translate('user_db_video_session_text_9')!,
                              style: TextStyle(
                                  fontSize: 1.8.t,
                                  fontFamily: FontUtils.montserratRegular),
                              textAlign: TextAlign.center,
                            ),
                            // SizedBox(
                            //   height: 0.5.h,
                            // ),
                            // Text(
                            //   model.appointmentData!.therapistName!,
                            //   style: TextStyle(
                            //       fontSize: 1.5.t,
                            //       fontFamily: FontUtils.montserratSemiBold),
                            // ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              model.waqt,
                              style: TextStyle(
                                  fontSize: 2.t,
                                  fontFamily: FontUtils.montserratBold),
                            ),
                            // SizedBox(
                            //   height: 1.5.h,
                            // ),
                            // Expanded(
                            //   child: Row(
                            //     children: [
                            //       Flexible(
                            //         child: RichText(
                            //           text: TextSpan(
                            //             text: 'Patient : ',
                            //             style: TextStyle(
                            //                 fontFamily: FontUtils
                            //                     .montserratSemiBold,
                            //                 fontSize: 1.5.t,
                            //                 color: ColorUtils.black),
                            //             children: <TextSpan>[
                            //               TextSpan(
                            //                   text: model.username,
                            //                   style: TextStyle(
                            //                       color:
                            //                           ColorUtils.purple)),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      InkWell(
                          onTap: () {
                            model.navigateBack();
                            model.popUP = false;
                            model.notifyListeners();
                          },
                          child: Container(
                            width: 45.w,
                            padding: EdgeInsets.symmetric(
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(0, 8),
                                      color: ColorUtils.grey.withOpacity(0.4))
                                ],
                                color: ColorUtils.LightGrey,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!
                                    .translate('app_popup_text_2')!,
                                style: TextStyle(
                                    color: ColorUtils.black,
                                    fontFamily: FontUtils.montserratSemiBold),
                              ),
                            ),
                          )
                          //  Button(
                          //     AppLocalizations.of(context)!
                          //         .translate('app_popup_text_2')!,
                          // 15)
                          )
                    ],
                  ),
                ),
              ));
    } else {
      createAppointmentLoading = false;
      notifyListeners();
      DialogUtils().showDialog(MyErrorWidget(error: jsonData['message']));
    }
    getPatientAppointments();
    notifyListeners();

    // now = DateTime.parse(selectedDate + 'T' + selectedTimeForAppointment!);
    // DateTime dateTime1 = DateTime(selectedDate).toLocal();
  }

  var reDate;
  var reHkTime;
  var reTime;
  var reAppointmentId;
  var selectedTimeForReAppointment;
  var selectedDateForReAppointment;
  bool rescheduleIsLoading = false;
  rescheduleAppointment() async {
    rescheduleIsLoading = true;
    notifyListeners();
    reDate = DateFormat('yyyy-MM-dd hh:mma')
        .parse(
            selectedDateForReAppointment + " " + selectedTimeForReAppointment)
        .toUtc()
        .toIso8601String();
    tz.initializeTimeZones();
    var hongKong = tz.getLocation('Asia/Hong_Kong');
    reTime = tz.TZDateTime.parse(hongKong, reDate).toUtc().toIso8601String();
    // time = DateFormat('HH-mm-ssa').format(now);
    reHkTime = reTime.toString().replaceAll('.000', '');
    print(reHkTime);
    var data = {
      'patientId': userId,
      'appointmentDate': reHkTime,
      'Id': reAppointmentId
    };
    var encodedData = jsonEncode(data);
    var response = await http.post(
        Uri.https(Constants.baseUrl, Constants.sheduleAppointment),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (jsonData['code'] == 'Success') {
        rescheduleIsLoading = false;
        notifyListeners();
        var appointmentDate1 =
            tz.TZDateTime.parse(hongKong, jsonData['data']['appointmentDate']);
        var waqt = DateFormat('hh:mma\nyyyy/MM/dd').format(appointmentDate1);

        showDialog(
            context: StackedService.navigatorKey!.currentContext!,
            builder: (context) => AlertDialog(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                  content: Container(
                    padding: EdgeInsets.only(bottom: 0.5.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        SizedBox(
                          width: 45.w,
                          height: 15.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.translate(
                                    'user_db_video_session_text_26')!,
                                style: TextStyle(
                                    fontSize: 1.5.t,
                                    fontFamily: FontUtils.montserratRegular),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              // Text(
                              //   jsonData['data']['therapistName'],
                              //   style: TextStyle(
                              //       fontSize: 1.5.t,
                              //       fontFamily: FontUtils.montserratSemiBold),
                              // ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                waqt,
                                style: TextStyle(
                                    fontSize: 2.t,
                                    fontFamily: FontUtils.montserratBold),
                              ),
                              // SizedBox(
                              //   height: 1.5.h,
                              // ),
                              // Expanded(
                              //   child: Row(
                              //     children: [
                              //       Flexible(
                              //         child: RichText(
                              //           text: TextSpan(
                              //             text: 'Patient : ',
                              //             style: TextStyle(
                              //                 fontFamily: FontUtils
                              //                     .montserratSemiBold,
                              //                 fontSize: 1.5.t,
                              //                 color: ColorUtils.black),
                              //             children: <TextSpan>[
                              //               TextSpan(
                              //                   text: model.username,
                              //                   style: TextStyle(
                              //                       color:
                              //                           ColorUtils.purple)),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        InkWell(
                            onTap: () {
                              model.navigateBack();
                              model.notifyListeners();
                            },
                            child: Container(
                              width: 45.w,
                              padding: EdgeInsets.symmetric(
                                vertical: 2.h,
                              ),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(0, 8),
                                        color: ColorUtils.grey.withOpacity(0.4))
                                  ],
                                  color: ColorUtils.LightGrey,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('app_popup_text_2')!,
                                  style: TextStyle(
                                      color: ColorUtils.black,
                                      fontFamily: FontUtils.montserratSemiBold),
                                ),
                              ),
                            )
                            // Button(
                            //     AppLocalizations.of(context)!
                            //         .translate('app_popup_text_2')!,
                            //     15)
                            )
                      ],
                    ),
                  ),
                ));
      } else {
        DialogUtils().showDialog(MyErrorWidget(error: jsonData['message']));
        rescheduleIsLoading = false;
        notifyListeners();
      }
    } else {
      DialogUtils().showDialog(MyErrorWidget(error: jsonData['message']));
      rescheduleIsLoading = false;
      notifyListeners();
    }
    getPatientAppointments();

    notifyListeners();
  }

  AssignedTherapist? therapistDetail;
  getAssignedTherapist() async {
    var response = await http.get(
        Uri.https(
            Constants.baseUrl, Constants.getAssignedTherapist, {'Id': userId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    therapistDetail = AssignedTherapist.fromJson(jsonData['data']);
    print(therapistDetail);
  }

  AssignedCS? customerDetail;
  getAssignedSupport() async {
    var response = await http.get(
        Uri.https(
            Constants.baseUrl, Constants.getAssignedSupport, {'Id': userId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    customerDetail = AssignedCS.fromJson(jsonData['data']);
    print(customerDetail);
  }

  String? token;
  int counter = 1;
  bool LoadingChats = false;
  getChatByUser() async {
    LoadingChats = true;
    notifyListeners();
    var data = {'Id': userId, 'page': 1};
    var encodedData = jsonEncode(data);
    var response = await http.get(
        Uri.https(
            Constants.baseUrl, Constants.getChatByUser, {'data': encodedData}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    token = jsonData['data']['token'];
    chats = (jsonData['data']['chats'] as List)
        .map((e) => ChatsData.fromJson(e))
        .toList();
    print(chats);
    List<ChatsData> tempchat = [];
    tempchat = chats;
    LoadingChats = false;

    chats = tempchat.where((element) => element.type == 0).toList();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      model.afterSubChatScroll.animateTo(
          model.afterSubChatScroll.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn);
      LoadingChats = false;
    });
    notifyListeners();
  }

  convertTimeToHonKong(date) {
    var hongKong = tz.getLocation('Asia/Hong_Kong');
    var chatDate = tz.TZDateTime.parse(hongKong, date);
    var chatTime = DateFormat('MMMM dd yyyy hh:mma').format(chatDate);
    print(chatTime);
    return chatTime;
  }

  bool LoadingCustomSuppChats = false;
  getChatOfCustomer() async {
    LoadingCustomSuppChats = true;
    notifyListeners();
    var data = {'Id': userId, 'page': counter};
    var encodedData = jsonEncode(data);
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getChatoFCustomer,
            {'data': encodedData}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    token = jsonData['data']['token'];
    chats = (jsonData['data']['chats'] as List)
        .map((e) => ChatsData.fromJson(e))
        .toList();
    LoadingCustomSuppChats = false;

    List<ChatsData> tempChat = [];
    tempChat = chats;
    chats = tempChat.where((element) => element.type == 0).toList();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      CustomerSuppChatScroll.animateTo(
          CustomerSuppChatScroll.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn);
      LoadingCustomSuppChats = false;
    });

    notifyListeners();
  }

  getChatOfCustomerOnRefresh() async {
    List<ChatsData> currentChat = [];
    currentChat.addAll(chats);
    var data = {'Id': userId, 'page': counter};
    var encodedData = jsonEncode(data);
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getChatoFCustomer,
            {'data': encodedData}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    aa = (jsonData['data']['chats'] as List)
        .map((e) => ChatsData.fromJson(e))
        .toList();
    List<ChatsData> tempList = [];
    tempList.addAll(aa.where((element) => element.type == 0).toList());
    tempList.addAll(currentChat);
    // chats = (jsonData['data']['chats'] as List)
    //     .map((e) => ChatsData.fromJson(e))
    //     .toList();
    chats = tempList;
    // chats.addAll(previousChat);
    notifyListeners();
  }

  List<ChatsData> aa = [];
  getChatByUserOnRefresh() async {
    List<ChatsData> currentChat = [];
    currentChat.addAll(chats);
    var data = {'Id': userId, 'page': counter};
    var encodedData = jsonEncode(data);
    var response = await http.get(
        Uri.https(
            Constants.baseUrl, Constants.getChatByUser, {'data': encodedData}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    aa = (jsonData['data']['chats'] as List)
        .map((e) => ChatsData.fromJson(e))
        .toList();
    List<ChatsData> tempList = [];
    tempList.addAll(aa.where((element) => element.type == 0).toList());
    tempList.addAll(currentChat);
    // chats = (jsonData['data']['chats'] as List)
    //     .map((e) => ChatsData.fromJson(e))
    //     .toList();
    chats = tempList;
    // chats.addAll(previousChat);
    notifyListeners();
  }

  List<ChatsData> chats = [];
  getChatByUserForTherapist(tappedId) async {
    var data = {'therapistId': therapistId, 'patientId': tappedId, 'page': 1};
    var encodedData = jsonEncode(data);
    var response = await http.post(
        Uri.https(Constants.baseUrl, Constants.getChatsByTherapist),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    token = jsonData['data']['token'];
    chats = (jsonData['data']['chats'] as List)
        .map((e) => ChatsData.fromJson(e))
        .toList();
    print(chats);
    List<ChatsData> tempchat = [];
    tempchat = chats;
    chats = chats.where((element) => element.type == 0).toList();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      model.therapistChatController.animateTo(
          model.therapistChatController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn);
    });
    notifyListeners();
  }

  int counterForTherapist = 1;
  getChatByUserForTherapistOnRefresh() async {
    List<ChatsData> currentChat = [];
    currentChat.addAll(chats);
    var data = {'Id': userId, 'page': counterForTherapist};
    var encodedData = jsonEncode(data);
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getChatsByTherapist,
            {'data': encodedData}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    aa = (jsonData['data']['chats'] as List)
        .map((e) => ChatsData.fromJson(e))
        .toList();
    List<ChatsData> tempList = [];
    tempList.addAll(aa.where((element) => element.type == 0).toList());
    tempList.addAll(currentChat);
    // chats = (jsonData['data']['chats'] as List)
    //     .map((e) => ChatsData.fromJson(e))
    //     .toList();
    chats = tempList;
    // chats.addAll(previousChat);
    notifyListeners();
  }

  saveMessage(therapistId) async {
    var data = {
      'type': 0,
      'isRead': false,
      'sendBy': 0,
      'data': afterSubChat.text,
      'first_user_id': therapistId,
      'second_user_id': userId,
      'createdAt': DateTime.now().toIso8601String()
    };
    var encodedData = jsonEncode(data);
    var response = await http.post(
        Uri.https(Constants.baseUrl, Constants.saveMessage),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    getChatByUser();
    notifyListeners();
  }

  saveMessageOfCustomer(therapistId) async {
    var data = {
      'type': 0,
      'isRead': false,
      'sendBy': 0,
      'data': customerSupportChat.text,
      'first_user_id': therapistId,
      'second_user_id': userId,
      'createdAt': DateTime.now().toIso8601String()
    };
    var encodedData = jsonEncode(data);
    var response = await http.post(
        Uri.https(Constants.baseUrl, Constants.saveMessage),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    getChatOfCustomer();
    notifyListeners();
  }

  saveMessageForTherapist(userId) async {
    var data = {
      'type': 0,
      'isRead': false,
      'sendBy': 1,
      'data': therapistChat.text,
      'first_user_id': therapistId,
      'second_user_id': userId,
      'createdAt': DateTime.now().toIso8601String()
    };
    var encodedData = jsonEncode(data);
    var response = await http.post(
        Uri.https(Constants.baseUrl, Constants.saveMessage),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken}'
        });
    print(response.body);
    getChatByUserForTherapist(userId);
    notifyListeners();
  }

  AppointmentUpcomingData? appointment;
  List<AppointmentUpcomingData> upcomingSession = [];
  var getDate;
  var getFinalDate;
  var onlyDate;
  getPatientAppointments() async {
    tz.initializeTimeZones();
    hongKong = tz.getLocation('Asia/Hong_Kong');
    onlyDate = DateTime.now().toString().split(" ")[0];
    print(onlyDate);
    var data = {'Id': userId, 'date': onlyDate};
    var encodedData = jsonEncode(data);

    var response = await http.post(
        Uri.https(
          Constants.baseUrl,
          Constants.getPatientOngoingAppointments,
        ),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    upcomingSession = (jsonData['data'] as List)
        .map((e) => AppointmentUpcomingData.fromJson(e))
        .toList();

    notifyListeners();
  }

  convetingDateToHongKong(appointment) {
    tz.initializeTimeZones();
    getDate =
        tz.TZDateTime.parse(tz.getLocation('Asia/Hong_Kong'), appointment);
    getFinalDate = DateFormat('hh:mma\nyyyy-MM-dd').format(getDate);
    return getFinalDate;
  }

  int? scheduleId;
  cancelAppointment() async {
    var response = await http.delete(
        Uri.https(Constants.baseUrl, Constants.cancelAppointment,
            {'Id': scheduleId.toString()}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    if (jsonData['code'] == "Error") {
      DialogUtils().showDialog(MyErrorWidget(error: jsonData['message']));
    } else
      data.add(jsonData['credits']);

    upcomingSession.remove(jsonData['data']['Id']);
    getPatientAppointments();
    notifyListeners();
  }

  List<ForTherapistAppointmentUpcomingData> therapistUpcomingData = [];
  bool loadingForAppointments = false;
  getTherapistAppointments() async {
    loadingForAppointments = true;
    notifyListeners();
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getTherapistAppointments,
            {'Id': therapistId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    therapistUpcomingData = (jsonData['data'] as List)
        .map((e) => ForTherapistAppointmentUpcomingData.fromJson(e))
        .toList();
    loadingForAppointments = false;
    notifyListeners();
  }

  TherapistData? therapistData;
  gettherapistById() async {
    var response = await http.get(
        Uri.https(
            Constants.baseUrl, Constants.gettherapistById, {'Id': therapistId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    therapistData = TherapistData.fromJson(jsonData['data']);
  }

  gettherapistByIdCheckingForTokenExpiry(therapistID, token) async {
    var response = await http.get(
        Uri.https(
            Constants.baseUrl, Constants.gettherapistById, {'Id': therapistID}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${token}'
        });
    print(response.body);
    if (response.statusCode == 200) {
      Navigator.pushAndRemoveUntil(
          StackedService.navigatorKey!.currentContext!,
          MaterialPageRoute(
            builder: (context) => TherapistBottomAppBar(),
          ),
          (route) => false);
    } else {
      model.logOut();
    }
  }

  var appointmentDate;
  var checkdate;
  getTherapistAppointmentsByDate() async {
    navigateBack();
    // checkdate = DateTime.parse(appointmentDate.toString());
    checkdate = appointmentDate.toString().split(' ')[0];

    var data = {'Id': therapistId, 'date': checkdate};
    var encodedData = jsonEncode(data);
    var response = await http.post(
        Uri.https(Constants.baseUrl, Constants.getTherapistAppointmentsByDate),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    therapistUpcomingData = (jsonData['data'] as List)
        .map((e) => ForTherapistAppointmentUpcomingData.fromJson(e))
        .toList();
    notifyListeners();
  }

  Socket? socket;
  var checkData;
  var idForSessionHistory;
  getPatientSessions() async {
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getPatientSessions,
            {'Id': idForSessionHistory}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
  }

  var weekDate;
  getTherapistAppointmentsByWeek() async {
    weekDate = DateTime.now().toString().split(" ")[0];
    print(weekDate);
    var data = {'Id': therapistId, 'date': weekDate};
    var encodedData = jsonEncode(data);
    var response = await http.post(
        Uri.https(Constants.baseUrl, Constants.getTherapistAppointmentsByWeek),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    therapistUpcomingData = (jsonData['data'] as List)
        .map((e) => ForTherapistAppointmentUpcomingData.fromJson(e))
        .toList();
    notifyListeners();
  }

  String? idForinfo;
  AllUserData? userData;
  AllUserData1() async {
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.allUserData,
            {"Id": model.patientKiId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken} '
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    userData = AllUserData.fromJson(jsonData['data']);
  }

  AllUserDataForClient() async {
    var response = await http.get(
        Uri.https(
            Constants.baseUrl, Constants.allUserData, {"Id": user1.patient_id}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${user1.access_token} '
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    userData = AllUserData.fromJson(jsonData['data']);
    username = userData!.name!;
    notifyListeners();
  }

  AllUserDataForCheckingTokenExpiry(checkId, token) async {
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.allUserData, {"Id": checkId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${token} '
        });
    print(response.body);
    if (response.statusCode == 200) {
      Navigator.pushAndRemoveUntil(
          StackedService.navigatorKey!.currentContext!,
          MaterialPageRoute(
            builder: (context) => BottomAppBarCustom(),
          ),
          (route) => false);
    } else {
      model.logOut();
    }
    notifyListeners();
  }

  getUserPlanForTherapist() async {
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getUserPlan,
            {"Id": model.patientKiId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    checkUserPlan =
        (jsonData['data'] as List).map((e) => userPlan.fromJson(e)).toList();
    print(checkUserPlan);
  }

  var appointmentkiId;
  var sessionId;
  SessionDetail? sessionDetail;
  getSessionFromTherapistByAppointmentId() async {
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getSessionByAppointmentId,
            {"Id": appointmentkiId.toString()}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    sessionDetail = SessionDetail.fromJson(jsonData['data']);
    print(sessionDetail);
    await joinSessionByTherapist();
    Navigator.push(
        StackedService.navigatorKey!.currentContext!,
        MaterialPageRoute(
            builder: (context) => LiveVideoFromTherapist(
                  sessionId: sessionDetail!.sessionId,
                )));
  }

  getSessionFromTherapistByAppointmentIdOnAudioCall() async {
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getSessionByAppointmentId,
            {"Id": appointmentkiId.toString()}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    sessionDetail = SessionDetail.fromJson(jsonData['data']);
    print(sessionDetail);
    await joinSessionByTherapist();
    Navigator.push(
        StackedService.navigatorKey!.currentContext!,
        MaterialPageRoute(
            builder: (context) => LiveVideoOnAudioForTherapist(
                  sessionId: sessionDetail!.sessionId,
                )));
  }

  getSessionByAppointmentId() async {
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getSessionByAppointmentId,
            {"Id": appointmentkiId.toString()}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    sessionDetail = SessionDetail.fromJson(jsonData['data']);
    print(sessionDetail);
    await joinSessionByPatient();
    Navigator.push(
        StackedService.navigatorKey!.currentContext!,
        MaterialPageRoute(
            builder: (context) => LiveVideo(
                  sessionId: sessionDetail!.sessionId,
                )));
  }

  getSessionByAppointmentIdOnAudioCall() async {
    var response = await http.get(
        Uri.https(Constants.baseUrl, Constants.getSessionByAppointmentId,
            {"Id": appointmentkiId.toString()}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    sessionDetail = SessionDetail.fromJson(jsonData['data']);
    print(sessionDetail);
    await joinSessionByPatient();
    Navigator.push(
        StackedService.navigatorKey!.currentContext!,
        MaterialPageRoute(
            builder: (context) => LiveVideoOnAudio(
                  sessionId: sessionDetail!.sessionId,
                )));
  }

  String? sessionToken;
  String? sessionChannel;
  Future joinSessionByPatient() async {
    var data = {'Id': sessionDetail!.sessionId, 'patientId': userId};
    var encodedData = jsonEncode(data);
    var response = await http.post(
        Uri.https(Constants.baseUrl, Constants.joinSessionByPatient),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    sessionToken = jsonData['data']['token'];
    sessionChannel = jsonData['data']['channel'];
    notifyListeners();
  }

  Future joinSessionByPatientCheck() async {
    var data = {'Id': sessionDetail!.sessionId, 'patientId': userId};
    var encodedData = jsonEncode(data);
    var response = await http.post(
        Uri.https(Constants.baseUrl, Constants.joinSessionByPatient),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    return jsonData['data']['token'];
  }

  Future joinSessionByTherapist() async {
    var data = {'Id': sessionDetail!.sessionId, 'therapistId': therapistId};
    var encodedData = jsonEncode(data);
    var response = await http.post(
        Uri.https(Constants.baseUrl, Constants.joinSessionByTherapist),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    sessionToken = jsonData['data']['token'];
    sessionChannel = jsonData['data']['channel'];
    notifyListeners();
  }

  Future joinSessionByTherapistForToken() async {
    var data = {'Id': sessionDetail!.sessionId, 'therapistId': therapistId};
    var encodedData = jsonEncode(data);
    var response = await http.post(
        Uri.https(Constants.baseUrl, Constants.joinSessionByTherapist),
        body: encodedData,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken}'
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    return jsonData['data']['token'];
  }

  int? journalId;
  deleteJournal() async {
    var response = await http.delete(
        Uri.https(Constants.baseUrl, Constants.deleteJournal,
            {'Id': journalId.toString()}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${userToken}'
        });
    print(response.body);
    getJournals();
    notifyListeners();
  }

  getUserDetailfromTherapist(tappedId) async {
    var response = await http.get(
        Uri.https(Constants.baseUrl, "/getUserById", {"Id": user1.patient_id!}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${user1.access_token} '
        });
    print(response.body);
    var data = jsonDecode(response.body);
  }

  List<SessionHistoryOfPatient> sessionHistoryOfPatient = [];
  SessionHistoryData? patientData;
  getSessionHistory(tappedId) async {
    var response = await http.get(
        Uri.https(
            Constants.baseUrl, Constants.getSessionHistory, {'Id': tappedId}),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': 'bearer ${therapistToken} '
        });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    sessionHistoryOfPatient = (jsonData['data'] as List)
        .map((e) => SessionHistoryOfPatient.fromJson(e))
        .toList();
    print(sessionHistoryOfPatient);
    notifyListeners();
  }

  completeSession(appointmentId) async {
    var data = {'Id': appointmentId};
    var encodedData = jsonEncode(data);
    var response = await http.post(
      Uri.https(Constants.baseUrl, Constants.completeSession),
      body: encodedData,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': 'bearer ${therapistToken}'
      },
    );
    print(response.body);
    var jsonData = jsonDecode(response.body);
    therapistUpcomingData
        .removeWhere((element) => element.id == jsonData['data']);
    notifyListeners();
  }

  AgoraRtmClient? client;
  AgoraRtmChannel? channel;
  LogController logController = LogController();
  Future createClient() async {
    client = await AgoraRtmClient.createInstance(appId);
    client?.onMessageReceived = (AgoraRtmMessage message, String peerId) {
      logController.addLog(message.text);
    };
    // client?.onConnectionStateChanged = (int state, int reason) {
    //   logController.addLog("Connection Status Changed: " +
    //       state.toString() +
    //       ', reason: ' +
    //       reason.toString());
    //   if (state == 5) {
    //     client?.logout();
    //     logController.addLog('Logout.');
    //   }
    // };
  }

  Future<AgoraRtmChannel?> createChannel(String name) async {
    AgoraRtmChannel? channel = await client?.createChannel(name);
    channel?.onMemberJoined = (AgoraRtmMember member) {
      logController.addLog(
          "Member Joined: " + member.userId + ', channel: ' + member.channelId);
    };
    channel?.onMemberLeft = (AgoraRtmMember member) {
      logController.addLog(
          "Member Left: " + member.userId + ', channel: ' + member.channelId);
    };
    channel?.onMessageReceived =
        (AgoraRtmMessage message, AgoraRtmMember member) {
      logController
          .addLog("Public Messge From " + member.userId + ": " + message.text);
    };
    return channel;
  }

  Future logIn(BuildContext context) async {
    try {
      await client!.login(token, userId);

      // logController.addLog("Login success: " + userId);
      // joinChannel(context);
    } catch (e) {
      print('Login error: ' + e.toString());
    }
  }

  Future logInForTherapist() async {
    try {
      await client!.login(token, therapistId);
      // logController.addLog("Login success: " + userId);
      // joinChannel(context);
    } catch (e) {
      print('Login error: ' + e.toString());
    }
  }

  // Future joinChannel(BuildContext context) async {
  //   try {
  //     channel = await createChannel(userId);
  //     await channel!.join();
  //     // logController.addLog('Join channel success.');
  //   } catch (e) {
  //     print('Login error: ' + e.toString());
  //   }
  // }
  bool? isOnline;
  void isUserOnline(checkerId) async {
    Map<dynamic, dynamic> result =
        await client!.queryPeersOnlineStatus([checkerId]);
    print(result);
    isOnline = result[checkerId];
    print(isOnline);
    notifyListeners();
  }

  String? therapistIdDo;
  Future sendPeerMessage() async {
    // try {
    print(therapistIdDo);
    AgoraRtmMessage message = AgoraRtmMessage.fromText(afterSubChat.text);
    await client!
        .sendMessageToPeer(therapistIdDo.toString(), message, true, false);
    logController.addLog(message.text.toString());
    print(afterSubChat.text);
    // } catch (e) {}
  }

  Future sendPeerMessageForTherapist(patientId) async {
    // try {
    print(therapistIdDo);
    AgoraRtmMessage message = AgoraRtmMessage.fromText(therapistChat.text);
    await client!.sendMessageToPeer(patientId.toString(), message, true, false);
    logController.addLog(message.text.toString());
    // print(afterSubChat.text);

    // } catch (e) {}
  }

  void sendChannelMessage() async {}

  logOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    user1 = User1();
    sharedPreferences.clear();
    navigation_Service.navigateToUntil(to: LoginTabBar());
    notifyListeners();
  }

  // userChangePassword() async {
  //   var data = {
  //     'Id': user.patient_id,
  //     'currentPassword': currentPassword.text.toString(),
  //     'newPassword': newPassword.text.toString()
  //   };
  //   String encodedData = jsonEncode(data);
  //   var response = await http.put(
  //       Uri.https(Constants.baseUrl, Constants.userChangePassword),
  //       headers: {
  //         'content-type': 'application/json',
  //         'accept': 'application/json',
  //         'authorization': 'bearer ${user.access_token}'
  //       },
  //       body: encodedData);
  //   var jsonData = jsonDecode(response.body);
  //   print(jsonData);
  // }

  // userAllData() async {
  //   user = await getUser();
  //   // String url = "/getUserById?Id=${user.patient_id!}";
  //   var response = await http.get(
  //       Uri.https(Constants.baseUrl, "/getUserById", {"Id": user.patient_id!}),
  //       headers: {
  //         'content-type': 'application/json',
  //         'accept': 'application/json',
  //         'authorization': 'bearer ${user.access_token} '
  //       });
  //   print(response.body);
  //   var data = jsonDecode(response.body);
  //   var json = User.fromJson(data['data']);
  //   user = json;
  //   saveUser(user);
  //   print(json);
  //   // var newResponse = User.fromJson(response.);
  // }

  // Future<bool> saveNamePreference(String name) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString("name", name);
  //   // ignore: deprecated_member_use
  //   return prefs.commit();
  // }

  // Future<String?> getNamePreference() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? name = prefs.getString("name");
  //   return name;
  // }

  // String _name = "";

  Future<void> saveUser(User1 user) async {
    await sharedPreferences!.setString('Id', user.patient_id.toString());
    await sharedPreferences!
        .setString('access_token', user.access_token.toString());
    await sharedPreferences!.setString('email', user.email.toString());
    await sharedPreferences!.setString('name', user.name.toString());
    // await sharedPreferences!.setInt('age', int.parse(user.age.toString()));
    await sharedPreferences!
        .setString('phone_number', user.phone_number.toString());
    await sharedPreferences!.setString('gender', user.gender.toString());
    await sharedPreferences!
        .setString('councelor_gender', user.councelor_gender.toString());
    await sharedPreferences!
        .setString('prefered_lang', user.prefered_lang.toString());
    await sharedPreferences!
        .setString('tell_us_more', user.tell_us_more.toString());
    await sharedPreferences!
        .setString('mental_problems', user.problems.toString());
    await sharedPreferences!.setString('emc_name', user.emc_name.toString());
    await sharedPreferences!
        .setString('emc_relation', user.emc_relation.toString());
    await sharedPreferences!
        .setString('emc_phone_number', user.emc_phone_number.toString());
    // await sharedPreferences!.setInt('planType', user.planType!);

    await sharedPreferences!.setInt('selectedAppLanguage', selectedAppLanguage);
  }

  Future<User1> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    user1.access_token = sharedPreferences.getString('access_token') ?? "";
    // userToken = sharedPreferences.getString('access_token') ?? "";
    user1.patient_id = sharedPreferences.getString('Id') ?? "0";
    // userId = sharedPreferences.getString('Id') ?? "0";
    user1.name = sharedPreferences.getString('name') ?? "";
    // username = sharedPreferences.getString('name') ?? "";
    // userEmail = sharedPreferences.getString('email') ?? "";
    userPhoneNumber =
        user1.phone_number = sharedPreferences.getString('phone') ?? "";
    userkaGender = user1.gender = sharedPreferences.getString('Gender') ?? "";
    user1.councelor_gender =
        sharedPreferences.getString('councelor_gender') ?? "";
    user1.prefered_lang = sharedPreferences.getString('prefered_lang') ?? "";
    user1.tell_us_more = sharedPreferences.getString('tell_us_more') ?? "";
    emergencyName.text =
        user1.tell_us_more = sharedPreferences.getString('emc_name') ?? "";
    emergencyRelation.text =
        user1.tell_us_more = sharedPreferences.getString('emc_relation') ?? "";
    emergencyPhoneNumber.text = user1.tell_us_more =
        sharedPreferences.getString('emc_phone_number') ?? "";
    selectedApplicationLanguage =
        sharedPreferences.getInt('selectedAppLanguage') ?? 0;
    planType = sharedPreferences.getInt('planType') ?? 0;
    // user.Diseases = sharedPreferences!.getStringList('mental_problems') ?? [];
    return user1;
  }

  // void updateName(String? name) {
  //   _name = name!;
  //   notifyListeners();
  // }

  messageScreenBackspacePressed() {
    messageScreenChatController
      ..text =
          messageScreenChatController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: messageScreenChatController.text.length));
  }

  myContactOnBackspacePressed() {
    myContactsChatController
      ..text = myContactsChatController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: myContactsChatController.text.length));
  }

  groupScreenOnBackspacePressed() {
    groupScreenChatController
      ..text = groupScreenChatController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: groupScreenChatController.text.length));
  }

  onBackspacePressed() {
    chatController
      ..text = chatController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: chatController.text.length));
  }

  void addRemoveDrink(int index) {
    // drinkIndex = index + 1;
    //drinkIndexList.length = index + 1;
    notifyListeners();

    //drinkIndex = index + 1;
    //notifyListeners();
  }

/*Navigation Functions */
  void navigateToOnBoard() {
    navigationService.navigateToOnBoard();
  }

  void navigateToOnBoardPotential() {
    navigationService.navigateToOnBoardPotential();
  }

  void navigateToForgetOtpCheck() {
    navigationService.navigateToForgetOtpCheck();
  }

  void navigateToOnBoardAppointment() {
    navigationService.navigateToOnBoardAppointment();
  }

  void navigateToOnBoardAppointmentnavigateToOnBoardAppointmentToRegister() {
    navigationService.navigateToOnBoardAppointmentToRegister();
  }

  void navigateToOnBoardFromSplash() {
    navigationService.navigateToOnBoardFromSplash();
  }

  void navigateToforgetPassword() {
    navigationService.navigateToforgetPassword();
  }

  void navigateToLoginTabBar() {
    navigationService.navigateToLogin();
  }

  void navigateToVerifyEmail() {
    navigationService.navigateToVerifyEmail();
  }

  void navigateToCreatePass() {
    navigationService.navigateToCreatePass();
  }

  void navigateToOTP() {
    navigationService.navigateToOTP();
  }

  void navigateToEncripted() {
    navigationService.navigateToEncripted();
  }

  void navigateToExtra() {
    navigationService.navigateToExtra();
  }

  void navigateToGender() {
    navigationService.navigateToGender();
  }

  void navigateToCounsellorLang() {
    navigationService.navigateToCounsellorLang();
  }

  void navigateToBlog() {
    navigationService.navigateToBlog();
  }

  void navigateToBlogPreview() {
    navigationService.navigateToBlogPreview();
  }

  void navigateToDisease() {
    navigationService.navigateToDisease();
  }

  void navigateToCounsellor() {
    navigationService.navigateToCounsellor();
  }

  void navigateToSuicidalIdea() {
    navigationService.navigateToSuicidalIdea();
  }

  void navigateToSuicidalHelp() {
    navigationService.navigateToSuicidalHelp();
  }

  void navigateToTellUsMore() {
    navigationService.navigateToTellUsMore();
  }

  void navigateToFindingCounsellor() {
    navigationService.navigateToFindingCounsellor();
  }

  void navigateToHome() {
    navigationService.navigateToHome();
  }

  void navigateToBookSessionS() {
    navigationService.navigateToBookSession();
  }

  void navigateToReports() {
    navigationService.navigateToReports();
  }

  void navigateToViewAll() {
    navigationService.navigateToViewAll();
  }

  void navigateToMyJournal() {
    navigationService.navigateToMyJournal();
  }

  void navigateToWriteJournal() {
    navigationService.navigateToWriteJournal();
  }

  void navigateToLiveVideo() {
    navigationService.navigateToLiveVideo();
  }

  void navigateToAfterChat(id) {
    navigationService.navigateToAfterChat(id);
  }

  void navigateToBeforeChat() {
    navigationService.navigateToBeforeChat();
  }

  void navigateToSupportChat() {
    navigationService.navigateToSupportChat();
  }

  void navigateToThrepistDetails() {
    navigationService.navigateToThrepistDetails();
  }

  void navigateToSubscription() {
    navigationService.navigateToSubscription();
  }

  void navigateToChooseYourPlan() {
    navigationService.navigateToChooseYourPlan();
  }

  void navigateToReviewDetails() {
    navigationService.navigateToReviewDetails();
  }

  void navigateToCheckout() {
    navigationService.navigateToCheckout();
  }

  void navigateToPaymentSuccess() {
    navigationService.navigateToPaymentSuccess();
  }

  void navigateToManageSubs() {
    navigationService.navigateToManageSubs();
  }

  void navigateToAccountDetails() {
    navigationService.navigateToAccountDetails();
  }

  void navigateToBookSessionSchedule() {
    navigationService.navigateToBookSessionSchedule();
  }

  void navigateToTherapistLogin() {
    navigationService.navigateToTherapistLogin();
  }

  void navigateToTherapistHome() {
    navigationService.navigateToTherapistHome();
  }

  void navigateToWaitingToJoin() {
    navigationService.navigateToWaitingToJoin();
  }

  void navigateToWriteReports() {
    navigationService.navigateToWaitingToJoin();
  }

  void navigateToTherapistAccountDetails() {
    navigationService.navigateToTherapistAccountDetails();
  }

  void navigateToTherapistReports() {
    navigationService.navigateToTherapistReports();
  }

  void navigateToTherapistWriteReports() {
    navigationService.navigateToTherapistWriteReports();
  }

  void navigateToTherapistJournals() {
    navigationService.navigateToTherapistJournals();
  }

  void navigateToClientFullJournals() {
    navigationService.navigateToClientFullJournals();
  }

  void navigateToSessionHistory() {
    navigationService.navigateToSessionHistory();
  }

  // void navigateTo() {
  //   navigationService.navigateTo();
  // }

  /* Pop functions*/

  void navigateBack() {
    navigationService.navigateBack();
  }

  void navigateBackLogin() {
    navigationService.navigateBackLogin();
  }

  /*AnimationController? buttonController;
  Animation<double>? rotate;
  Animation<double>? right;
  Animation<double>? bottom;
  Animation<double>? width;
  double backCardWidth = -10.0;
  int flag = 0;

  List data = [ImageUtils.girl1, ImageUtils.girl2, ImageUtils.girl1, ImageUtils.girl2, ImageUtils.girl1];
  List selectedData = [];

  void initSwipe() {

    rotate = Tween<double>(
      begin: -0.0,
      end: -40.0,
    ).animate(
      CurvedAnimation(
        parent: buttonController!,
        curve: Curves.ease,
      ),
    );
    rotate!.addListener(() {
      if (rotate!.isCompleted) {
        var i = data.removeLast();
        data.insert(0, i);
        buttonController!.reset();
      }
      notifyListeners();
    });

    right = Tween<double>(
      begin: 0.0,
      end: 400.0,
    ).animate(
      CurvedAnimation(
        parent: buttonController!,
        curve: Curves.ease,
      ),
    );
    bottom = Tween<double>(
      begin: 15.0,
      end: 100.0,
    ).animate(
      CurvedAnimation(
        parent: buttonController!,
        curve: Curves.ease,
      ),
    );
    width = Tween<double>(
      begin: 20.0,
      end: 25.0,
    ).animate(
      CurvedAnimation(
        parent: buttonController!,
        curve: Curves.bounceOut,
      ),
    );
  }

  Future<Null> swipeAnimation() async {
    try {
      await buttonController!.forward();
    } on TickerCanceled {}
  }

  dismissImg(String img) {
    data.remove(img);
    notifyListeners();
  }

  addImg(String img) {
    data.remove(img);
    selectedData.add(img);
    notifyListeners();
  }

  swipeRight() {
    if (flag == 0){
      flag = 1;
    }
    notifyListeners();
    swipeAnimation();
  }

  swipeLeft() {
    if (flag == 1){
      flag = 0;
    }
    notifyListeners();
    swipeAnimation();
  }*/

}
