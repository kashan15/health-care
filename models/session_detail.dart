import 'package:json_annotation/json_annotation.dart';

part 'session_detail.g.dart';

@JsonSerializable()
class SessionDetail {
  SessionDetail();
  int?  sessionId;
  String?  appointmentId;
  
    factory SessionDetail.fromJson(Map<String, dynamic> json) => _$SessionDetailFromJson(json);
    Map<String, dynamic> toJson() => _$SessionDetailToJson(this);
}