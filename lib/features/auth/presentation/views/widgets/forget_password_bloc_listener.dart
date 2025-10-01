import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/extentions.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/features/auth/presentation/managers/forget_password_cubit/forget_password_cubit.dart';

class ForgetPasswordBlocListener extends StatelessWidget {
  const ForgetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoading) {
          setUpSignUpLoadingState(context);
        } else if (state is ForgetPasswordSuccess) {
          context.pop();
          setUpSuccessState(context);
        } else if (state is ForgetPasswordFailure) {
          context.pop();
          setUpErrorState(context, state.message);
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

  void setUpSuccessState(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Successful'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'سيتم ارسال رابط استعادة كلمة المرور الى بريدك الالكتروني تابعه!',
                  style: AppTextStyles.font16BlackSimiBold,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppColors.mainGreen,
                disabledForegroundColor: Colors.grey[380],
              ),
              onPressed: () {
                context.pushReplacementNamed(Routes.loginView);
              },
              child: const Text('استمرار'),
            ),
          ],
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
