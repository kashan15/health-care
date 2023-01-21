import 'package:json_annotation/json_annotation.dart';
part 'all_user_data.g.dart';

@JsonSerializable()
class AllUserData {
  AllUserData();
  String? patient_id;
  String? name;
  String? email;
  String? gender;
  int? age;
  String? phone_number;
  String? emc_phone_number;
  String? emc_name;
  String? emc_relation;
  int? planType;









  factory AllUserData.fromJson(Map<String, dynamic> json) =>
      _$AllUserDataFromJson(json);
  Map<String, dynamic> toJson() => _$AllUserDataToJson(this);
}