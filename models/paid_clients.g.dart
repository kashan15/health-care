// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paid_clients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaidClients _$PaidClientsFromJson(Map<String, dynamic> json) => PaidClients(
      json['group'] as String,
      (json['clients'] as List<dynamic>)
          .map((e) => PaidClientsList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaidClientsToJson(PaidClients instance) =>
    <String, dynamic>{
      'group': instance.group,
      'clients': instance.clients,
    };
