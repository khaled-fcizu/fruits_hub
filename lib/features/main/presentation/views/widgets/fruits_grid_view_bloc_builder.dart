import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/fruits_list_helper.dart';
import 'package:fruit_hub/features/main/presentation/managers/products_cubit/products_cubit.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/fruits_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FruitsGridViewBlocBuilder extends StatelessWidget {
  const FruitsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (p, c) =>
          c is ProductsLoading || c is ProductsSuccess || c is ProductsFailure,
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return FruitsGridView(products: state.products);
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: FruitsGridView(products: getProductsList()),
          );
        }
      },
    );
  }
}
