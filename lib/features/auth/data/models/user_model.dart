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
  factory UserModel.fromJson(json) {
    return UserModel(
      email: json['email'],
      uid: json['uid'],
      name: json['name'],
    );
  }
  toJson() {
    return {'email': email, 'uid': uid, 'name': name};
  }

  factory UserModel.fromEntity(UserEntitiy userEntitiy) {
    return UserModel(
      email: userEntitiy.email,
      uid: userEntitiy.uid,
      name: userEntitiy.name,
    );
  }
}
