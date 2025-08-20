
import 'package:al_barq/src/features/products/models/product_model.dart' show ProductModel;
import 'package:flutter/material.dart';

import '../../../core/constants/assets_strings.dart';

class DiscoverSolarDreams extends StatelessWidget {
  final List<ProductModel> products = [
    ProductModel(
      title: "Modules",
      image: AssetString.solarPanel,
      category: '',
      rating: 0,
      price: '',
    ),
    ProductModel(
      title: "Inverters",
      image: AssetString.solarPanel,
      category: '',
      rating: 0,
      price: '',
    ),
    ProductModel(
      title: "Solar Kit",
      image: AssetString.solarPanel,
      category: '',
      rating: 0,
      price: '',
    ),
    ProductModel(
      title: "Solar Grid Kit",
      image: AssetString.solarPanel,
      category: '',
      rating: 0,
      price: '',
    ),
    ProductModel(
      title: "Wires",
      image: AssetString.solarPanel,
      category: '',
      rating: 0,
      price: '',
    ),
    ProductModel(
      title: "Solar Stand",
      image: AssetString.solarPanel,
      category: '',
      rating: 0,
      price: '',
    ),
  ];

  DiscoverSolarDreams({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // 🔹 Background container
          Container(
            width: double.infinity,
            color: const Color(0xFF0E1A2B),
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              children: [
                const Text(
                  "Discover your solar dreams here",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  "one stop solution for all your solar needs",
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _indicator(true),
                    const SizedBox(width: 6),
                    _indicator(false),
                    const SizedBox(width: 6),
                    _indicator(false),
                  ],
                ),
              ],
            ),
          ),

          Positioned(
            bottom: -80,
            left: 0,
            right: 0,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: products.map((product) {
                return _buildProductCard(product);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildProductCard(ProductModel product) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(radius: 60, backgroundImage: AssetImage(product.image)),
        const SizedBox(height: 8),
        Text(
          product.title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _indicator(bool active) {
    return Container(
      width: active ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: active ? Colors.orange : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
