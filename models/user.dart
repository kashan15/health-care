import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User1 {
  User1();

  String? patient_id;
  int? patientStatus;
  String? name;
  int? age;
  String? email;
  String? password;
  String? phone_number;
  String? access_token;
  String? gender;
  List<dynamic>? problems;
  String? prefered_lang;
  String? councelor_gender;
  String? tell_us_more;
  String? emc_name;
  String? emc_relation;
  String? emc_phone_number;
  List<dynamic>? patientJournals;
  int? planType;
  

  // String? patient_id;
  // String? gender;
  // String? phone_number;
  // String? councelor_gender;
  // String? prefered_lang;
  // String? tell_us_more;
  // int? patientStatus;
  // List<dynamic>? problems;

  User1.withData(
      this.name,
      this.email,
      this.password,
      this.phone_number,
      this.access_token,
      this.patient_id,
      this.patientStatus,
      this.gender,
      this.age,
      this.problems,
      this.prefered_lang,
      this.councelor_gender,
      this.tell_us_more,
      this.emc_name,
      this.emc_relation,
      this.emc_phone_number,
      this.planType);
  factory User1.fromJson(Map<String, dynamic> json) => _$User1FromJson(json);
  Map<String, dynamic> toJson() => _$User1ToJson(this);
}
