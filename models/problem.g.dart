// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Problems _$ProblemsFromJson(Map<String, dynamic> json) => Problems(
      json['Id'] as String,
      json['problemName'] as String,
      json['problemNameInChinese'] as String,
      json['status'] as bool,
    );

Map<String, dynamic> _$ProblemsToJson(Problems instance) => <String, dynamic>{
      'Id': instance.Id,
      'problemName': instance.problemName,
      'problemNameInChinese': instance.problemNameInChinese,
      'status': instance.status,
    };
