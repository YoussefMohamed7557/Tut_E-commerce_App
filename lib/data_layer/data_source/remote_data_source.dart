import 'package:tut_app/data_layer/network/api_service_client.dart';
import 'package:tut_app/data_layer/network/requests.dart';
import 'package:tut_app/data_layer/response/responses.dart';

abstract class RemoteDataSource{
  Future<AuthenticationResponse> login (LoginRequests loginRequests);
}
class RemoteDataSourceImplementer implements RemoteDataSource{
  final ApiServiceClient _apiServiceClient;
  RemoteDataSourceImplementer(this._apiServiceClient);
  @override
  Future<AuthenticationResponse> login(LoginRequests loginRequests) async{
    return await _apiServiceClient.login(loginRequests.email, loginRequests.password);
  }

}