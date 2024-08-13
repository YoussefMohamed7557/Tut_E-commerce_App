import 'package:dartz/dartz.dart';
import 'package:tut_app/domain_layer/data_classes/data_classes.dart';
import 'package:tut_app/data_layer/network/failure.dart';
import 'package:tut_app/data_layer/network/requests.dart';

abstract class Repository{
  Future<Either<Failure,Authentication>> login (LoginRequests loginRequest);
}