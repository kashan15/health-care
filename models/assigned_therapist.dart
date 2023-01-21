import 'package:json_annotation/json_annotation.dart';
part 'assigned_therapist.g.dart';

@JsonSerializable()
class AssignedTherapist {
  AssignedTherapist();
  String? therapist_id;
  String? name;
  String? email;
  String? gender;
  String? image;
  String? language;
  int? paidCasses;
  String? qualification;
  String? description;
  List<String>? interests;
  
  factory AssignedTherapist.fromJson(Map<String, dynamic> json) =>
      _$AssignedTherapistFromJson(json);
  Map<String, dynamic> toJson() => _$AssignedTherapistToJson(this);
}
