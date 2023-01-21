import 'package:json_annotation/json_annotation.dart';

part 'session_history_data.g.dart';

@JsonSerializable()
class SessionHistoryData {
  SessionHistoryData();
  int? Id;
  String? appointmentDate;
  int? duration;
  String? patientId;
  String? therapistId;
  int? creditId;
  bool? isEnabled;
  int? status;
  String? createdAt;
  String? updatedAt;

  factory SessionHistoryData.fromJson(Map<String, dynamic> json) =>
      _$SessionHistoryDataFromJson(json);
  Map<String, dynamic> toJson() => _$SessionHistoryDataToJson(this);
}
