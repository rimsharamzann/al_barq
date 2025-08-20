import 'package:al_barq/src/core/components/layout_widget.dart';
import 'package:al_barq/src/core/constants/assets_strings.dart';
import 'package:al_barq/src/features/landing_page/components/product_card.dart';
import 'package:al_barq/src/features/products/models/category_model.dart';
import 'package:flutter/material.dart';

import '../components/product_banner.dart';
import '../components/search_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      title: '',
      padding: EdgeInsets.zero,
      appbar: AppBar(automaticallyImplyLeading: false, toolbarHeight: 0),
      body: CustomScrollView(
        shrinkWrap: true,
        clipBehavior: Clip.hardEdge,
        slivers: [
          SearchAppbar(),

          // SliverAppBar(
          //   // flexibleSpace: FlexibleSpaceBar(title: CustomSearchAppBar()),
          //   expandedHeight: 160,
          //   floating: true,
          //   pinned: true,
          //   bottom: CustomSearchAppBar(),
          //   backgroundColor: Colors.white,
          //   automaticallyImplyLeading: false,
          //   // title: CustomSearchAppBar(),
          // ),
          SliverToBoxAdapter(child: _title('Categories')),
          SliverToBoxAdapter(child: CategoryItem()),

          SliverToBoxAdapter(child: const SizedBox(height: 10)),
          SliverToBoxAdapter(child: ProductBanner()),

          SliverToBoxAdapter(child: _title('All Products')),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return const ProductCard(
                  title: "Solar inverter 200W",
                  price: "Rs 20,000",
                  rating: 4.5,
                  imageUrl:
                      "https://static.vecteezy.com/system/resources/thumbnails/040/995/143/small/ai-generated-fields-of-solar-panels-and-systems-to-produce-green-electricity-ai-generated-photo.jpg",
                );
              }, childCount: 4),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.67,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return

//     LayoutWidget(
//       title: '',
//       padding: EdgeInsets.all(0),
//       appbar: AppBar(automaticallyImplyLeading: false, toolbarHeight: 0),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomSearchAppBar(),
//             _title('categories'),
//             ProductItems(),
//             SizedBox(height: 10),

//             ProductBanner(),

//             _title('All Products'),

//             const SizedBox(height: 12),

//             GridView.builder(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: 4,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 childAspectRatio: 0.67,
//               ),
//               itemBuilder: (context, index) {
//                 return const ProductCard(
//                   title: "Solar inverter 200W",
//                   price: "Rs 20,000",
//                   rating: 4.5,
//                   imageUrl:
//                       "https://static.vecteezy.com/system/resources/thumbnails/040/995/143/small/ai-generated-fields-of-solar-panels-and-systems-to-produce-green-electricity-ai-generated-photo.jpg",
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _title(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Text(
//         title,
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }

// }

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key});

  final List<CategoryModel> products = [
    CategoryModel(id: '', name: "Modules", image: AssetString.sattlite),
    CategoryModel(id: '', name: "Inverters", image: AssetString.battery),
    CategoryModel(id: '', name: "Solar Kit", image: AssetString.battery1),
    CategoryModel(name: "Solar Grid Kit", image: AssetString.battery2, id: ''),
    CategoryModel(name: "Wires", id: '', image: AssetString.sattlite),
    CategoryModel(name: "Solar Stand", image: AssetString.bgImage, id: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        children: products.map((product) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(product.image),
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
