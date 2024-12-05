import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/feature/search/view/widgets/recent_search_text_tile_widget.dart';

class RecentsShowWidget extends StatelessWidget {
  const RecentsShowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recents',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            InkWell(
              onTap: () {},
              child: const Text('clear all',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18)),
            )
          ],
        ),
        16.verticalSpace,
        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: [
            ...List.generate(
              5,
              (index) => RecentsSearchTextTileWidget(
                searchTitle: 'Track Suit',
                onTap: () {},
              ),
            )
          ],
        ),
        10.verticalSpace,
        const Divider(
          thickness: 0.3,
        ),
      ],
    );
  }
}
