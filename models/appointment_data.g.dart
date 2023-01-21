// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmantData _$AppointmantDataFromJson(Map<String, dynamic> json) =>
    AppointmantData()
      ..therapistName = json['therapistName'] as String?
      ..therapistImage = json['therapistImage'] as String?
      ..appointmentDate = json['appointmentDate'] as String?;

Map<String, dynamic> _$AppointmantDataToJson(AppointmantData instance) =>
    <String, dynamic>{
      'therapistName': instance.therapistName,
      'therapistImage': instance.therapistImage,
      'appointmentDate': instance.appointmentDate,
    };
