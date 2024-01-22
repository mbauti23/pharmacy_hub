// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as String,
      medications: (json['medications'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      orderDateUTC: json['orderDateUTC'] as String,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'medications': instance.medications,
      'orderDateUTC': instance.orderDateUTC,
    };
