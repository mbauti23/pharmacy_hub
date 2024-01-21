import 'package:flutter/material.dart';
import 'package:nimble_code_exercise/app/router/ph_paths.dart';
import 'package:nimble_code_exercise/app/shared/widgets/ph_list_tile.dart';
import 'package:nimble_code_exercise/app/utils/context_extension.dart';
import 'package:nimble_code_exercise/service/dtos/pharmacy.dart';

class PharmacyListTile extends StatelessWidget {
  const PharmacyListTile({
    required this.pharmacy,
    super.key,
  });
  final Pharmacy pharmacy;
  @override
  Widget build(BuildContext context) {
    return PHListTile(
      title: pharmacy.name,
      onTap: () {
        context.pushScreen(PharmacyHubPaths.pharmacyDetails
            .replaceParam('pharmacyId', '${pharmacy.pharmacyId}'));
      },
    );
  }
}
