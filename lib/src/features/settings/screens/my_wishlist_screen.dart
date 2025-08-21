import 'package:al_barq/config/theme_data.dart';
import 'package:al_barq/src/core/components/layout_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/components/custom_container.dart';
import '../../../core/constants/assets_strings.dart';
import '../../../core/constants/my_colors.dart';

class MyWishList extends StatelessWidget {
  const MyWishList({super.key});
  static const routeName = '/wish-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Wishlist'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: myPadding),

        children: List.generate(4, (index) => WishlistCard()),
      ),
    );
  }
}

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                AssetString.inverter,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Solar inverter',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange.shade50,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'PANELS',
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  'RS 25000',
                  style: const TextStyle(
                    color: MyColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
