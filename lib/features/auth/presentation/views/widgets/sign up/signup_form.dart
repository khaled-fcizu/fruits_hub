import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/app_regix.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/widgets/app_text_form_field.dart';
import 'package:fruit_hub/features/auth/presentation/managers/signup_cubit/signup_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().signUpKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignupCubit>().nameController,
            hintText: 'الاسم كامل',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال الاسم';
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<SignupCubit>().emailController,
            hintText: 'البريد الإلكتروني',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال البريد الإلكتروني';
              } else if (!AppRegex.isEmailValid(value)) {
                return 'الرجاء إدخال بريد إلكتروني صالح';
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<SignupCubit>().passwordController,
            hintText: 'كلمة المرور',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال كلمة المرور';
              } else if (!AppRegex.hasMinLength(value)) {
                return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
              }
            },
            obscureText: isObscure,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              child: isObscure
                  ? Icon(Icons.visibility_off, color: AppColors.lightGray)
                  : Icon(Icons.remove_red_eye, color: AppColors.mainLightGreen),
            ),
          ),
        ],
      ),
    );
  }
}
