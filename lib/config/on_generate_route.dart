import 'package:al_barq/src/core/components/nav_bar.dart';
import 'package:al_barq/src/features/auth/screens/login_screen.dart';
import 'package:al_barq/src/features/auth/screens/sign_up_screen.dart';
import 'package:al_barq/src/features/auth/screens/splash_screen.dart';
import 'package:al_barq/src/features/auth/screens/verify_email.dart';
import 'package:al_barq/src/features/home/screens/home_page.dart';
import 'package:al_barq/src/features/orders/screens/cart_acreen.dart';
import 'package:al_barq/src/features/orders/screens/checkout.dart';
import 'package:al_barq/src/features/orders/screens/order_details.dart';
import 'package:al_barq/src/features/orders/screens/order_review.dart';
import 'package:al_barq/src/features/orders/screens/order_screen.dart';
import 'package:al_barq/src/features/orders/screens/review_order.dart';
import 'package:al_barq/src/features/products/screens/product_details.dart';
import 'package:al_barq/src/features/products/screens/products_screen.dart';
import 'package:al_barq/src/features/settings/screens/my_wishlist_screen.dart';
import 'package:al_barq/src/features/settings/screens/notification.dart';
import 'package:al_barq/src/features/settings/screens/settings.dart';
import 'package:flutter/material.dart';

import '../src/features/orders/screens/billing_info.dart';
import '../src/features/settings/screens/profile_screen.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomePage(),
        );
      case SignUpScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SignUpScreen(),
        );
      case SplashScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SplashScreen(),
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const LoginScreen(),
        );

      case ProductScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ProductScreen(),
        );
   
      case ProductDetails.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ProductDetails(),
        );
      case OrderScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const OrderScreen(),
        );
      case OrderDetailsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const OrderDetailsScreen(),
        );
      case OrderReviewSCreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const OrderReviewSCreen(),
        );
      case MyWishList.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const MyWishList(),
        );
      case SettingScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SettingScreen(),
        );
      case NotificationScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const NotificationScreen(),
        );
      case CartScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const CartScreen(),
        );
      case ProfileScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ProfileScreen(),
        );
      case ReviewOrderScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ReviewOrderScreen(),
        );
      case BillingInformation.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const BillingInformation(),
        );
      case CheckoutScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const CheckoutScreen(),
        );
      case VerifyEmailScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const VerifyEmailScreen(),
        );

      case Navbar.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const Navbar(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => NotFoundRoute(),
          settings: settings,
        );
    }
  }
}

class NotFoundRoute extends StatelessWidget {
  const NotFoundRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
}
