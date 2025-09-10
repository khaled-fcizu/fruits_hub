import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser?.delete();
  }

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
      } else if (e.code == 'network-request-failed') {
        throw CustomExeption('شبكة الانترنت ضعيفة او غير متصلة');
      } else {
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
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException.signInWithEmailAndPassword: ${e.code}');
      if (e.code == 'user-not-found') {
        throw CustomExeption('المستخدم غير موجود');
      } else if (e.code == 'wrong-password') {
        throw CustomExeption('كلمة المرور غير صحيحة');
      } else if (e.code == 'invalid-email') {
        throw CustomExeption('الايميل غير صالح');
      } else if (e.code == 'network-request-failed') {
        throw CustomExeption('شبكة الانترنت ضعيفة او غير متصلة');
      } else {
        throw CustomExeption('حدث خطأ غير معروف.');
      }
    } catch (e) {
      log('FirebaseAuthException.signInWithEmailAndPassword: ${e.toString()}');
      throw CustomExeption('حدث خطأ غير معروف.');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignIn signIn = GoogleSignIn.instance;
    unawaited(
      signIn.initialize(
        serverClientId:
            '1058596184283-5ngrfjfe4728bggj7lplgsb7qjaio4n0.apps.googleusercontent.com',
      ),
    );

    final GoogleSignInAccount? googleUser = await signIn.authenticate();

    final GoogleSignInAuthentication googleAuth = googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    var user = (await FirebaseAuth.instance.signInWithCredential(
      credential,
    )).user!;
    return user;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  bool isLoggedIn(){
    return FirebaseAuth.instance.currentUser != null;
  }
}
