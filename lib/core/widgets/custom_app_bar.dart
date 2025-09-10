import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';

AppBar buildAppBar(context, {required String title, required Widget icon}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(title, style: AppTextStyles.font19BlackBold),
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: icon,
    ),
  );
}
