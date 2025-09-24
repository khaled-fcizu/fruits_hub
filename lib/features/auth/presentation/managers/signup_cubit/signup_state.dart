import 'package:fruit_hub/features/auth/domain/entities/user_entitiy.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final UserEntitiy userEntitiy;
  SignupSuccess({required this.userEntitiy});
}

class SignupFailure extends SignupState {
  final String errorMessage;
  SignupFailure({required this.errorMessage});
}
