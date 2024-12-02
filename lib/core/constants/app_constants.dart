import 'package:flutter/material.dart';

class AppConstants {
  static final borderRadius30 = BorderRadius.circular(30);
  static final borderRadius10 = BorderRadius.circular(10);
}

final list = [
  "https://rightangleglobal.com/wp-content/uploads/2023/08/cover_1_blog_2.jpg",
  // "https://www.quickeselling.com/wp-content/uploads/2019/11/sport_web-min.jpg"
];

const bannerImage =
    "https://templates.simplified.co/thumb/1f4ddfc2-fd55-43f9-8c8a-3be7277d5828.jpg";
const upto50 =
    "https://static.vecteezy.com/system/resources/thumbnails/008/077/586/small_2x/up-to-50-percent-off-golden-text-video.jpg";
final categoryImages = [
  CategoryModel(
    id: "1",
    title: "Equipment",
    image:
        "https://c8.alamy.com/comp/P9J0DK/sports-equipment-on-a-white-wooden-background-top-view-motivation-P9J0DK.jpg",
  ),
  CategoryModel(
    id: "2",
    title: "Shoes",
    image:
        "https://www.shutterstock.com/image-photo/hologram-shoes-sports-fitness-run-600nw-2240460409.jpg",
  ),
  CategoryModel(
    id: "3",
    title: "Fitness",
    image:
        "https://img.freepik.com/free-photo/people-exercising-practicing-sports-with-use-foam-roller_23-2151742543.jpg",
  ),
  CategoryModel(
    id: "4",
    title: "Clothes",
    image:
        "https://avrosport.co.uk/uploads/2023/05/what-are-the-best-places-to-buy-soccer-jerseys.webp",
  ),
];

class CategoryModel {
  final String id;
  final String title;
  final String image;

  CategoryModel({required this.id, required this.title, required this.image});
}

class Product {
  final String title;
  final double price;
  final double rating;
  final String thumbnail;

  Product({
    required this.title,
    required this.price,
    required this.rating,
    required this.thumbnail,
  });
}

final listOfProducts = [
  Product(
      title: "Revolution 6 Running Shoes For Men  (Black , 11)",
      price: 2956,
      rating: 4,
      thumbnail:
          "https://rukminim2.flixcart.com/image/612/612/xif0q/shoe/2/m/k/-original-imah5vxzmubjhh6s.jpeg?q=70"),
  Product(
      title: "Revolution 6 Running Shoes For Men  (Black , 11)",
      price: 2956,
      rating: 4,
      thumbnail:
          "https://rukminim2.flixcart.com/image/612/612/xif0q/shoe/2/m/k/-original-imah5vxzmubjhh6s.jpeg?q=70"),
  Product(
      title: "Revolution 6 Running Shoes For Men  (Black , 11)",
      price: 2956,
      rating: 4,
      thumbnail:
          "https://rukminim2.flixcart.com/image/612/612/xif0q/shoe/2/m/k/-original-imah5vxzmubjhh6s.jpeg?q=70"),
  Product(
      title: "Revolution 6 Running Shoes For Men  (Black , 11)",
      price: 2956,
      rating: 4,
      thumbnail:
          "https://rukminim2.flixcart.com/image/612/612/xif0q/shoe/2/m/k/-original-imah5vxzmubjhh6s.jpeg?q=70"),
  Product(
      title: "Revolution 6 Running Shoes For Men  (Black , 11)",
      price: 2956,
      rating: 4,
      thumbnail:
          "https://rukminim2.flixcart.com/image/612/612/xif0q/shoe/2/m/k/-original-imah5vxzmubjhh6s.jpeg?q=70"),
];
