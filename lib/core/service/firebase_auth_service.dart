import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException.createUserWithEmailAndPassword: ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomExeption('كلمة المرور ضعيفة جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExeption('الايميل مستخدم من قبل');
      } else if (e.code == 'invalid-email') {
        throw CustomExeption('الايميل غير صالح');
      }else if(e.code == 'network-request-failed'){
        throw CustomExeption('شبكة الانترنت ضعيفة او غير متصلة');
      } 
      else {
        throw CustomExeption('حدث خطأ غير معروف.');
      }
    } catch (e) {
      log(
        'FirebaseAuthException.createUserWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomExeption('حدث خطأ غير معروف.');
    }
  }
  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException.signInWithEmailAndPassword: ${e.code}');
      if (e.code == 'user-not-found') {
        throw CustomExeption('المستخدم غير موجود');
      } else if (e.code == 'wrong-password') {
        throw CustomExeption('كلمة المرور غير صحيحة');
      } else if (e.code == 'invalid-email') {
        throw CustomExeption('الايميل غير صالح');
      }else if(e.code == 'network-request-failed'){
        throw CustomExeption('شبكة الانترنت ضعيفة او غير متصلة');
      } 
      else {
        throw CustomExeption('حدث خطأ غير معروف.');
      }
    } catch (e) {
      log(
        'FirebaseAuthException.signInWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomExeption('حدث خطأ غير معروف.');
    }
  }
}
