import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimble_code_exercise/app/bloc/pharmacy_details/pharmacy_details_bloc.dart';
import 'package:nimble_code_exercise/app/pages/pharmacy_details/widgets/pharmacy_details_body.dart';
import 'package:nimble_code_exercise/app/pages/pharmacy_details/widgets/pharmacy_details_header.dart';
import 'package:nimble_code_exercise/app/shared/widgets/ph_bottom_border.dart';

class PharmacyDetailsScreen extends StatelessWidget {
  const PharmacyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details'), bottom: PHBottomBorder()),
      body: SafeArea(
        child: BlocBuilder<PharmacyDetailsBloc, PharmacyDetailsState>(
          builder: (context, state) {
            // Error State
            if (state is ErrorPharmacyDetailsState) {
              return const Center(
                child: Text('An error has occured.'),
              );
            }
            // Loaded State
            if (state is LoadedPharmacyDetailsState) {
              return CustomScrollView(
                slivers: [
                  PharmacyDetailsHeader(state.pharmacyDetails.name),
                  PharmacyDetailsBody(pharmacyDetails: state.pharmacyDetails),
                ],
              );
            }
            // Loading State
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
