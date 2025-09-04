import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/extentions.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/features/auth/presentation/managers/login_cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) {
        return current is LoginFailure ||
            current is LoginLoading ||
            current is LoginSuccess;
      },
      listener: (context, state) {
        if (state is LoginLoading) {
          setUpSignUpLoadingState(context);
        } else if (state is LoginSuccess) {
          context.pop();
          context.pushNamed(Routes.homeView);
        } else if (state is LoginFailure) {
          context.pop();
          setUpErrorState(context, state.errorMessage);
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void setUpSignUpLoadingState(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(color: AppColors.mainLightGreen),
        );
      },
    );
  }

  void setUpErrorState(context, errMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(Icons.error, color: Colors.red, size: 32),
          content: Text(errMessage, style: AppTextStyles.font16BlackSimiBold),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text(
                'فهمت',
                style: AppTextStyles.font13LightGreenBold.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
