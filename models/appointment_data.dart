import 'package:json_annotation/json_annotation.dart';
part 'appointment_data.g.dart';

@JsonSerializable()
class AppointmantData {
  AppointmantData();
  String? therapistName;
  String? therapistImage;
  String? appointmentDate;

  factory AppointmantData.fromJson(Map<String, dynamic> json) =>
      _$AppointmantDataFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmantDataToJson(this);
}
