// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Package _$PackageFromJson(Map<String, dynamic> json) => Package()
  ..plan_id = json['plan_id'] as String?
  ..type = json['type'] as int?
  ..title = json['title'] as String?
  ..title_in_chinese = json['title_in_chinese'] as String?
  ..therapist_amount = json['therapist_amount'] as int?
  ..platform_amount = json['platform_amount'] as int?
  ..total_amount = json['total_amount'] as int?
  ..sessions = json['sessions'] as int?
  ..detail = json['detail'] as String?
  ..detail_in_chinese = json['detail_in_chinese'] as String?
  ..stripe_prod_id = json['stripe_prod_id'] as String?
  ..stripe_price_id = json['stripe_price_id'] as String?
  ..createdAt = json['createdAt'] as String?
  ..updatedAt = json['updatedAt'] as String?;

Map<String, dynamic> _$PackageToJson(Package instance) => <String, dynamic>{
      'plan_id': instance.plan_id,
      'type': instance.type,
      'title': instance.title,
      'title_in_chinese': instance.title_in_chinese,
      'therapist_amount': instance.therapist_amount,
      'platform_amount': instance.platform_amount,
      'total_amount': instance.total_amount,
      'sessions': instance.sessions,
      'detail': instance.detail,
      'detail_in_chinese': instance.detail_in_chinese,
      'stripe_prod_id': instance.stripe_prod_id,
      'stripe_price_id': instance.stripe_price_id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
