import 'package:json_annotation/json_annotation.dart';
part 'assigned_customer_support.g.dart';

@JsonSerializable()
class AssignedCS {
  AssignedCS();
String? therapist_id;
  String? name;
  String? email;
  String? gender;
  String? image;
  String? language;
  String? qualification;
  String? description;



  factory AssignedCS.fromJson(Map<String, dynamic> json) =>
      _$AssignedCSFromJson(json);
  Map<String, dynamic> toJson() => _$AssignedCSToJson(this);
}
