import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nimble_code_exercise/app/shared/widgets/ph_bottom_border.dart';

class PHAppBar extends AppBar {
  PHAppBar({super.key})
      : super(
          toolbarHeight: 80,
          leading: const Icon(Icons.filter_tilt_shift_rounded,
              color: Colors.white, size: 32),
          title: Text(
            'Pharmacy Hub',
            style: GoogleFonts.inter(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 123, 111, 234),
                  Color.fromARGB(255, 179, 172, 229)
                ],
                stops: [.3, 1],
              ),
            ),
          ),
          bottom: PHBottomBorder(),
        );
}
