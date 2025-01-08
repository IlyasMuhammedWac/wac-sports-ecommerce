import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeAndQuantityCardWidget extends StatelessWidget {
  final String title;
  final String titleValue;
  const SizeAndQuantityCardWidget({
    required this.title,
    required this.titleValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[300],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(title),
            3.horizontalSpace,
            Text(
              titleValue,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Icon(
              Icons.keyboard_arrow_down_sharp,
              size: 17,
            )
          ],
        ),
      ),
    );
  }
}