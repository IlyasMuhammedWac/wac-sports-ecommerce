import 'package:flutter/material.dart';

class OrderDetailsTile extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final VoidCallback? onTap;

  const OrderDetailsTile({
    required this.title,
    required this.value,
    this.titleStyle,
    this.valueStyle,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            value,
            style: valueStyle,
          ),
        )
      ],
    );
  }
}