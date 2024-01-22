import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimble_code_exercise/app/bloc/order/orders_bloc.dart';
import 'package:nimble_code_exercise/app/bloc/pharmacies/pharmacies_bloc.dart';
import 'package:nimble_code_exercise/app/pages/home/widgets/ph_app_bar.dart';
import 'package:nimble_code_exercise/app/pages/home/widgets/pharmacy_list_tile.dart';
import 'package:nimble_code_exercise/app/router/ph_paths.dart';
import 'package:nimble_code_exercise/app/shared/widgets/ph_header_text.dart';
import 'package:nimble_code_exercise/app/shared/widgets/ph_list_tile.dart';
import 'package:nimble_code_exercise/app/utils/context_extension.dart';
import 'package:nimble_code_exercise/service/dtos/orders/order.dart';
import 'package:nimble_code_exercise/service/models/pharmacies_with_location.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PHAppBar(),
      body: BlocBuilder<PharmaciesBloc, PharmaciesState>(
        builder: (context, pharmaciesState) {
          // Error State
          if (pharmaciesState is ErrorPharmaciesState) {
            return const Center(
              child: Text('An error has occured.'),
            );
          }
          // Loaded State
          if (pharmaciesState is LoadedPharmaciesState) {
            return BlocBuilder<OrdersBloc, OrdersState>(
              buildWhen: (previous, current) => current is! AddOrdersState,
              builder: (context, ordersState) {
                if (ordersState is LoadedOrdersState) {
                  final orders = ordersState.orders;
                  return CustomScrollView(
                    slivers: [
                      _pharmacies(pharmaciesState.pharmacies, orders),
                      _quickActions(
                        context,
                        pharmaciesState.pharmacies,
                        orders,
                      ),
                    ],
                  );
                }

                // Loading State
                return const Center(child: CircularProgressIndicator());
              },
            );
          }
          // Loading State
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  // Pharmacies section
  Widget _pharmacies(
    List<PharmacyWithLocation> pharmacies,
    List<Order> orders,
  ) {
    return SliverList.list(
      children: [
        const PhHeaderText('Pharmacies'),
        if (pharmacies.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
              child: Text('There are no pharmacies to display.'),
            ),
          ),
        ...pharmacies
            .map(
              (pharmacy) => PharmacyListTile(
                pharmacy: pharmacy,
                // Checks OrdersBloc for order based on pharmacyId
                hasOrders: orders
                    .where((order) => order.id == pharmacy.pharmacyId)
                    .isNotEmpty,
              ),
            )
            .toList(),
      ],
    );
  }

  // Quick Actions section
  Widget _quickActions(
    BuildContext context,
    List<PharmacyWithLocation> pharmaciesWithLocation,
    List<Order> orders,
  ) {
    final closestPharmacyToOrderFrom =
        _closestPharmacyToOrderFrom(context, pharmaciesWithLocation, orders);
    return SliverList.list(
      children: [
        const PhHeaderText('Quick actions'),
        if (closestPharmacyToOrderFrom != null)
          PHListTile(
            title: 'Order now',
            onTap: () {
              context.pushScreen(
                PharmacyHubPaths.order.replaceParam(
                  'pharmacyId',
                  closestPharmacyToOrderFrom.pharmacyId ?? '',
                ),
              );
            },
          ),
      ],
    );
  }

  // TODO - Unit test to confirm logic
  PharmacyWithLocation? _closestPharmacyToOrderFrom(
    BuildContext context,
    List<PharmacyWithLocation> pharmaciesWithLocation,
    List<Order> orders,
  ) {
    try {
      final position = context.getUserPosition();
      if (position == null) {
        return null;
      }
      PharmacyWithLocation? pharmacy;
      final sortedByLocation = List<PharmacyWithLocation>.from(
        pharmaciesWithLocation,
      )..sort((a, b) {
          return b
              .distanceAwayFrom(position.longitude, position.latitude)
              .compareTo(
                a.distanceAwayFrom(position.longitude, position.latitude),
              );
        });
      for (var pharmacyWithLocation in sortedByLocation) {
        if (orders
            .where((order) => pharmacyWithLocation.pharmacyId == order.id)
            .isEmpty) {
          pharmacy = pharmacyWithLocation;
        }
      }
      return pharmacy;
    } catch (e) {
      return null;
    }
  }
}
