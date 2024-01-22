import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimble_code_exercise/app/bloc/order/orders_bloc.dart';
import 'package:nimble_code_exercise/app/shared/widgets/ph_header_text.dart';
import 'package:nimble_code_exercise/app/shared/widgets/ph_list_tile.dart';

class PreviousOrders extends StatelessWidget {
  const PreviousOrders({required this.pharmacyId, super.key});
  final String? pharmacyId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
        if (state is LoadedOrdersState) {
          final order = state.getOrderFromPharmacyId(pharmacyId);
          if (order != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PhHeaderText('Previously Ordered', hasPadding: false),
                ...order.medications
                    .map(
                      (e) => PHListTile(
                        title: e,
                        hasSeparator: false,
                        padding: const EdgeInsets.only(top: 8),
                      ),
                    )
                    .toList(),
              ],
            );
          }
        }
        return const SizedBox();
      },
    );
  }
}
