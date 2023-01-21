// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_customer_support.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignedCS _$AssignedCSFromJson(Map<String, dynamic> json) => AssignedCS()
  ..therapist_id = json['therapist_id'] as String?
  ..name = json['name'] as String?
  ..email = json['email'] as String?
  ..gender = json['gender'] as String?
  ..image = json['image'] as String?
  ..language = json['language'] as String?
  ..qualification = json['qualification'] as String?
  ..description = json['description'] as String?;

Map<String, dynamic> _$AssignedCSToJson(AssignedCS instance) =>
    <String, dynamic>{
      'therapist_id': instance.therapist_id,
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'image': instance.image,
      'language': instance.language,
      'qualification': instance.qualification,
      'description': instance.description,
    };
