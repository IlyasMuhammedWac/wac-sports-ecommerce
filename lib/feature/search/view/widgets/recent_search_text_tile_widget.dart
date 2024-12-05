import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/core/extension/context.dart';

class RecentsSearchTextTileWidget extends StatelessWidget {
  final String searchTitle;
  final VoidCallback onTap;
  const RecentsSearchTextTileWidget({
    required this.searchTitle,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.grey200,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(searchTitle,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
            5.horizontalSpace,
            InkWell(
              onTap: onTap,
              child: const Icon(
                CupertinoIcons.clear,
                size: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}