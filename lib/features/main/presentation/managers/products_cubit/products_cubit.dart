import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/repos/product_repo/product_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepo _productsRepo;
  ProductsCubit(this._productsRepo) : super(ProductsLoading());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await _productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(message: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }

  Future<void> getBestSellerProducts() async {
    emit(ProductsLoading());
    final result = await _productsRepo.getBestSellerProducts();
    result.fold(
      (failure) => emit(ProductsFailure(message: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }
}
