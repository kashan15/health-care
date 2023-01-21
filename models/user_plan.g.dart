// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

userPlan _$userPlanFromJson(Map<String, dynamic> json) => userPlan()
  ..plan_id = json['plan_id'] as String?
  ..type = json['type'] as int?
  ..title = json['title'] as String?
  ..title_in_chinese = json['title_in_chinese'] as String?
  ..detail = json['detail'] as String?
  ..detail_in_chinese = json['detail_in_chinese'] as String?
  ..total_amount = json['total_amount'] as int?
  ..starts_date = json['starts_date'] as String?
  ..end_date = json['end_date'] as String?
  ..total_credits = json['total_credits'] as int?
  ..strip_subscription_id = json['strip_subscription_id'] as String?;

Map<String, dynamic> _$userPlanToJson(userPlan instance) => <String, dynamic>{
      'plan_id': instance.plan_id,
      'type': instance.type,
      'title': instance.title,
      'title_in_chinese': instance.title_in_chinese,
      'detail': instance.detail,
      'detail_in_chinese': instance.detail_in_chinese,
      'total_amount': instance.total_amount,
      'starts_date': instance.starts_date,
      'end_date': instance.end_date,
      'total_credits': instance.total_credits,
      'strip_subscription_id': instance.strip_subscription_id,
    };
