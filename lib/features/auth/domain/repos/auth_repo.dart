import 'package:dartz/dartz.dart';
import 'package:selaty/features/auth/data/models/login_model/login_request.dart';
import 'package:selaty/features/auth/data/models/login_model/login_response.dart';
import 'package:selaty/features/auth/data/models/register_model/register_request.dart';
import 'package:selaty/features/auth/data/models/register_model/register_response.dart';
import 'package:selaty/features/auth/domain/entities/user_profile_entity.dart';

abstract class AuthRepo {
  Future<Either<String, RegisterData>> register(
      RegisterRequest registerReqParm);
  Future<Either<String, LoginData>> login(LoginRequest loginReqParm);
  Future<bool> isLoggedIn();
  Future<UserProfileEntity> getUserProfile();
}
