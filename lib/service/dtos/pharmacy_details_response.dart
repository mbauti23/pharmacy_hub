import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nimble_code_exercise/service/dtos/pharmacy_details.dart';

part 'pharmacy_details_response.g.dart';

@JsonSerializable()
class PharmacyDetailsResponse extends Equatable {
  const PharmacyDetailsResponse({
    this.details,
    this.generatedTs,
    this.href,
    this.responseCode,
    this.value,
  });

  final String? details;
  final String? generatedTs;
  final String? href;
  final String? responseCode;
  final PharmacyDetails? value;

  factory PharmacyDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PharmacyDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PharmacyDetailsResponseToJson(this);

  @override
  List<Object?> get props => [
        details,
        generatedTs,
        href,
        responseCode,
        value,
      ];
}
