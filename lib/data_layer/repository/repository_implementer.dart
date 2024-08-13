import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tut_app/data_layer/mapper/mapper.dart';
import 'package:tut_app/data_layer/network/api_service_client.dart';
import 'package:tut_app/data_layer/network/failure.dart';
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
      final response = await _apiServiceClient.login(loginRequest.email, loginRequest.password);
      if(response.status == 0){
          // succeeded
        return Right(response.toDomain());
      }else{
        return Left(Failure(404,"business error"));
      }
    }else{
      return Left(Failure(-1,"check your connection"));
    }
  }

}