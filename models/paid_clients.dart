import 'package:azlistview/azlistview.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:soulgood/models/paid_clients_list.dart';

part 'paid_clients.g.dart';

@JsonSerializable()
class PaidClients {
  final String group;
  final List<PaidClientsList> clients;
  PaidClients(this.group, this.clients);
   factory PaidClients.fromJson(Map<String, dynamic> json) => _$PaidClientsFromJson(json);
  Map<String, dynamic> toJson() => _$PaidClientsToJson(this);

  
}

