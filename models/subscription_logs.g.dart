// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_logs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

subscriptionLog _$subscriptionLogFromJson(Map<String, dynamic> json) =>
    subscriptionLog()
      ..id = json['id'] as int?
      ..userId = json['userId'] as String?
      ..detail = json['detail'] as String?
      ..detail_in_chinese = json['detail_in_chinese'] as String?
      ..createdAt = json['createdAt'] as String?
      ..updatedAt = json['updatedAt'] as String?;

Map<String, dynamic> _$subscriptionLogToJson(subscriptionLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'detail': instance.detail,
      'detail_in_chinese': instance.detail_in_chinese,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
