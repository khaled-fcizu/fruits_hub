import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/service/firebase_auth_service.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entitiy.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService _firebaseAuthService;

  AuthRepoImpl(this._firebaseAuthService);
  @override
  Future<Either<UserEntitiy, Failure>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var user = await _firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Left(UserModel.fromFirebaseAuth(user));
    } on CustomExeption catch (e) {
      return Right(Failure(e.message));
    } catch (e) {
      return Right(Failure('Something went wrong, please try again later'));
    }
  }

  @override
  Future<Either<UserEntitiy, Failure>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await _firebaseAuthService.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Left(UserModel.fromFirebaseAuth(user));
    } on CustomExeption catch (e) {
      return Right(Failure(e.message));
    } catch (e) {
      throw Right(Failure('حدث خطأ ما يرجى المحاولة مرة أخرى لاحقًا'));
    }
  }
}
