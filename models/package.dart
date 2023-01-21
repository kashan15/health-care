import 'package:json_annotation/json_annotation.dart';

part 'package.g.dart';

@JsonSerializable()
class Package {
  Package();
  String? plan_id;
  int? type;
  String? title;
  String? title_in_chinese;
  int? therapist_amount;
  int? platform_amount;
  int? total_amount;
  int? sessions;
  String? detail;
  String? detail_in_chinese;
  String? stripe_prod_id;
  String? stripe_price_id;
  String? createdAt;
  String? updatedAt;
  
  factory Package.fromJson(Map<String, dynamic> json) =>
      _$PackageFromJson(json);
  Map<String, dynamic> toJson() => _$PackageToJson(this);
}
