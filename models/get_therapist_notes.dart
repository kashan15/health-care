import 'package:json_annotation/json_annotation.dart';

part 'get_therapist_notes.g.dart';

@JsonSerializable()
class therapistNotes {
  therapistNotes();
  int? Id;
  String? note;
  String? patientId;
  String? therapistId;
  String? createdAt;
  String? updatedAt;
  factory therapistNotes.fromJson(Map<String, dynamic> json) =>
      _$therapistNotesFromJson(json);
  Map<String, dynamic> toJson() => _$therapistNotesToJson(this);
}
