import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/service/database_service.dart';
import 'package:fruit_hub/core/service/firebase_auth_service.dart';
import 'package:fruit_hub/core/utils/service_constants.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entitiy.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService _firebaseAuthService;
  final DatabaseService _databaseService;

  AuthRepoImpl(this._firebaseAuthService, this._databaseService);
  @override
  Future<Either<UserEntitiy, Failure>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await _firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserModel.fromFirebaseAuth(user);
      await addUserData(userEntity: userEntity);
      return Left(userEntity);
    } on CustomExeption catch (e) {
      if (user != null) {
        await _firebaseAuthService.deleteUser();
      }
      return Right(Failure(e.message));
    } catch (e) {
      if (user != null) {
        await _firebaseAuthService.deleteUser();
      }
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

  @override
  Future<Either<UserEntitiy, Failure>> signInWithGoogle() async {
    try {
      var user = await _firebaseAuthService.signInWithGoogle();
      return Left(UserModel.fromFirebaseAuth(user));
    } on CustomExeption catch (e) {
      return Right(Failure(e.message));
    } catch (e) {
      log('AuthRepo.signInWithGoogle ${e.toString()}');

      return Right(Failure('حدث خطأ ما يرجى المحاولة مرة أخرى لاحقًا'));
    }
  }

  @override
  Future<Either<UserEntitiy, Failure>> signInWithFacebook() async {
    try {
      var user = _firebaseAuthService.signInWithFacebook();
      return Left(UserModel.fromFirebaseAuth(await user));
    } catch (e) {
      log('AuthRepo.signInWithFacebook ${e.toString()}');

      return Right(Failure('حدث خطأ ما يرجى المحاولة مرة أخرى لاحقًا'));
    }
  }

  @override
  Future<void> addUserData({required UserEntitiy userEntity}) async {
    await _databaseService.saveUserData(
      path: ServiceConstants.usersCollection,
      userData: userEntity.toJson(),
    );
  }
}
