import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'medication_client.g.dart';

@RestApi(baseUrl: 'https://s3-us-west-2.amazonaws.com/assets.nimblerx.com/prod')
abstract class MedicationClient {
  factory MedicationClient(Dio dio, {String? baseUrl}) = _MedicationClient;

  factory MedicationClient.construct() {
    return MedicationClient(Dio());
  }

  @GET('/medicationListFromNIH/medicationListFromNIH.txt')
  Future<dynamic> getMedicationList();
}
