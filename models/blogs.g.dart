// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blogs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiBlogs _$ApiBlogsFromJson(Map<String, dynamic> json) => ApiBlogs()
  ..id = json['id'] as int?
  ..title = json['title'] as String?
  ..title_in_chinese = json['title_in_chinese'] as String?
  ..author_name = json['author_name'] as String?
  ..posted_date = json['posted_date'] as String?
  ..description = json['description'] as String?
  ..description_in_chinese = json['description_in_chinese'] as String?
  ..image = json['image'] as String?
  ..createdAt = json['createdAt'] as String?
  ..updatedAt = json['updatedAt'] as String?;

Map<String, dynamic> _$ApiBlogsToJson(ApiBlogs instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'title_in_chinese': instance.title_in_chinese,
      'author_name': instance.author_name,
      'posted_date': instance.posted_date,
      'description': instance.description,
      'description_in_chinese': instance.description_in_chinese,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
