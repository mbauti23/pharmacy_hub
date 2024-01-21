import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:nimble_code_exercise/service/dtos/pharmacies_response.dart';
import 'package:nimble_code_exercise/service/dtos/pharmacy_details_response.dart';
import 'package:retrofit/retrofit.dart';

part 'pharmacy_client.g.dart';

@RestApi(baseUrl: 'https://api-qa-demo.nimbleandsimple.com')
abstract class PharmacyClient {
  factory PharmacyClient(Dio dio, {String? baseUrl}) = _PharmacyClient;

  factory PharmacyClient.construct() {
    final dio = Dio();
    dio.options.headers['Access-Control-Allow-Origin'] = '*';
    dio.options.headers['Access-Control-Allow-Methods'] =
        'GET, POST, OPTIONS, PUT, PATCH, DELETE';
    dio.options.headers['Access-Control-Allow-Headers'] =
        'Origin, X-Requested-With, Content-wType, Accept';
    dio.options.headers['Access-Control-Allow-Credentials'] = true;
    dio.options.headers['Accept'] = '*/*';
    dio.options.contentType = 'application/json';
    return PharmacyClient(dio);
  }

  @GET('/pharmacies/info/{pharmacyId}')
  Future<PharmacyDetailsResponse> getPharmacyDetailsResponse(
      @Path('pharmacyId') String pharmacyId);
}

extension PharmacyHubClientUtils on PharmacyClient {
  Future<PharmaciesResponse> getPharmaciesResponse() async {
    final response = await rootBundle
        .loadString("assets/mock_data/pharmacies_response.json");
    return PharmaciesResponse.fromJson(json.decode(response));
  }

  Future<PharmacyDetailsResponse> getMockPharmacyDetailsResponse() async {
    final response = await rootBundle
        .loadString("assets/mock_data/pharmacy_details_response.json");
    return PharmacyDetailsResponse.fromJson(json.decode(response));
  }
}
