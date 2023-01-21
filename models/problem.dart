import 'package:json_annotation/json_annotation.dart';

part 'problem.g.dart';

@JsonSerializable()
class Problems {
  final String Id;
  final String problemName;
  final String problemNameInChinese;
  final bool status;

  Problems(
      this.Id,
      this.problemName,
      this.problemNameInChinese,
      this.status
      );

   factory Problems.fromJson(Map<String, dynamic> json) => _$ProblemsFromJson(json);
    Map<String, dynamic> toJson() => _$ProblemsToJson(this);
}