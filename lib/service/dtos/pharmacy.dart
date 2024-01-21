import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pharmacy.g.dart';

@JsonSerializable()
class Pharmacy extends Equatable {
  const Pharmacy({
    this.name,
    this.pharmacyId,
  });

  final String? name;
  final String? pharmacyId;

  factory Pharmacy.fromJson(Map<String, dynamic> json) =>
      _$PharmacyFromJson(json);
  Map<String, dynamic> toJson() => _$PharmacyToJson(this);

  @override
  List<Object?> get props => [name, pharmacyId];
}
