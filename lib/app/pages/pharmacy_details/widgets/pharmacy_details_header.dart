import 'package:flutter/material.dart';
import 'package:nimble_code_exercise/app/shared/widgets/ph_header_text.dart';

class PharmacyDetailsHeader extends SliverAppBar {
  PharmacyDetailsHeader(String? headerText, {super.key})
      : super(
          automaticallyImplyLeading: false,
          expandedHeight: 200,
          centerTitle: false,
          stretch: true,
          flexibleSpace: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                'https://assets-global.website-files.com/6442ac7739465334ecc14b3c/6453abdcb649814262c5fe43_About_1_cropped.webp',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                    stops: [.6, 1],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: PhHeaderText.white(headerText ?? 'Null'),
              ),
            ],
          ),
        );
}
