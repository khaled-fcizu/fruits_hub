import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/repos/order_repo/order_repo.dart';
import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this._orderRepo) : super(AddOrderInitial());
  final OrderRepo _orderRepo;
  Future<void> emitOrderStates({required OrderEntity orderEntity}) async {
    emit(AddOrderLoading());
    final result = await _orderRepo.addOrder(orderEntity: orderEntity);
    result.fold(
      (l) => emit(AddOrderFailure(errorMessage: l.message)),
      (r) => emit(AddOrderSuccess()),
    );
  }
}
