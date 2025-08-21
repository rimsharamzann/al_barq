import 'package:al_barq/src/core/components/layout_widget.dart';
import 'package:al_barq/src/features/products/components/search_products.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  static const routeName = '/products';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Cart'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DiscoverProductsSection(),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            //   child: SizedBox(
            //     height: context.height,
            //     child: FilterProductWidget(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
