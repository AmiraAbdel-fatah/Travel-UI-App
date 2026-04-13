import 'package:flutter/material.dart';
import 'package:travello_app/utils/AppColors.dart';

class Product {
  final String name;
  final String brand;
  final double price;
  final String image;
  final String description;
  final double rating;
  final List<Color> availableColors;

  Product({
    required this.name,
    required this.brand,
    required this.price,
    required this.image,
    required this.description,
    required this.rating,
    required this.availableColors,
  });
}

final List<Product> products = [
  Product(
    name: "Apple Watch SE",
    brand: "Apple",
    price: 349.99,
    image: "assets/apple_watch_se.png",
    description:
        "The aluminium case is lightweight and made from 100 percent recycled aerospace grade alloy.",
    rating: 4.9,
    availableColors: [
      AppColors.lightGrey,
      Colors.deepOrange,
      Colors.yellow[100]!,
    ],
  ),
  Product(
    name: "Galaxy Watch 4",
    brand: "Samsung",
    price: 249.99,
    image: "assets/galaxy_watch_4.png",
    description:
        "Experience the next generation of Galaxy Watch with advanced health tracking.",
    rating: 4.7,
    availableColors: [
      AppColors.lightGrey,
      Colors.deepOrange,
      Colors.yellow[100]!,
    ],
  ),
  Product(
    name: "Amazfit GTS 2",
    brand: "Amazfit",
    price: 199.99,
    image: "assets/amazfit_gts_2.png",
    description: "Where Style Meets Health. 3D Curved Bezel-less Design.",
    rating: 4.5,
    availableColors: [
      AppColors.lightGrey,
      Colors.deepOrange,
      Colors.yellow[100]!,
    ],
  ),
  Product(
    name: "Galaxy Watch 7",
    brand: "Samsung",
    price: 279.99,
    image: "assets/galaxy_watch_7.png",
    description:
        "The latest in the Galaxy Watch series with improved battery and performance.",
    rating: 4.8,
    availableColors: [
      AppColors.lightGrey,
      Colors.deepOrange,
      Colors.yellow[100]!,
    ],
  ),
];
