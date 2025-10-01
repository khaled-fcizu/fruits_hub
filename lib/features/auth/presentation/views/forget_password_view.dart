import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/core/widgets/app_text_form_field.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/auth/presentation/managers/forget_password_cubit/forget_password_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/forget_password_bloc_listener.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: buildAppBar(
          context,
          title: 'نسيان كلمة المرور',
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 22.sp),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Form(
              key: context.read<ForgetPasswordCubit>().formKey,
              child: Column(
                children: [
                  verticalSpace(16),
                  Text(
                    'لا تقلق ، ما عليك سوى كتابة الايميل وسنرسل لك جيميل بتغيير كلمة المرور',
                    style: AppTextStyles.font16GraySimiBold,
                  ),
                  verticalSpace(31),
                  AppTextFormField(
                    hintText: 'الايميل',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال البريد الإلكتروني';
                      }
                    },
                    controller: context
                        .read<ForgetPasswordCubit>()
                        .emailController,
                  ),
                  verticalSpace(30),
                  SizedBox(
                    height: 54.h,
                    child: Expanded(
                      child: AppButton(
                        onPressed: () {
                          if (context
                              .read<ForgetPasswordCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            context
                                .read<ForgetPasswordCubit>()
                                .forgetPassword();
                          }
                        },
                        buttonText: 'نسيت كلمة المرور',
                      ),
                    ),
                  ),
                  ForgetPasswordBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
