import 'package:flutter/material.dart';

class PHBottomBorder extends PreferredSize {
  PHBottomBorder({super.key})
      : super(
          preferredSize: const Size(double.infinity, 2.5),
          child: Container(
            color: Colors.grey.shade300,
            height: 2.5,
            width: double.infinity,
          ),
        );
}
