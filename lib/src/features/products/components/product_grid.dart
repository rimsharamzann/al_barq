// import 'package:al_barq/src/core/constants/assets_strings.dart';
// import 'package:al_barq_tech/src/features/products/components/category_filter.dart';
// import 'package:al_barq_tech/src/features/products/components/power_filter.dart';
// import 'package:al_barq_tech/src/features/products/components/price_filter.dart';
// import 'package:al_barq_tech/src/features/products/components/product_card.dart';
// import 'package:al_barq_tech/src/features/products/models/product_model.dart';
// import 'package:flutter/material.dart';

// class FilterProductWidget extends StatelessWidget {
//   const FilterProductWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: 250,
//           child: Card(
//             color: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             elevation: 4,
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CategoryFilter(),
//                   SizedBox(height: 5),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Divider(color: Colors.grey.shade600, thickness: 0.3),
//                   ),
//                   SizedBox(height: 5),
//                   PowerFilter(),
//                   SizedBox(height: 5),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Divider(color: Colors.grey.shade600, thickness: 0.3),
//                   ),
//                   SizedBox(height: 5),
//                   PriceRangeSlider(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Expanded(child: ProductGrid()),
//       ],
//     );
//   }
// }

// class ProductGrid extends StatefulWidget {
//   const ProductGrid({super.key});

//   @override
//   State<ProductGrid> createState() => _ProductGridState();
// }

// class _ProductGridState extends State<ProductGrid> {
//   final List<ProductModel> products = List.generate(
//     6,
//     (index) => ProductModel(
//       category: "Panels",
//       title: "Premium Solar Panel 500W",
//       image: AssetString.solarPanel,
//       rating: 4.5,
//       price: "35,000",
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: GridView.builder(
//         itemCount: products.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           crossAxisSpacing: 12,
//           mainAxisSpacing: 12,
//           childAspectRatio: 1.175,
//         ),
//         itemBuilder: (context, index) {
//           return ProductCard(
//             product: products[index],
//             onAddToCart: () {
//               ScaffoldMessenger.of(
//                 context,
//               ).showSnackBar(SnackBar(content: Text("Product added to Cart!")));
//             },
//           );
//         },
//       ),
//     );
//   }
// }
