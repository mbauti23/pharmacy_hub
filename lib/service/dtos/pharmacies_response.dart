import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nimble_code_exercise/service/dtos/pharmacy.dart';

part 'pharmacies_response.g.dart';

@JsonSerializable()
class PharmaciesResponse extends Equatable {
  const PharmaciesResponse({this.pharmacies = const []});

  final List<Pharmacy> pharmacies;

  factory PharmaciesResponse.fromJson(Map<String, dynamic> json) =>
      _$PharmaciesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PharmaciesResponseToJson(this);

  @override
  List<Object?> get props => [pharmacies];
}
