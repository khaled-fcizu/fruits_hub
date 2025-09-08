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
      var userEntity = UserEntitiy(uid: user.uid, name: name, email: email);
      await addUserData(userEntity: userEntity);
      return Left(userEntity);
    } on CustomExeption catch (e) {
      await deleteUser(user);
      return Right(Failure(e.message));
    } catch (e) {
      await deleteUser(user);

      return Right(Failure('Something went wrong, please try again later'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await _firebaseAuthService.deleteUser();
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
      await getUserData(uid: user.uid);
      return Left(UserModel.fromFirebaseAuth(user));
    } on CustomExeption catch (e) {
      return Right(Failure(e.message));
    } catch (e) {
      throw Right(Failure('حدث خطأ ما يرجى المحاولة مرة أخرى لاحقًا'));
    }
  }

  @override
  Future<Either<UserEntitiy, Failure>> signInWithGoogle() async {
    User? user;
    try {
      user = await _firebaseAuthService.signInWithGoogle();
      UserEntitiy userEntity = UserModel.fromFirebaseAuth(user);
      bool userExists = await _databaseService.checkDocumentExists(
        path: ServiceConstants.usersCollection,
        documentId: userEntity.uid,
      );
      if (userExists) {
        await getUserData(uid: userEntity.uid);
      } else {
        await addUserData(userEntity: userEntity);
      }
      return Left(userEntity);
    } on CustomExeption catch (e) {
      await deleteUser(user);
      return Right(Failure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('AuthRepo.signInWithGoogle ${e.toString()}');
      return Right(Failure('حدث خطأ ما يرجى المحاولة مرة أخرى لاحقًا'));
    }
  }

  @override
  Future<Either<UserEntitiy, Failure>> signInWithFacebook() async {
    User? user;
    try {
      user = await _firebaseAuthService.signInWithFacebook();
      UserEntitiy userEntity = UserModel.fromFirebaseAuth(user);
      bool userExists = await _databaseService.checkDocumentExists(
        path: ServiceConstants.usersCollection,
        documentId: userEntity.uid,
      );
      if (userExists) {
        await getUserData(uid: userEntity.uid);
      } else {
        await addUserData(userEntity: userEntity);
      }
      return Left(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('AuthRepo.signInWithFacebook ${e.toString()}');
      return Right(Failure('حدث خطأ ما يرجى المحاولة مرة أخرى لاحقًا'));
    }
  }

  @override
  Future<void> addUserData({required UserEntitiy userEntity}) async {
    await _databaseService.saveData(
      path: ServiceConstants.usersCollection,
      data: userEntity.toJson(),
      documentId: userEntity.uid,
    );
  }

  @override
  Future<UserEntitiy> getUserData({required String uid}) async {
    var userData = await _databaseService.getData(
      path: ServiceConstants.usersCollection,
      documentId: uid,
    );
    return UserEntitiy.fromJson(userData!);
  }
}
