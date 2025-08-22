import 'package:al_barq/config/theme_data.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:al_barq/src/features/home/components/product_card.dart';
import 'package:al_barq/src/features/products/models/category_model.dart';
import 'package:al_barq/src/features/products/models/product_model.dart';
import 'package:flutter/material.dart';

import '../components/product_banner.dart';
import '../components/search_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        clipBehavior: Clip.hardEdge,
        slivers: [
          SearchAppbar(),
          const SliverToBoxAdapter(child: SizedBox(height: myPadding / 2)),

          SliverToBoxAdapter(child: _title('Categories')),
          SliverToBoxAdapter(child: CategoryItem()),

          SliverToBoxAdapter(child: const SizedBox(height: myPadding / 3)),
          SliverToBoxAdapter(child: ProductBanner()),

          SliverToBoxAdapter(child: _title('All Products')),
          const SliverToBoxAdapter(child: SizedBox(height: myPadding / 2)),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: myPadding / 2),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ProductCard(
                  productModel: ProductModel.productsDummyData.first,
                );
              }, childCount: 4),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: myPadding / 2,
                mainAxisSpacing: myPadding / 2,
                childAspectRatio: 0.67,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: context.padding.bottom + myPadding * 4),
          ),
        ],
      ),
    );
  }

  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: myPadding / 3,
      ),
      child: Text(title, style: context.textTheme.bodyLarge),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: myPadding * 6,
      child:
       ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final product = CategoryModel.dummyCategories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: myPadding / 2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(product.image),
                ),
                const SizedBox(height: myPadding / 2),
                Text(product.name, style: context.textTheme.bodyMedium),
              ],
            ),
          );
        },
        itemCount: CategoryModel.dummyCategories.length,
      ),
    );
  }
}
