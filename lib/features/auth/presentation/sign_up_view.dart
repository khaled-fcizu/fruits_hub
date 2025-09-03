import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/core/widgets/app_text_form_field.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/already_have_account.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/condations_and_terms_chick.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
                AppTextFormField(hintText: 'الاسم كامل', validator: (value) {}),
                verticalSpace(16),
                AppTextFormField(
                  hintText: 'البريد الإلكتروني',
                  validator: (value) {},
                ),
                verticalSpace(16),
                AppTextFormField(
                  hintText: 'كلمة المرور',
                  validator: (value) {},
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: AppColors.lightGray,
                  ),
                ),
                verticalSpace(16),
                CondationsAndTermsChick(),
                verticalSpace(30),
                AppButton(onPressed: () {}, buttonText: 'إنشاء حساب جديد'),
                verticalSpace(26),
                AlreadyHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
