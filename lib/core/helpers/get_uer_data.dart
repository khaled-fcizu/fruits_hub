import 'dart:convert';

import 'package:fruit_hub/core/service/shared_prefrance_sigleton.dart';
import 'package:fruit_hub/core/utils/prfs_constants.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entitiy.dart';

Future<UserEntitiy> getUserData()async {
 var jsonData = jsonDecode(SharedPrefranceSigleton.getString(key: PrefsConstants.saveUserData));
 var userEntity = UserModel.fromJson(jsonData);
 return userEntity;
}