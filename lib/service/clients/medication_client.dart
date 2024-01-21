import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'medication_client.g.dart';

@RestApi(baseUrl: 'https://s3-us-west-2.amazonaws.com/assets.nimblerx.com/prod')
abstract class MedicationClient {
  factory MedicationClient(Dio dio, {String? baseUrl}) = _MedicationClient;

  factory MedicationClient.construct() {
    final dio = Dio();
    dio.options.headers['Access-Control-Allow-Origin'] = '*';
    dio.options.headers['Access-Control-Allow-Methods'] =
        'GET, POST, OPTIONS, PUT, PATCH, DELETE';
    dio.options.headers['Access-Control-Allow-Headers'] =
        'Origin, X-Requested-With, Content-Type, Accept';
    dio.options.headers['Access-Control-Allow-Credentials'] = true;
    dio.options.contentType = 'application/json';
    return MedicationClient(dio);
  }

  @GET('/medicationListFromNIH/medicationListFromNIH.txt')
  Future<dynamic> getMedicationList();
}
