import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/features/onBoarding/ui/widgets/onboarding_page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        OnBoardingPageViewItem(
          isVisible: true,
          backgroungImage: 'assets/svgs/onboarding_bacground_item1.svg',
          image: 'assets/svgs/onboarding_fruit_item1.svg',
          subTitile:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'مرحبًا بك في ',
                  style: AppTextStyles.font23BlackBold,
                ),
                TextSpan(
                  text: 'Fruit',
                  style: AppTextStyles.font23MainGreenBold,
                ),
                TextSpan(
                  text: 'HUB',
                  style: AppTextStyles.font23LightOrangeBold,
                ),
              ],
            ),
          ),
        ),
        OnBoardingPageViewItem(
          isVisible: false,

          backgroungImage: 'assets/svgs/onboarding_bacground_item2.svg',
          image: 'assets/svgs/onboarding_fruit_item2.svg',
          subTitile:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          title: Text('ابحث وتسوق', style: AppTextStyles.font23BlackBold),
        ),
      ],
    );
  }
}
