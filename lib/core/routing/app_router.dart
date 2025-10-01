import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/di/dependancy_injection.dart';
import 'package:fruit_hub/core/repos/order_repo/order_repo_impl.dart';
import 'package:fruit_hub/core/repos/product_repo/product_repo_impl.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_hub/features/auth/presentation/managers/forget_password_cubit/forget_password_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/managers/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/managers/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/forget_password_view.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/features/best_seller_fruits/presentation/views/best_seller_view.dart';
import 'package:fruit_hub/features/check_out/presentation/views/chech_out_view.dart';
import 'package:fruit_hub/features/check_out/presentation/views/managers/cubit/add_order_cubit.dart';
import 'package:fruit_hub/features/main/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/main/presentation/managers/products_cubit/products_cubit.dart';
import 'package:fruit_hub/features/main/presentation/views/main_view.dart';
import 'package:fruit_hub/features/main/presentation/views/product_details_view.dart';
import 'package:fruit_hub/features/onBoarding/ui/onboarding_view.dart';
import 'package:fruit_hub/features/auth/presentation/views/sign_up_view.dart';
import 'package:fruit_hub/features/spalsh/ui/splash_view.dart';

abstract class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.onBoardingView:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.mainView:
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.productDetailsView:
        return MaterialPageRoute(builder: (_) => ProductDetailsView());
      case Routes.forgetPasswordView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ForgetPasswordCubit(getIt<AuthRepoImpl>()),
            child: ForgetPasswordView(),
          ),
        );
      case Routes.checkOutView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AddOrderCubit(getIt<OrderRepoImpl>()),
            child: CheckOutView(cartEntity: settings.arguments as CartEntity),
          ),
        );
      case Routes.bestSellerView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ProductsCubit(getIt<ProductRepoImpl>())
                  ..getBestSellerProducts(),
            child: BestSellerView(),
          ),
        );
      case Routes.loginView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginView(),
          ),
        );
      case Routes.signUpView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: SignUpView(),
          ),
        );
      default:
        return null;
    }
  }
}
