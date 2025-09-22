import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/widgets/app_text_form_field.dart';

class AdressSection extends StatelessWidget {
  const AdressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(24),
        AppTextFormField(hintText: 'الاسم كامل', validator: (value) {}),
        verticalSpace(8),
        AppTextFormField(hintText: 'البريد الإلكتروني', validator: (value) {}),
        verticalSpace(8),
        AppTextFormField(hintText: 'رقم الهاتف', validator: (value) {}),
        verticalSpace(8),
        AppTextFormField(hintText: 'العنوان', validator: (value) {}),
        verticalSpace(8),
        AppTextFormField(hintText: 'المدينه', validator: (value) {}),
        verticalSpace(8),
        AppTextFormField(
          hintText: 'رقم الطابق , رقم الشقه ..',
          validator: (value) {},
        ),
      ],
    );
  }
}
