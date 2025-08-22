import 'package:al_barq/config/theme_data.dart';
import 'package:al_barq/src/core/constants/assets_strings.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:al_barq/src/features/products/models/product_model.dart';
import 'package:al_barq/src/features/products/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});
  static const routeName = '/product-details';

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final PageController _pageController = PageController();
  final List<String> banners = [
    'https://media.istockphoto.com/id/2167474939/photo/two-workers-installing-solar-panel-on-roof.webp?a=1&b=1&s=612x612&w=0&k=20&c=tfn9Gl5Q_aWPvLcVrlkEXy5SOyqZXXn0KvSMxA98h8E=',
    'https://images.unsplash.com/photo-1558449028-b53a39d100fc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c29sYXJ8ZW58MHx8MHx8fDA%3D',
    'https://plus.unsplash.com/premium_photo-1679917152396-4b18accacb9d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c29sYXJ8ZW58MHx8MHx8fDA%3D',
    'https://media.istockphoto.com/id/1455358887/photo/aerial-view-of-large-electrical-power-plant-with-many-rows-of-solar-photovoltaic-panels-for.webp?a=1&b=1&s=612x612&w=0&k=20&c=8M5KzJGYmJUdolFNAxb66BeaLRmnY9lH6j4l5IlAlXY=',
  ];

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      // backgroundColor: Colors.green,
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: context.height / 2.6,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: banners.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      banners[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                ),
              ),

              /// Top Buttons
              Positioned(
                top: 40,
                left: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: _iconWidget(
                        Icons.arrow_back_ios_outlined,
                        Colors.black87,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ProductScreen.routeName,
                            );
                          },
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset(
                              AssetString.wishlist,
                              height: 18,
                              width: 18,
                              colorFilter: const ColorFilter.mode(
                                Colors.red,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                            AssetString.export,
                            height: 18,
                            width: 18,
                            colorFilter: const ColorFilter.mode(
                              Colors.black87,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: banners.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: MyColors.primaryColor,
                      dotColor: Colors.grey.shade400,
                      dotHeight: 8,
                      dotWidth: 8,
                      expansionFactor: 3,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black26)],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// Info Row
                    Row(
                      children: [
                        _infoBox(
                          product.rating.toString(),
                          'Reviews',
                          Icons.star,
                          MyColors.primaryColor,
                        ),
                        const SizedBox(width: 10),
                        _infoBox(
                          "",
                          'Likes',
                          Icons.thumb_up_off_alt,
                          Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        _infoBox("10", '', Icons.message_rounded, Colors.grey),
                      ],
                    ),

                    const SizedBox(height: 10),
                    Text(
                      product.price.toString(),
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: MyColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.description,
                      style: context.textTheme.labelMedium?.copyWith(
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 10),

                    _expansionTile('Description', [
                      Text(
                        'This solar panel kit provides efficient energy conversion '
                        'and is designed for both home and commercial use.',
                        style: _style(),
                      ),
                    ]),

                    _expansionTile('Highlights', [
                      ListTile(
                        leading: const Icon(Icons.bolt),
                        title: Text("High efficiency cells", style: _style()),
                      ),
                      ListTile(
                        leading: const Icon(Icons.build),
                        title: Text("Easy installation", style: _style()),
                      ),
                      ListTile(
                        leading: const Icon(Icons.shield),
                        title: Text("10-year warranty", style: _style()),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconWidget(IconData icon, Color color) {
    return CircleAvatar(
      radius: 14,
      backgroundColor: Colors.white,
      child: Icon(icon, color: color, size: 14),
    );
  }

  Widget _expansionTile(String title, List<Widget> children) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      collapsedShape: const RoundedRectangleBorder(),
      shape: const RoundedRectangleBorder(),
      title: Text(title, style: context.textTheme.labelMedium),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'More',
            style: context.textTheme.labelSmall?.copyWith(
              color: Colors.black54,
            ),
          ),
          SizedBox(width: 6),
          Icon(Icons.arrow_drop_down_sharp, size: 20),
        ],
      ),
      children: children,
    );
  }

  TextStyle? _style() {
    return context.textTheme.bodySmall;
  }

  Widget _infoBox(String value, String label, IconData icon, Color? color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: myPadding / 3,
        vertical: myPadding / 4,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: context.textTheme.labelSmall?.copyWith(fontSize: 12),
          ),
          const SizedBox(width: 3),

          Icon(icon, color: color ?? Colors.grey, size: 16),
          const SizedBox(width: 3),

          Text(
            value,
            style: context.textTheme.labelSmall?.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
