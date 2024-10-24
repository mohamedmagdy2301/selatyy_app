import 'package:dartz/dartz.dart';
import 'package:selaty/features/auth/data/models/register_model/register_request.dart';
import 'package:selaty/features/auth/data/models/register_model/register_response.dart';

abstract class AuthRepo {
  Future<Either<String, RegisterResponse>> register(
      RegisterRequest registerReqParm);
}
