import 'package:al_barq/src/core/constants/assets_strings.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final PageController _pageController = PageController();
  final List<String> banners = [
    AssetString.solar,
    AssetString.authBg,
    AssetString.solarPanel,
    AssetString.inverter,
  ];

  @override
  Widget build(BuildContext context) {
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
                    return Image.asset(
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
                        CircleAvatar(
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

              /// Page Indicator
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
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black26)],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Solar Panel Kit",
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// Info Row
                    Row(
                      children: [
                        _infoBox(
                          "4.8",
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
                      'Rs 25,000',
                      style: const TextStyle(
                        fontSize: 20,
                        color: MyColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'High-efficiency monocrystalline solar panel for residential use with 25-year warranty.',
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
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
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      trailing: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('More', style: TextStyle(color: Colors.black54, fontSize: 14)),
          SizedBox(width: 6),
          Icon(Icons.arrow_drop_down_sharp, size: 20),
        ],
      ),
      children: children,
    );
  }

  TextStyle _style() {
    return const TextStyle(
      color: Colors.black87,
      fontSize: 12,
      fontWeight: FontWeight.w300,
    );
  }

  Widget _infoBox(String value, String label, IconData icon, Color? color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 3),

          Icon(icon, color: color ?? Colors.grey, size: 16),
          const SizedBox(width: 3),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
