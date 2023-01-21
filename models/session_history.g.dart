// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionHistoryOfPatient _$SessionHistoryOfPatientFromJson(
        Map<String, dynamic> json) =>
    SessionHistoryOfPatient()
      ..date = json['date'] as String?
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => SessionHistoryData.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SessionHistoryOfPatientToJson(
        SessionHistoryOfPatient instance) =>
    <String, dynamic>{
      'date': instance.date,
      'data': instance.data,
    };
