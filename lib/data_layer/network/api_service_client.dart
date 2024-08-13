import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:tut_app/application_layer/constants.dart';
import 'package:tut_app/data_layer/response/responses.dart';
part 'api_service_client.g.dart';
@RestApi(baseUrl:Constants.baseUrl)
abstract class ApiServiceClient {
  factory ApiServiceClient(Dio dio, {String baseUrl}) = _ApiServiceClient;
  @POST("/customers/login")
  Future<AuthenticationResponse> login(
        @Field("email") String email,
        @Field("password") String password,
      );
}