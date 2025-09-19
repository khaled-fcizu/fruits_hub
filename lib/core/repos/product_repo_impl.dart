import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/models/product_model.dart';
import 'package:fruit_hub/core/repos/product_repo.dart';
import 'package:fruit_hub/core/service/database_service.dart';
import 'package:fruit_hub/core/utils/service_constants.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService _databaseServic;
  ProductRepoImpl(this._databaseServic);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellerProducts() async {
    try {
      var data =
          await _databaseServic.getData(
                path: ServiceConstants.productCollection,
                query: {
                  'limit': 10,
                  'orederBy': 'sellingCount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(Failure('fail to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await _databaseServic.getData(
                path: ServiceConstants.productCollection,
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(Failure('fail to get products'));
    }
  }
}
