import 'package:flutter/material.dart';
import 'package:wac_sports/core/extension/context.dart';

class CategoryTileWidget extends StatelessWidget {
  final String categoryTitle;
  final VoidCallback ontap;
  const CategoryTileWidget({
    required this.categoryTitle,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: context.grey200, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 8, left: 16, right: 16),
          child: Text(categoryTitle,
              style:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        ),
      ),
    );
  }
}