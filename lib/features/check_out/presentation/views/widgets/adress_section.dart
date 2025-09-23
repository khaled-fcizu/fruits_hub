import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/widgets/app_text_form_field.dart';

class AdressSection extends StatelessWidget {
  const AdressSection({
    super.key,
    required this.formKey,
    required this.valueNotifier,
  });
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> valueNotifier;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AutovalidateMode>(
      valueListenable: valueNotifier,
      builder: (context, value, child) => Form(
        key: formKey,
        autovalidateMode: value,
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(24),
              AppTextFormField(
                hintText: 'الاسم كامل',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال هذا الحقل للمتابعة';
                  }
                  return null;
                },
              ),
              verticalSpace(8),
              AppTextFormField(
                hintText: 'البريد الإلكتروني',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال هذا الحقل للمتابعة';
                  }
                  return null;
                },
              ),
              verticalSpace(8),
              AppTextFormField(
                hintText: 'رقم الهاتف',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال هذا الحقل للمتابعة';
                  }
                  return null;
                },
              ),
              verticalSpace(8),
              AppTextFormField(
                hintText: 'العنوان',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال هذا الحقل للمتابعة';
                  }
                  return null;
                },
              ),
              verticalSpace(8),
              AppTextFormField(
                hintText: 'المدينه',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال هذا الحقل للمتابعة';
                  }
                  return null;
                },
              ),
              verticalSpace(8),
              AppTextFormField(
                hintText: 'رقم الطابق , رقم الشقه ..',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال هذا الحقل للمتابعة';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
