import 'package:flutter/material.dart';

class PHListTile extends StatelessWidget {
  const PHListTile({
    required this.title,
    required this.onTap,
    super.key,
  });

  final String? title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              title ?? 'Null',
              style: const TextStyle(fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              color: Colors.grey.shade300,
              height: 1),
        ],
      ),
    );
  }
}
