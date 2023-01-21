import 'package:json_annotation/json_annotation.dart';
part 'chat_Data.g.dart';

@JsonSerializable()
class ChatsData {
  ChatsData();
  int? id;
  int? type;
  String? data;
  bool? isRead;
  int? sendBy;
  String? first_user_id;
  String? second_user_id;
  String? createdAt;
  String? updatedAt;
   factory ChatsData.fromJson(Map<String, dynamic> json) =>
      _$ChatsDataFromJson(json);
  Map<String, dynamic> toJson() => _$ChatsDataToJson(this);
}
