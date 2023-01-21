// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_history_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionHistoryData _$SessionHistoryDataFromJson(Map<String, dynamic> json) =>
    SessionHistoryData()
      ..Id = json['Id'] as int?
      ..appointmentDate = json['appointmentDate'] as String?
      ..duration = json['duration'] as int?
      ..patientId = json['patientId'] as String?
      ..therapistId = json['therapistId'] as String?
      ..creditId = json['creditId'] as int?
      ..isEnabled = json['isEnabled'] as bool?
      ..status = json['status'] as int?
      ..createdAt = json['createdAt'] as String?
      ..updatedAt = json['updatedAt'] as String?;

Map<String, dynamic> _$SessionHistoryDataToJson(SessionHistoryData instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'appointmentDate': instance.appointmentDate,
      'duration': instance.duration,
      'patientId': instance.patientId,
      'therapistId': instance.therapistId,
      'creditId': instance.creditId,
      'isEnabled': instance.isEnabled,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
