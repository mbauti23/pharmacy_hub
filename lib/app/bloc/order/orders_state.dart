part of 'orders_bloc.dart';

sealed class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object?> get props => [];
}

// Fetch orders states

final class InitialOrdersState extends OrdersState {}

final class LoadingOrdersState extends OrdersState {}

final class LoadedOrdersState extends OrdersState {
  const LoadedOrdersState(this.orders);
  final List<Order> orders;

  Order? getOrderFromPharmacyId(String? pharmacyId) {
    return orders.where((e) => e.id == pharmacyId).firstOrNull;
  }

  @override
  List<Object?> get props => [orders];
}

final class ErrorOrdersState extends OrdersState {}

// Add to orders states

abstract class AddOrdersState extends OrdersState {}

final class AddingToOrdersState extends AddOrdersState {}

final class SuccessfulAddToOrdersState extends AddOrdersState {}

final class FailedAddToOrdersState extends AddOrdersState {}
