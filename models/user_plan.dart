import 'package:json_annotation/json_annotation.dart';

part 'user_plan.g.dart';

@JsonSerializable()
class userPlan {
  userPlan();
  String? plan_id;
  int? type;
  String? title;
  String? title_in_chinese;
  String? detail;
  String? detail_in_chinese;
  int? total_amount;
  String? starts_date;
  String? end_date;
  int? total_credits;
  String? strip_subscription_id;
  
  factory userPlan.fromJson(Map<String, dynamic> json) =>
      _$userPlanFromJson(json);
  Map<String, dynamic> toJson() => _$userPlanToJson(this);
}
