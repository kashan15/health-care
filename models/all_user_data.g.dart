// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllUserData _$AllUserDataFromJson(Map<String, dynamic> json) => AllUserData()
  ..patient_id = json['patient_id'] as String?
  ..name = json['name'] as String?
  ..email = json['email'] as String?
  ..gender = json['gender'] as String?
  ..age = json['age'] as int?
  ..phone_number = json['phone_number'] as String?
  ..emc_phone_number = json['emc_phone_number'] as String?
  ..emc_name = json['emc_name'] as String?
  ..emc_relation = json['emc_relation'] as String?
  ..planType = json['planType'] as int?;

Map<String, dynamic> _$AllUserDataToJson(AllUserData instance) =>
    <String, dynamic>{
      'patient_id': instance.patient_id,
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'age': instance.age,
      'phone_number': instance.phone_number,
      'emc_phone_number': instance.emc_phone_number,
      'emc_name': instance.emc_name,
      'emc_relation': instance.emc_relation,
      'planType': instance.planType,
    };
