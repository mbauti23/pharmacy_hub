import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimble_code_exercise/service/dtos/orders/order.dart';
import 'package:nimble_code_exercise/service/repositories/hive_repository.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(InitialOrdersState()) {
    on<FetchOrdersEvent>(_fetchOrders);
    on<AddToOrdersEvent>(_addToOrders);
  }

  HiveRepository hiveRepo = HiveRepository('orders_box');

  Future<void> _fetchOrders(
    FetchOrdersEvent event,
    Emitter<OrdersState> emit,
  ) async {
    try {
      emit(LoadingOrdersState());
      final ordersList = await hiveRepo.getAll();
      // Uncomment out to clear local database. Run once with and once again without
      // await hiveRepo.clear();
      final orders = List<Order>.from(
        ordersList.map((orderMap) => Order.fromJson(Map.from(orderMap))),
      );
      emit(LoadedOrdersState(orders));
    } catch (e) {
      emit(ErrorOrdersState());
    }
  }

  Future<void> _addToOrders(
    AddToOrdersEvent event,
    Emitter<OrdersState> emit,
  ) async {
    try {
      emit(AddingToOrdersState());
      await hiveRepo.put(event.order.id, event.order.toJson());
      // Simulate server communication delay
      await Future.delayed(const Duration(milliseconds: 500));
      emit(SuccessfulAddToOrdersState());
    } catch (e) {
      emit(FailedAddToOrdersState());
    }
    add(FetchOrdersEvent());
  }
}
