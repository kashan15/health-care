// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_therapist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignedTherapist _$AssignedTherapistFromJson(Map<String, dynamic> json) =>
    AssignedTherapist()
      ..therapist_id = json['therapist_id'] as String?
      ..name = json['name'] as String?
      ..email = json['email'] as String?
      ..gender = json['gender'] as String?
      ..image = json['image'] as String?
      ..language = json['language'] as String?
      ..paidCasses = json['paidCasses'] as int?
      ..qualification = json['qualification'] as String?
      ..description = json['description'] as String?
      ..interests = (json['interests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList();

Map<String, dynamic> _$AssignedTherapistToJson(AssignedTherapist instance) =>
    <String, dynamic>{
      'therapist_id': instance.therapist_id,
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'image': instance.image,
      'language': instance.language,
      'paidCasses': instance.paidCasses,
      'qualification': instance.qualification,
      'description': instance.description,
      'interests': instance.interests,
    };
