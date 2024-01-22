import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order extends Equatable {
  const Order({
    required this.id,
    required this.medications,
    required this.orderDateUTC,
  });

  final String id; // For our use case, the pharmacy ID
  final List<String> medications;
  final String orderDateUTC;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  @override
  List<Object?> get props => [id, medications, orderDateUTC];
}
