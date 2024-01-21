import 'package:flutter/material.dart';
import 'package:nimble_code_exercise/service/dtos/pharmacy_address.dart';
import 'package:nimble_code_exercise/service/dtos/pharmacy_details.dart';

class PharmacyDetailsBody extends StatelessWidget {
  const PharmacyDetailsBody({required this.pharmacyDetails, super.key});
  final PharmacyDetails pharmacyDetails;

  PharmacyAddress? get address => pharmacyDetails.address;

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _phone(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: _address(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: _hours(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _phone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Phone',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        if (pharmacyDetails.primaryPhoneNumber != null)
          detailText(pharmacyDetails.primaryPhoneNumber!),
        if (pharmacyDetails.primaryPhoneNumber == null)
          detailText('No phone number to display'),
      ],
    );
  }

  Widget _address() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Address',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        if (address?.streetAddress1 != null)
          detailText(address!.streetAddress1!),
        if (address?.city != null && address?.usTerritory != null)
          detailText('${address!.city!}, ${address?.usTerritory!}'),
        if (address?.streetAddress1 == null &&
            address?.city == null &&
            address?.usTerritory == null)
          detailText('No Address to display'),
      ],
    );
  }

  Widget _hours() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Hours',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        if (pharmacyDetails.pharmacyHours != null)
          ...pharmacyDetails.pharmacyHours!
              .split('\\n')
              .map((e) => Text(e.trim()))
              .toList(),
        if (pharmacyDetails.pharmacyHours == null)
          detailText('No hours to display'),
      ],
    );
  }

  Text detailText(String text) {
    return Text(text, style: const TextStyle(fontSize: 16));
  }
}
