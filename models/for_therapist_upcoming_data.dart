import 'package:json_annotation/json_annotation.dart';
part 'for_therapist_upcoming_data.g.dart';

@JsonSerializable()
class ForTherapistAppointmentUpcomingData {
  ForTherapistAppointmentUpcomingData();
  int? id;
  String? appointmentDate;
  int? duration;
  String? patientName;
  String? patientEmail;
  String? therapistName;
  String? therapistNameInChinese;
  String? therapistEmail;
  int? status;
  int? isEnabled;

  factory ForTherapistAppointmentUpcomingData.fromJson(Map<String, dynamic> json) =>
      _$ForTherapistAppointmentUpcomingDataFromJson(json);
  Map<String, dynamic> toJson() => _$ForTherapistAppointmentUpcomingDataToJson(this);
}
