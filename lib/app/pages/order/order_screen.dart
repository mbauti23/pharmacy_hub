import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimble_code_exercise/app/bloc/medications/medications_bloc.dart';
import 'package:nimble_code_exercise/app/bloc/order/orders_bloc.dart';
import 'package:nimble_code_exercise/app/pages/order/widgets/order_confirmation_bar.dart';
import 'package:nimble_code_exercise/app/pages/order/widgets/order_selection_list.dart';
import 'package:nimble_code_exercise/app/shared/widgets/ph_bottom_border.dart';
import 'package:nimble_code_exercise/app/utils/context_extension.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({
    required this.pharmacyId,
    super.key,
  });
  final String? pharmacyId;
  @override
  Widget build(BuildContext context) {
    return BlocListener<OrdersBloc, OrdersState>(
      // Display loading indicator as 'server' processes the order
      listenWhen: (previous, current) => current is AddOrdersState,
      listener: (context, state) {
        if (state is AddingToOrdersState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (dialogContext) {
              return Container(
                color: Colors.black12,
                child: const Center(child: CircularProgressIndicator()),
              );
            },
          );
        }
        if (state is FailedAddToOrdersState ||
            state is SuccessfulAddToOrdersState) {
          Navigator.of(context).pop();
          context.popScreen();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Order'), bottom: PHBottomBorder()),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<MedicationsBloc, MedicationsState>(
                  builder: (context, state) {
                    if (state is LoadedMedicationsState) {
                      return OrderSelectionList(
                        medications: state.medications,
                        pharmacyId: pharmacyId,
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              OrderConfirmationBar(pharmacyId: pharmacyId),
            ],
          ),
        ),
      ),
    );
  }
}
