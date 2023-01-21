import 'package:json_annotation/json_annotation.dart';
import 'package:soulgood/models/session_history_data.dart';

part 'session_history.g.dart';

@JsonSerializable()
class SessionHistoryOfPatient {
  SessionHistoryOfPatient();
  String? date;
  List<SessionHistoryData>? data;
  factory SessionHistoryOfPatient.fromJson(Map<String, dynamic> json) =>
      _$SessionHistoryOfPatientFromJson(json);
  Map<String, dynamic> toJson() => _$SessionHistoryOfPatientToJson(this);
}
