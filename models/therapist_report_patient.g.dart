// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapist_report_patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

therapistReports _$therapistReportsFromJson(Map<String, dynamic> json) =>
    therapistReports()
      ..Id = json['Id'] as int?
      ..title = json['title'] as String?
      ..problem_list = json['problem_list'] as String?
      ..formulation = json['formulation'] as String?
      ..tasks_and_goals = json['tasks_and_goals'] as String?
      ..completed_tasks_and_goals = json['completed_tasks_and_goals'] as String?
      ..createdAt = json['createdAt'] as String?;

Map<String, dynamic> _$therapistReportsToJson(therapistReports instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'title': instance.title,
      'problem_list': instance.problem_list,
      'formulation': instance.formulation,
      'tasks_and_goals': instance.tasks_and_goals,
      'completed_tasks_and_goals': instance.completed_tasks_and_goals,
      'createdAt': instance.createdAt,
    };
