import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/di/dependancy_injection.dart';
import 'package:fruit_hub/core/repos/product_repo_impl.dart';
import 'package:fruit_hub/features/main/presentation/managers/products_cubit/products_cubit.dart';
import 'package:fruit_hub/features/main/presentation/views/cart_view.dart';
import 'package:fruit_hub/features/main/presentation/views/home_view.dart';
import 'package:fruit_hub/features/main/presentation/views/products_view.dart';
import 'package:fruit_hub/features/main/presentation/views/profile_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
              index: currentIndex,
              children: [
                BlocProvider(
                  create: (context) =>
                      ProductsCubit(getIt<ProductRepoImpl>())
                        ..getBestSellerProducts(),
                  child: HomeView(),
                ),
                BlocProvider(
                  create: (context) =>
                      ProductsCubit(getIt<ProductRepoImpl>())
                        ..getBestSellerProducts(),
                  child: ProductsView(),
                ),
                CartView(),
                ProfileView(),
              ],
            );
  }
}