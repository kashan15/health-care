import 'package:json_annotation/json_annotation.dart';

part 'therapist_report_patient.g.dart';

@JsonSerializable()
class therapistReports {
  therapistReports();
  int? Id;
  String? title;
  String? problem_list;
  String? formulation;
  String? tasks_and_goals;
  String? completed_tasks_and_goals;
  String? createdAt;

  factory therapistReports.fromJson(Map<String, dynamic> json) =>
      _$therapistReportsFromJson(json);
  Map<String, dynamic> toJson() => _$therapistReportsToJson(this);
}
