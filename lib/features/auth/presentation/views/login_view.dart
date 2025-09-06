import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/auth/presentation/managers/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/dont_have_account_text.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/login/login_bloc_listener.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/login/login_form.dart';

import 'widgets/login_options_item.dart';
import 'widgets/or_divider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'تسجيل دخول',
        icon: Icon(Icons.arrow_back_ios),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                verticalSpace(24),
                LoginForm(),
                verticalSpace(16),
                Text(
                  'نسيت كلمة المرور؟',
                  style: AppTextStyles.font13LightGreenSimiBold,
                ),
                verticalSpace(33),
                AppButton(
                  onPressed: () {
                    if (context
                        .read<LoginCubit>()
                        .loginKey
                        .currentState!
                        .validate()) {
                      context.read<LoginCubit>().emitLoginState();
                    }
                  },
                  buttonText: 'تسجيل دخول',
                ),
                verticalSpace(33),
                Align(
                  alignment: Alignment.center,
                  child: DontHaveAccountText(),
                ),
                verticalSpace(33),
                OrDivider(),
                verticalSpace(16),
                LoginOptionsItem(
                  text: 'تسجيل بواسطة جوجل',
                  onPressed: () {
                    context.read<LoginCubit>().signInWithGoogle();
                  },
                  image: 'assets/svgs/google.svg',
                ),

                verticalSpace(16),
                LoginOptionsItem(
                  text: 'تسجيل بواسطة فيسبوك',
                  onPressed: () {
                    context.read<LoginCubit>().signInWithFacebook();
                  },
                  image: 'assets/svgs/facebook.svg',
                ),
                LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
