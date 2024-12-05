import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/config/routes/routes.dart';
import 'package:wac_sports/core/constants/app_constants.dart';
import 'package:wac_sports/core/extension/context.dart';
import 'package:wac_sports/feature/search/view/widgets/category_tile_widget.dart';
import 'package:wac_sports/feature/search/view/widgets/recent_show_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isRecent = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -2,
        title: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: TextFormField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black)),
                hintText: 'Search your product',
                hintStyle: TextStyle(
                    color: context.grey200, fontWeight: FontWeight.w400)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          isRecent ? const RecentsShowWidget() : const SizedBox(),
          const Row(
            children: [
              Text(
                'What you searching for ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          20.verticalSpace,
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              ...List.generate(
                categoryImages.length,
                (index) => CategoryTileWidget(
                  categoryTitle: categoryImages[index].title,
                  ontap: () {
                    Navigator.pushNamed(context, Routes.categoryScreen,
                        arguments: {
                          'category': categoryImages[index],
                          'cuperNav': true,
                        });
                  },
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}






