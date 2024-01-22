import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimble_code_exercise/app/bloc/medications/selections/selections_cubit.dart';
import 'package:nimble_code_exercise/app/bloc/pharmacies/pharmacies_bloc.dart';
import 'package:nimble_code_exercise/app/shared/widgets/ph_header_text.dart';
import 'package:nimble_code_exercise/app/shared/widgets/ph_list_tile.dart';

class OrderSelectionList extends StatelessWidget {
  const OrderSelectionList({
    required this.pharmacyId,
    required this.medications,
    super.key,
  });
  final String? pharmacyId;
  final List<String> medications;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocBuilder<PharmaciesBloc, PharmaciesState>(
          builder: (context, state) {
            if (state is LoadedPharmaciesState) {
              final pharmacyFromId = state.pharmacies
                  .where((e) => e.pharmacyId == pharmacyId)
                  .firstOrNull;
              if (pharmacyFromId == null) {
                return const SizedBox();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PhHeaderText(pharmacyFromId.name ?? ''),
                ],
              );
            }
            return const SizedBox();
          },
        ),
        ...medications
            .map(
              (medicationName) => BlocBuilder<SelectionsCubit, List<String>>(
                builder: (context, state) {
                  final isSelected = state.contains(medicationName);
                  return PHListTile(
                    title: medicationName,
                    trailing:
                        // Let PHListTile handle tap
                        IgnorePointer(
                      child: Checkbox(
                        visualDensity: VisualDensity.compact,
                        value: isSelected,
                        onChanged: (_) {},
                      ),
                    ),
                    onTap: () {
                      !isSelected
                          ? context.read<SelectionsCubit>().add(medicationName)
                          : context
                              .read<SelectionsCubit>()
                              .remove(medicationName);
                    },
                  );
                },
              ),
            )
            .toList(),
      ],
    );
  }
}
