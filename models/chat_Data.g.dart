// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_Data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatsData _$ChatsDataFromJson(Map<String, dynamic> json) => ChatsData()
  ..id = json['id'] as int?
  ..type = json['type'] as int?
  ..data = json['data'] as String?
  ..isRead = json['isRead'] as bool?
  ..sendBy = json['sendBy'] as int?
  ..first_user_id = json['first_user_id'] as String?
  ..second_user_id = json['second_user_id'] as String?
  ..createdAt = json['createdAt'] as String?
  ..updatedAt = json['updatedAt'] as String?;

Map<String, dynamic> _$ChatsDataToJson(ChatsData instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'data': instance.data,
      'isRead': instance.isRead,
      'sendBy': instance.sendBy,
      'first_user_id': instance.first_user_id,
      'second_user_id': instance.second_user_id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
