import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/components/buttons.dart';
import '../../../core/constants/assets_strings.dart';
import '../../products/components/product_card.dart';
import '../../products/models/product_model.dart' show ProductModel;

class FeaturedProducts extends StatelessWidget {
  final List<ProductModel> products = [
    ProductModel(
      id: '',
      image: AssetString.solarPanel,
      title: "Premium 500W Solar Panel",
      category: "Panels",
      price: '45000',
      rating: 4.8,
    ),
    ProductModel(
      id: '',
      image: AssetString.solarPanel,
      title: "Premium 500W Solar Panel",
      category: "Panels",
      price: '45000',
      rating: 4.8,
    ),
    ProductModel(
      id: '',
      image: AssetString.solarPanel,
      title: "Premium 500W Solar Panel",
      category: "Panels",
      price: '45000',
      rating: 4.8,
    ),
  ];

  FeaturedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Featured Products",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 80,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Our most popular solar solutions",
            style: TextStyle(color: Colors.black54, fontSize: 18),
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
          const SizedBox(height: 20),

          SizedBox(
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (_, __) => const SizedBox(width: 15),
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  width: context.width / 3.5,

                  product: product,
                  onAddToCart: () {},
                );
              },
            ),
          ),

          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: CustomButton(
              width: context.width / 5.5,
              text: 'View all products',
              onPress: () {},
            ),
          ),
        ],
      ),
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
