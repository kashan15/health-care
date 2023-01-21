import 'package:json_annotation/json_annotation.dart';

part 'subscription_logs.g.dart';

@JsonSerializable()
class subscriptionLog {
  subscriptionLog();
  int? id;
  String? userId;
  String? detail;
  String? detail_in_chinese;
  String? createdAt;
  String? updatedAt;
  
  factory subscriptionLog.fromJson(Map<String, dynamic> json) =>
      _$subscriptionLogFromJson(json);
  Map<String, dynamic> toJson() => _$subscriptionLogToJson(this);
}
