import 'package:flutter/material.dart';
import 'package:wac_sports/core/constants/app_constants.dart';
import 'package:wac_sports/feature/category/view/widgets/product_card_widget.dart';

class ProductsListGridView extends StatelessWidget {
  const ProductsListGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(2),
      shrinkWrap: true,
      itemCount: listOfProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 0.69,
      ),
      itemBuilder: (context, index) {
        return ProductCardWidget(
          product: listOfProducts[index],
        );
      },
    );
  }
}
