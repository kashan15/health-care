import 'package:json_annotation/json_annotation.dart';
part 'patient_journal.g.dart';

@JsonSerializable()
class PatientJournals {
  final int Id;
  final String title;
  final String description;
  PatientJournals(this.Id, this.title, this.description);

  factory PatientJournals.fromJson(Map<String, dynamic> json) =>
      _$PatientJournalsFromJson(json);
  Map<String, dynamic> toJson() => _$PatientJournalsToJson(this);
}
