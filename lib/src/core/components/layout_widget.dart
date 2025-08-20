import 'package:al_barq/config/route_names.dart';
import 'package:al_barq/src/features/landing_page/screens/home_page.dart';
import 'package:al_barq/src/features/orders/screens/cart_acreen.dart';
import 'package:al_barq/src/features/orders/screens/checkout.dart';
import 'package:al_barq/src/features/settings/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class LayoutWidget extends StatefulWidget {
  const LayoutWidget({
    super.key,
    required this.body,
    required this.title,
    this.appbar,
    this.padding,
  });

  final Widget body;
  final String title;
  final AppBar? appbar;
  final EdgeInsetsGeometry? padding;

  @override
  State<LayoutWidget> createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  final List<String> _routes = [
    RouteNames.homePage,
    RouteNames.myCart,
    RouteNames.checkout,
    RouteNames.settings,
  ];

  @override
  Widget build(BuildContext context) {
    final currentRouteName = ModalRoute.of(context)?.settings.name;
    var currentIndex = _routes.indexOf(currentRouteName ?? RouteNames.homePage);
    if (currentIndex == -1) {
      currentIndex = 0;
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar:
          widget.appbar ??
          AppBar(
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
                  child: Icon(
                    size: 14,
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey.shade100,
            elevation: 0,
            title: Text(
              widget.title,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
      body: Padding(
        padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 10),
        child: widget.body,
      ),

      // bottomNavigationBar: Container(
      //   margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      //   decoration: BoxDecoration(
      //     color: Colors.black87,
      //     borderRadius: BorderRadius.circular(16),
      //     // topLeft: Radius.circular(16),
      //     // topRight: Radius.circular(16),
      //     // ),
      //   ),
      //   child: BottomNavigationBar(
      //     currentIndex: currentIndex,
      //     onTap: (index) {
      //       final targetRoute = _routes[index];
      //       if (targetRoute != currentRouteName) {
      //         Navigator.pushReplacementNamed(context, targetRoute);
      //       }
      //     },
      //     backgroundColor: Colors.transparent,
      //     elevation: 2,
      //     type: BottomNavigationBarType.fixed,
      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //     items: [
      //       _buildNavItem(AssetString.home, "Home", 0, currentIndex),
      //       _buildNavItem(AssetString.cart, "Cart", 1, currentIndex),
      //       _buildNavItem(
      //         AssetString.notification,
      //         "Notifications",
      //         2,
      //         currentIndex,
      //       ),
      //       _buildNavItem(AssetString.settings, "Settings", 3, currentIndex),
      //     ],
      //   ),
      // ),
    );
  }

  // BottomNavigationBarItem _buildNavItem(
  //   String image,
  //   String label,
  //   int index,
  //   int currentIndex,
  // ) {
  //   final bool isSelected = currentIndex == index;

  //   return BottomNavigationBarItem(
  //     label: "",
  //     icon: Flexible(
  //       child: Container(
  //         padding: const EdgeInsets.all(6),
  //         decoration: BoxDecoration(
  //           color: isSelected ? MyColors.primaryColor : Colors.transparent,
  //           borderRadius: BorderRadius.circular(6),
  //         ),
  //         child: Row(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             SvgPicture.asset(
  //               image,
  //               // color: Colors.white,
  //               colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
  //             ),
  //             if (isSelected) ...[
  //               const SizedBox(width: 2),
  //               Text(
  //                 label,
  //                 style: const TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 12,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //             ],
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

class CustomLayout extends StatefulWidget {
  const CustomLayout({super.key});

  @override
  State<CustomLayout> createState() => _CustomLayoutState();
}

class _CustomLayoutState extends State<CustomLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    CartScreen(),
    CheckoutScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey.shade100,
      body: _screens[_selectedIndex],
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
