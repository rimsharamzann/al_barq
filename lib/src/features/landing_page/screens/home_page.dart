import 'package:al_barq/config/theme_data.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:al_barq/src/features/landing_page/components/product_card.dart';
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
  final product = ProductModel(
    name: "Solar inverter 200W",
    price: 456789,
    rating: 4.5,
    image:
        "https://static.vecteezy.com/system/resources/thumbnails/040/995/143/small/ai-generated-fields-of-solar-panels-and-systems-to-produce-green-electricity-ai-generated-photo.jpg",

    id: "productId123",
    description:
        'High-efficiency monocrystalline solar panel for residential use with 25-year warranty.',

    category: 'PANEL',
    quantity: 4,
  );

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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ProductCard(productModel: product);
              }, childCount: 4),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
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
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key});

  final List<CategoryModel> products = [
    CategoryModel(
      id: '',
      name: "Modules",
      image:
          'https://img.etimg.com/thumb/width-1200,height-1200,imgsize-512229,resizemode-75,msid-69130699/small-biz/productline/power-generation/solar-pv-modules-features-applications-and-how-do-they-work.jpg',
      description: '',
    ),
    CategoryModel(
      id: '',
      name: "Inverters",
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVQR3IO2qc94kPhg_29KSAyd5wBfZmHxn49A&s',
      description: '',
    ),
    CategoryModel(
      id: '',
      name: "Solar Kit",
      image:
          'https://5.imimg.com/data5/SELLER/Default/2020/10/LQ/VF/TQ/15396979/1kw-off-grid-solar-power-system-500x500.jpg',
      description: '',
    ),
    CategoryModel(
      name: "Solar Grid Kit",
      image:
          'https://www.gogreensolar.com/cdn/shop/collections/grid-tie-solar-kits.jpg?v=1701730535&width=800',
      id: '',
      description: '',
    ),
    CategoryModel(
      name: "Wires",
      id: '',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR36Ig7aANXPr4oxjNWiEAx8HsPUuDMWVl-cA&s',
      description: '',
    ),
    CategoryModel(
      name: "Solar Stand",
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeSpmmfMfjUmyWE9RmRE0aY7daRSr_-fbSdXLXxuJQsewxdY4zoCHy9l0BMydZRQltZ-4&usqp=CAU',
      id: '',
      description: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: myPadding / 3,
      ),
      child: Row(
        children: products.map((product) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(product.image),
                ),
                const SizedBox(height: 8),
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
