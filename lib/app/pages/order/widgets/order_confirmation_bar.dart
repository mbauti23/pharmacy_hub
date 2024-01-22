import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimble_code_exercise/app/bloc/medications/selections/selections_cubit.dart';
import 'package:nimble_code_exercise/app/bloc/order/orders_bloc.dart';
import 'package:nimble_code_exercise/app/shared/widgets/ph_bottom_border.dart';
import 'package:nimble_code_exercise/app/theme/colors.dart';
import 'package:nimble_code_exercise/service/dtos/orders/order.dart';

class OrderConfirmationBar extends StatelessWidget {
  const OrderConfirmationBar({required this.pharmacyId, super.key});
  final String? pharmacyId;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PHBottomBorder(),
        BlocBuilder<SelectionsCubit, List<String>>(
          builder: (context, state) {
            final selectionsLength = state.length;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$selectionsLength selected',
                    style: const TextStyle(fontSize: 16),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                        (states) {
                          if (states.contains(MaterialState.disabled)) {
                            return PhColors.disabledButton;
                          }
                          return PhColors.mainViolet;
                        },
                      ),
                    ),
                    onPressed: selectionsLength == 0
                        ? null
                        : () {
                            context.read<OrdersBloc>().add(
                                  AddToOrdersEvent(
                                    Order(
                                      id: pharmacyId!,
                                      medications: state,
                                      orderDateUTC:
                                          DateTime.now().toUtc().toString(),
                                    ),
                                  ),
                                );
                          },
                    child: Text(
                      'Place Order',
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            selectionsLength == 0 ? Colors.grey : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
