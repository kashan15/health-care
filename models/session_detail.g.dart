// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionDetail _$SessionDetailFromJson(Map<String, dynamic> json) =>
    SessionDetail()
      ..sessionId = json['sessionId'] as int?
      ..appointmentId = json['appointmentId'] as String?;

Map<String, dynamic> _$SessionDetailToJson(SessionDetail instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'appointmentId': instance.appointmentId,
    };
