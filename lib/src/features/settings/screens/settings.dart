import 'package:al_barq/config/route_names.dart';
import 'package:al_barq/src/core/components/custom_container.dart';
import 'package:al_barq/src/core/constants/assets_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/components/layout_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
                    Navigator.pushNamed(context, RouteNames.profileScreen);
                  },
                ),
                SettingTile(
                  icon: Icons.shopping_cart_outlined,
                  title: 'My Cart',
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.myCart);
                  },
                ),
                SettingTile(
                  svgPath: AssetString.wishlist,

                  title: 'My wishlist',
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.wishList);
                  },
                ),
                SettingTile(
                  svgPath: AssetString.order,
                  title: 'My order',
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.orderScreen);
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
                    Navigator.pushNamed(context, RouteNames.contactUs);
                  },
                ),
                SettingTile(
                  svgPath: AssetString.privacy,
                  title: 'Privacy policy',
                  onTap: () {
                    //TODO:     privacyPoicy
                    Navigator.pushNamed(context, RouteNames.homePage);
                  },
                ),
                SettingTile(
                  svgPath: AssetString.searchPerson,
                  title: 'Terms and Conditions',
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.wishList);
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
                    Navigator.pushNamed(context, RouteNames.login);
                  },
                ),
              ],
            ),
          ),
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
