import 'package:json_annotation/json_annotation.dart';

part 'therapist_data.g.dart';

@JsonSerializable()
class TherapistData {
  TherapistData();
  String? therapist_id;
  String? name;
  String? email;
  String? nameChinese;
  String? gender;
  String? language;
  int? paidCasses;
  String? image;
  String? qualification;

  factory TherapistData.fromJson(Map<String, dynamic> json) =>
      _$TherapistDataFromJson(json);
  Map<String, dynamic> toJson() => _$TherapistDataToJson(this);
}
