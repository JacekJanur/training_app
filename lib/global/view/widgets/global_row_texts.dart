import 'package:flutter/material.dart';

class GlobalRowTexts extends StatelessWidget {
  const GlobalRowTexts({
    super.key,
    required this.leftText,
    required this.rightText,
    this.isTitle = false,
    this.rightColor,
    this.rightOnTap,
    this.isBold = false,
  });

  final bool isTitle;
  final bool isBold;
  final String leftText;
  final String rightText;
  final Color? rightColor;
  final Future<void> Function()? rightOnTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final testStyle = isTitle
        ? textTheme.titleLarge!
            .copyWith(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)
        : textTheme.bodyMedium!
            .copyWith(fontWeight: isBold ? FontWeight.bold : FontWeight.normal);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: testStyle,
        ),
        GestureDetector(
          onTap: () async {
            if (rightOnTap == null) {
              return;
            }
            rightOnTap!();
          },
          child: Text(
            rightText,
            style: testStyle.copyWith(color: rightColor ?? Colors.black),
          ),
        ),
      ],
    );
  }
}
