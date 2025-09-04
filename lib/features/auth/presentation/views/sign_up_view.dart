import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/auth/presentation/managers/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/already_have_account.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/condations_and_terms_chick.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/sign%20up/sign_up_bloc_listener.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/sign%20up/signup_form.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isChicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'حساب جديد',
        icon: Icon(Icons.arrow_back_ios),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
          child: SafeArea(
            child: Column(
              children: [
                verticalSpace(24),
                SignupForm(),
                verticalSpace(16),
                CondationsAndTermsChick(
                  onChicked: (value) {
                    isChicked = value;
                  },
                ),
                verticalSpace(30),
                AppButton(
                  onPressed: () {
                    if (!isChicked) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'الرجاء الموافقة على الشروط والاحكام للمتابعة',
                          ),
                        ),
                      );
                      return;
                    }
                    if (context
                            .read<SignupCubit>()
                            .signUpKey
                            .currentState!
                            .validate() &&
                        isChicked) {
                      context.read<SignupCubit>().emitSignUpState();
                    }
                  },
                  buttonText: 'إنشاء حساب جديد',
                ),
                verticalSpace(26),
                AlreadyHaveAccount(),
                SignUpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
