import 'package:al_barq/src/features/orders/screens/cart_acreen.dart'
    show CartScreen;
import 'package:al_barq/src/features/orders/screens/order_screen.dart';
import 'package:al_barq/src/features/settings/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/layout_widget.dart';
import '../../landing_page/screens/home_page.dart';
import '../../products/models/product_model.dart';
import '../components/order_detail_components.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});
     static const routeName = '/order-details';


  @override
  Widget build(BuildContext context) {
    final product = ProductModel(
      title: 'Solar Panel',
      category: 'Energy',
      price: '25000',
      image: '',
      rating: 6,
      id: '#9876543',
    );

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBarWidget(title: 'Order details'),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const OrderDetailCard(),
          const SizedBox(height: 10),
          OrderDetails(productModel: product),
          const SizedBox(height: 10),
          const DeliveryInformation(),
          const SizedBox(height: 16),
          CustomElevatedButton(
            text: 'Buy Again',
            onPress: () {
              // handle buy again
            },
          ),
          const SizedBox(height: 200),
        ],
      ),
    );
  }
}

class LayOutWidget extends StatefulWidget {
  const LayOutWidget({super.key, required this.title, this.body});

  final String title;
  final Widget? body;

  @override
  State<LayOutWidget> createState() => _LayOutWidgetState();
}

class _LayOutWidgetState extends State<LayOutWidget> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const CartScreen(),
    const OrderScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: widget.title),
      extendBody: true,
      backgroundColor: Colors.grey.shade100,
      body:
          widget.body ??
          IndexedStack(index: _selectedIndex, children: _screens),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(blurRadius: 20, color: Colors.black12)],
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
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                  onPressed: () {
                    // Navigator.pushNamed(context, RouteNames.homePage);
                  },
                ),
                GButton(icon: Icons.shopping_cart_outlined, text: 'Cart'),
                GButton(
                  icon: Icons.notification_important_outlined,
                  text: 'Notifications',
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
