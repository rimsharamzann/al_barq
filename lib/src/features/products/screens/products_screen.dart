import 'package:al_barq/src/core/components/layout_widget.dart';
import 'package:al_barq/src/features/products/components/search-products.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      title: 'Products',
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
