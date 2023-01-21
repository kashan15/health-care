import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:soulgood/Widget/bottom_app_bar.dart';
import 'package:soulgood/Widget/bottom_app_bar_custom.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/client-side-views/extra_information_start.dart';
import 'package:soulgood/client-side-views/full_reports.dart';
import 'package:soulgood/client-side-views/log.dart';
import 'package:soulgood/forgetpasss/create_new_pass.dart';
import 'package:soulgood/forgetpasss/encripted.dart';
import 'package:soulgood/forgetpasss/forget_pass.dart';
import 'package:soulgood/forgetpasss/otp.dart';
import 'package:soulgood/forgetpasss/verify_email.dart';
import 'package:soulgood/onboard/appointment.dart';
import 'package:soulgood/onboard/on_board.dart';
import 'package:soulgood/onboard/potential.dart';
import 'package:soulgood/client-side-views/account_details.dart';
import 'package:soulgood/client-side-views/after_subs_chat.dart';
import 'package:soulgood/client-side-views/appointment_schedule_book_session.dart';
import 'package:soulgood/client-side-views/before_subs_chat.dart';
import 'package:soulgood/client-side-views/blog_preview.dart';
import 'package:soulgood/client-side-views/blogs.dart';
import 'package:soulgood/client-side-views/book_session.dart';
import 'package:soulgood/client-side-views/check_out.dart';
import 'package:soulgood/client-side-views/choose_your_plan.dart';
import 'package:soulgood/client-side-views/counsellor.dart';
import 'package:soulgood/client-side-views/counsellor_lang.dart';
import 'package:soulgood/client-side-views/customer_support_chat.dart';
import 'package:soulgood/client-side-views/diseases.dart';
import 'package:soulgood/client-side-views/extra_info.dart';
import 'package:soulgood/client-side-views/finding_your_counsellor.dart';
import 'package:soulgood/client-side-views/full_journal.dart';
import 'package:soulgood/client-side-views/gender.dart';
import 'package:soulgood/client-side-views/live_video.dart';
import 'package:soulgood/client-side-views/manage_subscription_plan.dart';
import 'package:soulgood/client-side-views/my_journals.dart';
import 'package:soulgood/client-side-views/payment_success.dart';
import 'package:soulgood/client-side-views/reports.dart';
import 'package:soulgood/client-side-views/review_detail.dart';
import 'package:soulgood/client-side-views/subscription.dart';
import 'package:soulgood/client-side-views/suicidal_help.dart';
import 'package:soulgood/client-side-views/suicidal_idea.dart';
import 'package:soulgood/client-side-views/tell_us_more.dart';
import 'package:soulgood/client-side-views/threpist_details.dart';
import 'package:soulgood/client-side-views/write_journal.dart';
import 'package:soulgood/registeration-login/login.dart';
import 'package:soulgood/registeration-login/login_tab_bar.dart';
import 'package:soulgood/registeration-login/register.dart';
import 'package:soulgood/therapist-side-view/clients_journals.dart';
import 'package:soulgood/therapist-side-view/full_client_journal.dart';
import 'package:soulgood/therapist-side-view/reports.dart';
import 'package:soulgood/therapist-side-view/session_history.dart';
import 'package:soulgood/therapist-side-view/therapist_account_detail.dart';
import 'package:soulgood/therapist-side-view/home.dart';
import 'package:soulgood/therapist-side-view/login.dart';
import 'package:soulgood/therapist-side-view/waiting_to_join.dart';
import 'package:soulgood/therapist-side-view/write_report.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:soulgood/viewModels/navigation_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NavigationViewModel extends BaseViewModel {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  var navigationService = Navigation_Service();

  void navigateToOnBoard() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: OnBoard(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: OnBoard());
  }

  void navigateToOnBoardPotential() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: Potential(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: Potential());
  }

  void navigateToOnBoardAppointment() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: Appointment(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: Appointment());
  }

  void navigateToOnBoardAppointmentToRegister() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: Register(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: Register());
  }

  void navigateToOnBoardFromSplash() {
    // navigationKey.currentState!.pushReplacement(PageTransition(
    //     child: OnBoard(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: OnBoard());
  }

  void navigateToforgetPassword() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: ForgetPassword(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: ForgetPassword());
  }

  void navigateToLogin() {
    navigationService.navigateToUntil(to: LoginTabBar());
  }

  void navigateToCreatePass() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: CreateNewPassword(),
    //     type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: CreateNewPassword());
  }

  void navigateToVerifyEmail() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: VerifyEmail(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: VerifyEmail());
  }

  void navigateToOTP() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: OTP(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: OTP());
  }

  void navigateToEncripted() {
    // navigationKey.currentState!.pushReplacement(PageTransition(
    //     child: Encripted(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: Encripted());
  }

  void navigateToExtra() {
    // navigationKey.currentState!.push(PageTransition(
    // child: ExtraInformation(),
    // type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: ExtraInformation());
  }

  void navigateToGender() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: Gender(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: Gender());
  }

  void navigateToDisease() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: Disease(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: Disease());
  }

  void navigateToCounsellorLang() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: CounsellorLanguage(),
    //     type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: CounsellorLanguage());
  }

  void navigateToCounsellor() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: Counsellor(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: Counsellor());
  }

  void navigateToSuicidalIdea() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: Suicidal(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: Suicidal());
  }

  void navigateToSuicidalHelp() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: SuicidalHelp(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: SuicidalHelp());
  }

  void navigateToTellUsMore() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: HowWeHelp(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: HowWeHelp());
  }

  void navigateToFindingCounsellor() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: FindingCounsellor(),
    //     type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: FindingCounsellor());
  }

  void navigateToHome() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: BottomAppBar1(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: BottomAppBarCustom());
  }

  void navigateToBookSession() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: BookSession(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: BookSession());
  }

  void navigateToReports() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: Reports(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: Reports());
  }

  void navigateToViewAll() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: FullReports(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: FullReports());
  }

  // void navigateToView() {
  //   navigationKey.currentState!.push(PageTransition(
  //       child: FullJournal(), type: PageTransitionType.rightToLeftWithFade));
  // }

  void navigateToMyJournal() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: MyJournals(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: MyJournals());
  }

  void navigateToWriteJournal() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: WriteJournal(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: WriteJournal());
  }

  void navigateToLiveVideo() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: LiveVideo(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: LiveVideo());
  }

  void navigateToAfterChat(id) {
    // navigationKey.currentState!.push(PageTransition(
    //     child: AfterSubsChats(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(
        to: AfterSubsChats(
      id: id,
      logController: model.logController,
    ));
  }

  void navigateToBeforeChat() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: BeforeSubsChat(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: BeforeSubsChat());
  }

  void navigateToSupportChat() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: CustomerSupportChat(),
    //     type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: CustomerSupportChat());
  }

  void navigateToThrepistDetails() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: ThrepistDetails(),
    //     type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: ThrepistDetails());
  }

  void navigateToBlog() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: Blog(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: Blog());
  }

  void navigateToBlogPreview() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: BlogPreview(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: BlogPreview());
  }

  void navigateToSubscription() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: Subscription(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: Subscription());
  }

  void navigateToChooseYourPlan() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: ChoosePlan(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: ChoosePlan());
  }

  void navigateToReviewDetails() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: ReviewDetails(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: ReviewDetails());
  }

  void navigateToCheckout() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: CheckOut(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: CheckOut());
  }

  void navigateToPaymentSuccess() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: PaymentSuccess(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: MyApp());
  }

  void navigateToManageSubs() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: ManageSubscriptionPlan(),
    //     type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: ManageSubscriptionPlan());
  }

  void navigateToAccountDetails() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: AccountDetails(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: AccountDetails());
  }

  void navigateToBookSessionSchedule() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: BookSessionSchedule(),
    //     type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: BookSessionSchedule());
  }

  //  Therapist Side //

  void navigateToTherapistLogin() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: TherapistLogin(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateToUntil(to: TherapistLogin());
  }

  void navigateToTherapistHome() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: TherapistHome(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateToUntil(to: TherapistHome());
  }

  void navigateToWaitingToJoin() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: WaitingToJoin(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: WaitingToJoin());
  }

  void navigateToTherapistAccountDetails() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: TherapistAccountDetails(),
    //     type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: TherapistAccountDetails());
  }

  void navigateToTherapistReports() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: TherapistReports(),
    //     type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: TherapistReports());
  }

  void navigateToTherapistWriteReports() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: WriteReport(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: WriteReport());
  }

  void navigateToTherapistJournals() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: TherapistJournals(),
    //     type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: TherapistJournals());
  }

  void navigateToClientFullJournals() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: ClientFullJournals(),
    //     type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: ClientFullJournals());
  }

  void navigateToSessionHistory() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: SessionHistory(), type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: SessionHistory());
  }

  void navigateToForgetOtpCheck() {
    // navigationKey.currentState!.push(PageTransition(
    //     child: CreateNewPassword(),
    //     type: PageTransitionType.rightToLeftWithFade));
    navigationService.navigateTo(to: CreateNewPassword());
  }

  void navigateBack() {
    StackedService.navigatorKey!.currentState!.pop();
  }

  void navigateBackLogin() {
    navigationKey.currentState!.pop();
  }

  /*void navigateToWelcomeScreen(){
    navigationKey.currentState!.pushReplacement(PageTransition(child: Welcome(), type: PageTransitionType.fade));
  }

  void navigateToHomeScreen(int index){
    //navigationKey.currentState!.pushAndRemoveUntil(PageTransition(child: Home(), type: PageTransitionType.fade),(Route<dynamic> route) => false);
    navigationKey.currentState!.pushAndRemoveUntil(PageTransition(child: MainView(index: index), type: PageTransitionType.fade),(Route<dynamic> route) => false);
  }

  void navigateToRegisterScreen(int from){
    navigationKey.currentState!.push(PageTransition(child: Register(from: from), type: PageTransitionType.fade));
  }

  void navigateBack(){
    navigationKey.currentState!.pop(PageTransition(child: UserDetails(), type: PageTransitionType.fade));
  }*/
}
