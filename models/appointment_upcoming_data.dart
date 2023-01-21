import 'package:json_annotation/json_annotation.dart';
part 'appointment_upcoming_data.g.dart';

@JsonSerializable()
class AppointmentUpcomingData {
  AppointmentUpcomingData();
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

  factory AppointmentUpcomingData.fromJson(Map<String, dynamic> json) =>
      _$AppointmentUpcomingDataFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentUpcomingDataToJson(this);
}
