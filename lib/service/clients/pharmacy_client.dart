import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:nimble_code_exercise/service/dtos/pharmacies/pharmacies_response.dart';
import 'package:nimble_code_exercise/service/dtos/pharmacy_details/pharmacy_details_response.dart';
import 'package:retrofit/retrofit.dart';

part 'pharmacy_client.g.dart';

@RestApi(baseUrl: 'https://api-qa-demo.nimbleandsimple.com')
abstract class PharmacyClient {
  factory PharmacyClient(Dio dio, {String? baseUrl}) = _PharmacyClient;

  /// Pharmacy endpoints may not work on web due to CORS restrictions
  factory PharmacyClient.construct() {
    return PharmacyClient(Dio());
  }

  @GET('/pharmacies/info/{pharmacyId}')
  Future<PharmacyDetailsResponse> getPharmacyDetailsResponse(
    @Path('pharmacyId') String pharmacyId,
  );
}

extension PharmacyHubClientUtils on PharmacyClient {
  /// Fetches pharmacy data from local json file
  Future<PharmaciesResponse> getPharmaciesResponse() async {
    final response = await rootBundle
        .loadString("assets/mock_data/pharmacies_response.json");
    return PharmaciesResponse.fromJson(json.decode(response));
  }
}
