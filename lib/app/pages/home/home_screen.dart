import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimble_code_exercise/app/bloc/pharmacies/pharmacies_bloc.dart';
import 'package:nimble_code_exercise/app/pages/home/widgets/ph_app_bar.dart';
import 'package:nimble_code_exercise/app/pages/home/widgets/pharmacy_list_tile.dart';
import 'package:nimble_code_exercise/app/shared/widgets/ph_header_text.dart';
import 'package:nimble_code_exercise/app/shared/widgets/ph_list_tile.dart';
import 'package:nimble_code_exercise/service/dtos/pharmacy.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PHAppBar(),
      body: BlocBuilder<PharmaciesBloc, PharmaciesState>(
        builder: (context, state) {
          // Error State
          if (state is ErrorPharmaciesState) {
            return const Center(
              child: Text('An error has occured.'),
            );
          }
          // Loaded State
          if (state is LoadedPharmaciesState) {
            return CustomScrollView(
              slivers: [
                _pharmacies(state.pharmacies),
                _quickActions(),
              ],
            );
          }
          // Loading State
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  // Pharmacies section
  Widget _pharmacies(List<Pharmacy> pharmacies) {
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
              (pharmacy) => PharmacyListTile(pharmacy: pharmacy),
            )
            .toList(),
      ],
    );
  }

  // Quick Actions section
  Widget _quickActions() {
    return SliverList.list(
      children: [
        const PhHeaderText('Quick actions'),
        PHListTile(title: 'Order now', onTap: () {}),
      ],
    );
  }
}
