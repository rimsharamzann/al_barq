import 'package:al_barq/config/theme_data.dart';
import 'package:al_barq/src/core/components/nav_bar.dart';
import 'package:al_barq/src/core/constants/network_images.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/components/general_container.dart';

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
    return GeneralContainer(
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                NetworkImages.productBanner,
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
                Text('Solar inverter', style: context.textTheme.displaySmall),

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
                    style: context.textTheme.bodySmall?.copyWith(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  'RS 25000',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: Colors.deepOrange,
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
