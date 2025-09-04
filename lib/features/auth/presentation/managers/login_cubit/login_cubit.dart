import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entitiy.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepo) : super(LoginInitial());
  final AuthRepo _authRepo;
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> emitLoginState() async {
    emit(LoginLoading());
    var user = await _authRepo.loginWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    user.fold(
      (user) {
        emit(LoginSuccess(user));
      },
      (failure) {
        emit(LoginFailure(failure.message));
      },
    );
  }
}
