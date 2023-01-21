// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_journal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientJournals _$PatientJournalsFromJson(Map<String, dynamic> json) =>
    PatientJournals(
      json['Id'] as int,
      json['title'] as String,
      json['description'] as String,
    );

Map<String, dynamic> _$PatientJournalsToJson(PatientJournals instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'title': instance.title,
      'description': instance.description,
    };
