import 'package:al_barq/config/route_names.dart';
import 'package:al_barq/src/core/components/layout_widget.dart';
import 'package:al_barq/src/features/about_us/screens/about_us_page.dart';
import 'package:al_barq/src/features/auth/screens/login_screen.dart';
import 'package:al_barq/src/features/auth/screens/sign_up_screen.dart';
import 'package:al_barq/src/features/auth/screens/splash_screen.dart';
import 'package:al_barq/src/features/contact_us/screens/contact_us_screen.dart';
import 'package:al_barq/src/features/landing_page/screens/home_page.dart';
import 'package:al_barq/src/features/orders/screens/cart_acreen.dart';
import 'package:al_barq/src/features/orders/screens/checkout.dart';
import 'package:al_barq/src/features/orders/screens/order_details.dart';
import 'package:al_barq/src/features/orders/screens/order_review.dart';
import 'package:al_barq/src/features/orders/screens/order_screen.dart';
import 'package:al_barq/src/features/products/screens/products_screen.dart';
import 'package:al_barq/src/features/settings/screens/my_wishlist_screen.dart';
import 'package:al_barq/src/features/settings/screens/notification.dart';
import 'package:al_barq/src/features/settings/screens/settings.dart';
import 'package:flutter/material.dart';

import '../src/features/orders/screens/billing_info.dart';
import '../src/features/settings/screens/profile_screen.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case RouteNames.homePage:
        page = const HomePage();
        break;
      case RouteNames.splash:
        page = const SplashScreen();
        break;
      case RouteNames.signup:
        page = const SignUpScreen();
        break;
      case RouteNames.login:
        page = LoginScreen();
        break;
      case RouteNames.productScreen:
        page = const ProductScreen();
        break;
      case RouteNames.orderScreen:
        page = const OrderScreen();
        break;
      case RouteNames.aboutUs:
        page = const AboutUsPage();
        break;
      case RouteNames.contactUs:
        page = const ContactUsScreen();
        break;
      case RouteNames.settings:
        page = const SettingScreen();
        break;
      case RouteNames.wishList:
        page = const MyWishList();
        break;
      case RouteNames.orderDetails:
        page = const OrderDetailsScreen();
        break;
      case RouteNames.orderReview:
        page = const OrderReviewSCreen();
        break;
      case RouteNames.notification:
        page = const NotificationScreen();
        break;
      case RouteNames.myCart:
        page = const CartScreen();
        break;
      case RouteNames.profileScreen:
        page = const ProfileScreen();
        break;
      case RouteNames.checkout:
        page = const CheckoutScreen();
        break;
      case RouteNames.billingInfo:
        page = const BillingInformation();
        break;
      case RouteNames.navbar:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const CustomLayout(),
        );

      default:
        page = const Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '404',
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                Text('Page Not Found'),
              ],
            ),
          ),
        );
    }

    return MaterialPageRoute(
      builder: (_) => page,
      settings: RouteSettings(name: settings.name),
    );
  }
}
