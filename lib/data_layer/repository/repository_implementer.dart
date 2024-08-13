import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tut_app/data_layer/mapper/mapper.dart';
import 'package:tut_app/data_layer/network/api_service_client.dart';
import 'package:tut_app/data_layer/network/failure.dart';
import 'package:tut_app/data_layer/network/network_error_handler.dart';
import 'package:tut_app/data_layer/network/requests.dart';
import 'package:tut_app/domain_layer/data_classes/data_classes.dart';
import 'package:tut_app/domain_layer/repository/repository.dart';

class RepositoryImplementer implements Repository{
  final ApiServiceClient _apiServiceClient;
  final InternetConnectionChecker _internetConnectionChecker;
  RepositoryImplementer(
      this._apiServiceClient, this._internetConnectionChecker);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequests loginRequest) async {
    if (await _internetConnectionChecker.hasConnection){
      // user online, safe to make api call
      try{
        final response = await _apiServiceClient.login(loginRequest.email, loginRequest.password);
        if(response.status == ApiInternalStatus.success){
          // succeeded
          return Right(response.toDomain());
        }else{
          return Left(Failure(ApiInternalStatus.fail,response.message ?? ResponsesStatusMessage.defaultError));
        }
      }catch(error){
        return Left(ErrorHandler.handle(error).failureObject);
      }
    }else{
      return Left(ResponseStatus.noInternetConnection.getFailure());
    }
  }

}