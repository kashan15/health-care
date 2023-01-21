import 'package:json_annotation/json_annotation.dart';

part 'slots.g.dart';

@JsonSerializable()
class TherapistSlots {
  TherapistSlots();
  String? date;
  List<String>? slots;
  String? subEndDate;
  factory TherapistSlots.fromJson(Map<String, dynamic> json) =>
      _$TherapistSlotsFromJson(json);
  Map<String, dynamic> toJson() => _$TherapistSlotsToJson(this);
}
