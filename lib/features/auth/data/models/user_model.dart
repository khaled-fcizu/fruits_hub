import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entitiy.dart';

class UserModel extends UserEntitiy {
  UserModel({required super.email, required super.uid, required super.name});
  factory UserModel.fromFirebaseAuth(User user) {
    return UserModel(
      email: user.email!,
      uid: user.uid,
      name: user.displayName ?? '',
    );
  }
}
