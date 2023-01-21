// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapist_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapistData _$TherapistDataFromJson(Map<String, dynamic> json) =>
    TherapistData()
      ..therapist_id = json['therapist_id'] as String?
      ..name = json['name'] as String?
      ..email = json['email'] as String?
      ..nameChinese = json['nameChinese'] as String?
      ..gender = json['gender'] as String?
      ..language = json['language'] as String?
      ..paidCasses = json['paidCasses'] as int?
      ..image = json['image'] as String?
      ..qualification = json['qualification'] as String?;

Map<String, dynamic> _$TherapistDataToJson(TherapistData instance) =>
    <String, dynamic>{
      'therapist_id': instance.therapist_id,
      'name': instance.name,
      'email': instance.email,
      'nameChinese': instance.nameChinese,
      'gender': instance.gender,
      'language': instance.language,
      'paidCasses': instance.paidCasses,
      'image': instance.image,
      'qualification': instance.qualification,
    };
