import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/extentions.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/features/auth/presentation/managers/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/managers/signup_cubit/signup_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) {
        return current is SignupFailure ||
            current is SignupLoading ||
            current is SignupSuccess;
      },
      listener: (context, state) {
        if (state is SignupLoading) {
          setUpSignUpLoadingState(context);
        } else if (state is SignupSuccess) {
          context.pop();
          setUpSuccessState(context);
        } else if (state is SignupFailure) {
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

  void setUpSuccessState(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Signup Successful'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'تهانينا! تم انشاء حسابك بنجاح',
                  style: AppTextStyles.font16BlackSimiBold,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                disabledForegroundColor: Colors.grey[380],
              ),
              onPressed: () {
                context.pushNamed(Routes.loginView);
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
              child: Text('فهمت', style: AppTextStyles.font13LightGreenBold.copyWith(
                fontWeight: FontWeight.bold
              )),
            ),
          ],
        );
      },
    );
  }
}
