// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slots.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapistSlots _$TherapistSlotsFromJson(Map<String, dynamic> json) =>
    TherapistSlots()
      ..date = json['date'] as String?
      ..slots =
          (json['slots'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..subEndDate = json['subEndDate'] as String?;

Map<String, dynamic> _$TherapistSlotsToJson(TherapistSlots instance) =>
    <String, dynamic>{
      'date': instance.date,
      'slots': instance.slots,
      'subEndDate': instance.subEndDate,
    };
