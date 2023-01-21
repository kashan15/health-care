// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paid_clients_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaidClientsList _$PaidClientsListFromJson(Map<String, dynamic> json) =>
    PaidClientsList(
      json['patient_id'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['phone_number'] as String?,
      json['age'] as int?,
      json['gender'] as String?,
      json['tagIndex'] as String?,
    );

Map<String, dynamic> _$PaidClientsListToJson(PaidClientsList instance) =>
    <String, dynamic>{
      'isShowSuspension': instance.isShowSuspension,
      'patient_id': instance.patient_id,
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phone_number,
      'age': instance.age,
      'gender': instance.gender,
      'tagIndex': instance.tagIndex,
    };
