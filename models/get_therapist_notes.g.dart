// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_therapist_notes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

therapistNotes _$therapistNotesFromJson(Map<String, dynamic> json) =>
    therapistNotes()
      ..Id = json['Id'] as int?
      ..note = json['note'] as String?
      ..patientId = json['patientId'] as String?
      ..therapistId = json['therapistId'] as String?
      ..createdAt = json['createdAt'] as String?
      ..updatedAt = json['updatedAt'] as String?;

Map<String, dynamic> _$therapistNotesToJson(therapistNotes instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'note': instance.note,
      'patientId': instance.patientId,
      'therapistId': instance.therapistId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
