// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'for_therapist_upcoming_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForTherapistAppointmentUpcomingData
    _$ForTherapistAppointmentUpcomingDataFromJson(Map<String, dynamic> json) =>
        ForTherapistAppointmentUpcomingData()
          ..id = json['id'] as int?
          ..appointmentDate = json['appointmentDate'] as String?
          ..duration = json['duration'] as int?
          ..patientName = json['patientName'] as String?
          ..patientEmail = json['patientEmail'] as String?
          ..therapistName = json['therapistName'] as String?
          ..therapistNameInChinese = json['therapistNameInChinese'] as String?
          ..therapistEmail = json['therapistEmail'] as String?
          ..status = json['status'] as int?
          ..isEnabled = json['isEnabled'] as int?;

Map<String, dynamic> _$ForTherapistAppointmentUpcomingDataToJson(
        ForTherapistAppointmentUpcomingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appointmentDate': instance.appointmentDate,
      'duration': instance.duration,
      'patientName': instance.patientName,
      'patientEmail': instance.patientEmail,
      'therapistName': instance.therapistName,
      'therapistNameInChinese': instance.therapistNameInChinese,
      'therapistEmail': instance.therapistEmail,
      'status': instance.status,
      'isEnabled': instance.isEnabled,
    };
