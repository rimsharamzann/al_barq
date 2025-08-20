import 'package:al_barq/src/core/components/custom_container.dart';
import 'package:al_barq/src/core/constants/assets_strings.dart';
import 'package:al_barq/src/features/auth/screens/login_screen.dart';
import 'package:al_barq/src/features/contact_us/screens/contact_us_screen.dart';
import 'package:al_barq/src/features/landing_page/screens/home_page.dart';
import 'package:al_barq/src/features/orders/screens/cart_acreen.dart';
import 'package:al_barq/src/features/orders/screens/order_screen.dart';
import 'package:al_barq/src/features/settings/screens/my_wishlist_screen.dart';
import 'package:al_barq/src/features/settings/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/components/layout_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  static const routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      title: 'Settings',
      body: ListView(
        children: [
          CustomContainer(
            child: Column(
              children: [
                SettingTile(
                  icon: Icons.person_outline,
                  title: 'profile',
                  onTap: () {
                    Navigator.pushNamed(context, ProfileScreen.routeName);
                  },
                ),
                SettingTile(
                  icon: Icons.shopping_cart_outlined,
                  title: 'My Cart',
                  onTap: () {
                    Navigator.pushNamed(context, CartScreen.routeName);
                  },
                ),
                SettingTile(
                  svgPath: AssetString.wishlist,

                  title: 'My wishlist',
                  onTap: () {
                    Navigator.pushNamed(context, MyWishList.routeName);
                  },
                ),
                SettingTile(
                  svgPath: AssetString.order,
                  title: 'My order',
                  onTap: () {
                    Navigator.pushNamed(context, OrderScreen.routeName);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          CustomContainer(
            child: Column(
              children: [
                SettingTile(
                  icon: Icons.phone_outlined,
                  title: 'Contact us',
                  onTap: () {
                    Navigator.pushNamed(context, ContactUsScreen.routeName);
                  },
                ),
                SettingTile(
                  svgPath: AssetString.privacy,
                  title: 'Privacy policy',
                  onTap: () {
                    //TODO:     privacyPoicy
                    Navigator.pushNamed(context, HomePage.routeName);
                  },
                ),
                SettingTile(
                  svgPath: AssetString.searchPerson,
                  title: 'Terms and Conditions',
                  onTap: () {
                    // Navigator.pushNamed(context, RouteNames.wishList);
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: 16),
          CustomContainer(
            child: Column(
              children: [
                SettingTile(
                  svgPath: AssetString.delete,
                  title: 'Delete',
                  onTap: () {},
                ),
                SettingTile(
                  svgPath: AssetString.logout,
                  title: 'Logout',
                  onTap: () {
                    //TODO:     logout
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 160),
        ],
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    this.icon,
    this.svgPath,
    required this.onTap,
  });

  final String title;
  final IconData? icon;
  final String? svgPath;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: _buildLeading(),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_sharp,
        color: Colors.black87,
        size: 16,
      ),
    );
  }

  Widget _buildLeading() {
    if (svgPath != null) {
      return SvgPicture.asset(
        svgPath!,
        height: 20,
        width: 20,
        colorFilter: const ColorFilter.mode(Colors.black87, BlendMode.srcIn),
      );
    } else if (icon != null) {
      return Icon(icon, color: Colors.black87, size: 20);
    }
    return const SizedBox.shrink();
  }
}
