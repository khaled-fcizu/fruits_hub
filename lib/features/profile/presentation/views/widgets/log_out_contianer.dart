import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/extentions.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';

class LogOutContainer extends StatelessWidget {
  const LogOutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Center(
              child: Container(
                width: double.infinity,
                height: 171.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, right: 16),
                        child: GestureDetector(
                          onTap: () => context.pop(),
                          child: Icon(Icons.close, size: 20.sp),
                        ),
                      ),
                    ),
                    verticalSpace(10),
                    Text(
                      'هل ترغب في تسجيل الخروج ؟',
                      style: AppTextStyles.font16BlackBold,
                    ),
                    verticalSpace(34),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LogOutButton(
                          onPressed: () {
                            context.pushReplacementNamed(Routes.loginView);
                          },
                          text: 'تأكيد',
                          textColor: Colors.white,
                          buttonColor: AppColors.mainGreen,
                        ),
                        horizontalSpace(8),
                        LogOutButton(
                          onPressed: () => context.pop(),
                          text: 'لا ارغب',
                          textColor: AppColors.mainGreen,
                          buttonColor: Colors.white,
                          borderSide: BorderSide(
                            color: AppColors.mainGreen,
                            width: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 11.5.h),
        decoration: BoxDecoration(color: Color(0xffEBF9F1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Text('تسجيل الخروج', style: AppTextStyles.font13MainGreenSimiBold),
            Spacer(flex: 1),
            SvgPicture.asset(Assets.assetsSvgsLogOut),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.buttonColor,
    this.borderSide,
    required this.onPressed,
  });
  final String text;
  final Color textColor;
  final Color buttonColor;
  final BorderSide? borderSide;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: borderSide ?? BorderSide(color: Colors.transparent, width: 0),
        ),
        backgroundColor: buttonColor,
      ),

      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 40.w),
        child: Text(
          text,
          style: AppTextStyles.font16BlackBold.copyWith(color: textColor),
        ),
      ),
    );
  }
}



// AlertDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(4.r),
//             ),
//             title: Align(
//               alignment: Alignment.topRight,
//               child: GestureDetector(
//                 onTap: () => context.pop(),
//                 child: Icon(Icons.close, size: 20.sp),
//               ),
//             ),
//             content: SizedBox(
//               height: 100.h,
//               width: double.infinity,
//               child: SingleChildScrollView(
//                 child: ListBody(
//                   children: <Widget>[
//                     Text(
//                       'هل ترغب في تسجيل الخروج ؟',
//                       style: AppTextStyles.font16BlackBold,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             actions: <Widget>[
//               Row(
//                 children: [
//                   LogOutButton(
//                     text: 'تأكيد',
//                     textColor: Colors.white,
//                     buttonColor: AppColors.mainGreen,
//                   ),
//                   horizontalSpace(8),
//                   LogOutButton(
//                     text: 'لا ارغب',
//                     textColor: AppColors.mainGreen,
//                     buttonColor: Colors.white,
//                     borderSide: BorderSide(
//                       color: AppColors.mainGreen,
//                       width: 1.5,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),