import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/repos/order_repo/order_repo.dart';
import 'package:fruit_hub/core/service/database_service.dart';
import 'package:fruit_hub/features/check_out/data/models/order_model.dart';
import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseService _databaseService;

  OrderRepoImpl(this._databaseService);
  @override
  Future<Either<Failure, void>> addOrder({
    required OrderEntity orderEntity,
  }) async {
    try {
      await _databaseService.saveData(
        path: 'orders',
        data: OrderModel.fromEntity(orderEntity).toJson(),
      );
      return right(null);
    } on Exception catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
