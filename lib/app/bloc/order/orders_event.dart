part of 'orders_bloc.dart';

sealed class OrdersEvent {
  const OrdersEvent();
}

class FetchOrdersEvent extends OrdersEvent {}

class AddToOrdersEvent extends OrdersEvent {
  const AddToOrdersEvent(this.order);
  final Order order;
}
