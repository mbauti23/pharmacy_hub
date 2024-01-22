import 'package:flutter/material.dart';

class PHListTile extends StatelessWidget {
  const PHListTile({
    required this.title,
    this.onTap,
    this.trailing,
    this.hasSeparator = true,
    this.padding,
    super.key,
  });

  final String? title;
  final Function()? onTap;
  final Widget? trailing;
  final bool hasSeparator;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: padding ?? const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title ?? 'Null',
                    style: const TextStyle(fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                trailing ?? const SizedBox(),
              ],
            ),
          ),
          if (hasSeparator)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              color: Colors.grey.shade300,
              height: 1,
            ),
        ],
      ),
    );
  }
}
