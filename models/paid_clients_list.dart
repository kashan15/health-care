import 'package:azlistview/azlistview.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paid_clients_list.g.dart';

@JsonSerializable()
class PaidClientsList extends ISuspensionBean {
  String? patient_id;
  String? name;
  String? email;
  String? phone_number;
  int? age;
  String? gender;
  String? tagIndex;
  PaidClientsList(this.patient_id, this.name, this.email, this.phone_number,
      this.age, this.gender,this.tagIndex);
  factory PaidClientsList.fromJson(Map<String, dynamic> json) =>
      _$PaidClientsListFromJson(json);
  Map<String, dynamic> toJson() => _$PaidClientsListToJson(this);

  @override
  String getSuspensionTag() {
    return tagIndex!;
  }
}
