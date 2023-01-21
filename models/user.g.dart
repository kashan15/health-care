// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User1 _$User1FromJson(Map<String, dynamic> json) => User1()
  ..patient_id = json['patient_id'] as String?
  ..patientStatus = json['patientStatus'] as int?
  ..name = json['name'] as String?
  ..age = json['age'] as int?
  ..email = json['email'] as String?
  ..password = json['password'] as String?
  ..phone_number = json['phone_number'] as String?
  ..access_token = json['access_token'] as String?
  ..gender = json['gender'] as String?
  ..problems = json['problems'] as List<dynamic>?
  ..prefered_lang = json['prefered_lang'] as String?
  ..councelor_gender = json['councelor_gender'] as String?
  ..tell_us_more = json['tell_us_more'] as String?
  ..emc_name = json['emc_name'] as String?
  ..emc_relation = json['emc_relation'] as String?
  ..emc_phone_number = json['emc_phone_number'] as String?
  ..patientJournals = json['patientJournals'] as List<dynamic>?
  ..planType = json['planType'] as int?;

Map<String, dynamic> _$User1ToJson(User1 instance) => <String, dynamic>{
      'patient_id': instance.patient_id,
      'patientStatus': instance.patientStatus,
      'name': instance.name,
      'age': instance.age,
      'email': instance.email,
      'password': instance.password,
      'phone_number': instance.phone_number,
      'access_token': instance.access_token,
      'gender': instance.gender,
      'problems': instance.problems,
      'prefered_lang': instance.prefered_lang,
      'councelor_gender': instance.councelor_gender,
      'tell_us_more': instance.tell_us_more,
      'emc_name': instance.emc_name,
      'emc_relation': instance.emc_relation,
      'emc_phone_number': instance.emc_phone_number,
      'patientJournals': instance.patientJournals,
      'planType': instance.planType,
    };
