

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._authRepo) : super(ForgetPasswordInitial());
  final AuthRepo _authRepo;
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); 

  void forgetPassword() async {
    emit(ForgetPasswordLoading());
    var user = await _authRepo.changePassword(email: emailController.text.trim());
    user.fold(
      (failure) {
        emit(ForgetPasswordFailure(message : failure.message));
      },
      (_) {
        emit(ForgetPasswordSuccess());
      },
    );
  }
}
