import 'package:al_barq/src/features/landing_page/screens/home_page.dart';
import 'package:al_barq/src/features/orders/screens/cart_acreen.dart';
import 'package:al_barq/src/features/settings/screens/notification.dart';
import 'package:al_barq/src/features/settings/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.grey.shade50,
      centerTitle: true,
      leadingWidth: 50,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            radius: 12,
            backgroundColor: Colors.grey.shade300,
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 14,
              color: Colors.black87,
            ),
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.grey.shade100,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class Navbar extends StatefulWidget {
  const Navbar({super.key});
  static const routeName = '/navbar';

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    CartScreen(),
    NotificationScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey.shade100,
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black12)],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: GNav(
              tabBorderRadius: 12,
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.deepOrange,
              color: Colors.white,
              tabs: const [
                GButton(icon: Icons.home_outlined, text: 'Home'),
                GButton(icon: Icons.shopping_cart_outlined, text: 'cart'),
                GButton(
                  icon: Icons.notification_important_outlined,
                  text: 'notifications',
                ),
                GButton(icon: Icons.settings_outlined, text: 'Settings'),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
