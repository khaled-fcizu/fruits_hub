import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/widgets/app_text_form_field.dart';
import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';
import 'package:provider/provider.dart';

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
                onChanged: (value) {
                  context.read<OrderEntity>().shippingAdressEntity!.name =
                      value;
                },
                hintText: 'الاسم كامل',
                validator: (value) => validator(value),
              ),
              verticalSpace(8),
              AppTextFormField(
                onChanged: (value) {
                  context.read<OrderEntity>().shippingAdressEntity!.email =
                      value;
                },
                hintText: 'البريد الإلكتروني',
                validator: (value) => validator(value),
              ),
              verticalSpace(8),
              AppTextFormField(
                onChanged: (value) {
                  context
                          .read<OrderEntity>()
                          .shippingAdressEntity!
                          .phoneNumber =
                      value;
                },
                hintText: 'رقم الهاتف',
                validator: (value) => validator(value),
              ),
              verticalSpace(8),
              AppTextFormField(
                onChanged: (value) {
                  context.read<OrderEntity>().shippingAdressEntity!.adress =
                      value;
                },
                hintText: 'العنوان',
                validator: (value) => validator(value),
              ),
              verticalSpace(8),
              AppTextFormField(
                onChanged: (value) {
                  context.read<OrderEntity>().shippingAdressEntity!.city =
                      value;
                },
                hintText: 'المدينه',
                validator: (value) => validator(value),
              ),
              verticalSpace(8),
              AppTextFormField(
                onChanged: (value) {
                  context.read<OrderEntity>().shippingAdressEntity!.floor =
                      value;
                },
                hintText: 'رقم الطابق , رقم الشقه ..',
                validator: (value) => validator(value),
              ),
            ],
          ),
        ),
      ),
    );
  }

  validator(value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال هذا الحقل للمتابعة';
    }
    return null;
  }
}
