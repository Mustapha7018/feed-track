import 'package:dartz/dartz.dart';
import '../entities/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Exception, AuthEntity>> getAuth();
}