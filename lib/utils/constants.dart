class Constants {
  // static const String baseUrl = 'api.soulgoodhealth.com:5000';
  static const String baseUrl = 'api-prod.soulgoodhealth.com:5000';

  static const String registerUser = '/createPatient';

  static const String loginUser = '/userLogin';

  static const String otpCheck = '/verifyPatient';

  static const String resendOtp = '/sendOtpAgain';

  static const String diseases = '/showAllActiveProblems';

  static const String completeProfile = '/completeProfile';

  static const String allUserData = '/getUserById';

  static const String userChangeName = '/userChangeName';

  static const String userChangePassword = '/userChangePassword';

  static const String emergencyContact = '/addEmergencyContactInfo';

  static const String therapistLogin = '/therapistLogin';

  static const String therapistChangePassword = '/therapistChangePassword';

  static const String createJournal = '/createJournal';

  static const String getPatientJournals = '/getPatientJournals';

  static const String fullBlog = '/getAllTips';

  static const String blogImage = '/api/getFile';

  static const String paidTherapist = '/GetTherapistPaidClients';

  static const String getPlans = '/getPlans';

  static const String createReport = '/createReport';

  static const String getPatientReports = '/getPatientReports';

  static const String writeNote = '/writeNote';

  static const String getTherapistNote = '/getTherapistNote';

  static const String createCheckoutSession = '/createCheckoutSession';

  static const String facebookSignup = '/facebookSignup';

  static const String googleSignup = '/googleSignup';

  static const String getUserPlan = '/getUserPlan';

  static const String createBillingPortal = '/createBillingPortal';

  static const String getSubscriptionLogs = '/getSubscriptionLogs';

  static const String sendResetPassEmail = '/sendResetPassEmail';

  static const String sendResetPassEmailTherapist =
      '/sendResetPassEmailTherapist';

  static const String getUserCredits = '/getUserCredits';

  static const String createAdhocPortal = '/createAdhocPortal';

  static const String getTherapistSlotsByUserId = '/getTherapistSlotsByUserId';

  static const String getTherapistSlotsByDateAndUserId =
      '/getTherapistSlotsByDateAndUserId';

  static const String createAppointment = '/createAppointment';

  static const String getAssignedTherapist = '/getAssignedTherapist';

  static const String getAssignedSupport = '/getAssignedSupport';

  static const String getChatByUser = '/getTherapistChatByUser';

  static const String getChatsByTherapist = '/getChatsByTherapist';

  static const String getChatoFCustomer = '/getChatByUser';

  static const String getPatientAppointments = '/getPatientAppointments';

  static const String cancelAppointment = '/cancelAppointment';

  static const String getTherapistAppointments = '/getTherapistAppointments';

  static const String gettherapistById = '/gettherapistById';

  static const String getTherapistAppointmentsByDate =
      '/getTherapistAppointmentsByDate';

  static const String sheduleAppointment = '/sheduleAppointment';

  static const String getPatientSessions = '/getPatientSessions';

  static const String getTherapistAppointmentsByWeek =
      '/getTherapistAppointmentsByWeek';

  static const String getPatientOngoingAppointments =
      '/getPatientOngoingAppointments';

  static const String getSessionByAppointmentId = '/getSessionByAppointmentId';

  static const String joinSessionByPatient = '/joinSessionByPatient';

  static const String joinSessionByTherapist = '/joinSessionByTherapist';

  static const String deleteJournal = '/deleteJournal';

  static const String saveMessage = '/saveMessage';

  static const String getSessionHistory = '/getSessionHistory';

  static const String completeSession = '/completeSession';

  static const String lang = "EN";

  static const int user = 1;
  static const int bar = 2;
}

abstract class stupid {}
