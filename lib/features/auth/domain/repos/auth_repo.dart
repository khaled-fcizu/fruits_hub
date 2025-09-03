import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entitiy.dart';

abstract class AuthRepo {
  Future<Either<UserEntitiy,Failure> > createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
}