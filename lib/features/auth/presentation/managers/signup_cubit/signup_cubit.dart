import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/presentation/managers/signup_cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._authRepo) : super(SignupInitial());
  final AuthRepo _authRepo;
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> emitSignUpState() async {
    emit(SignupLoading());
    var user = await _authRepo.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      name: nameController.text.trim(),
    );
    user.fold((user) {
      emit(SignupSuccess(userEntitiy: user));
    }, (failure) => emit(SignupFailure(errorMessage: failure.message)));
  }
}
