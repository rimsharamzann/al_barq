import 'package:al_barq/config/theme_data.dart';
import 'package:al_barq/src/features/orders/models/order_model.dart';
import 'package:flutter/material.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/nav_bar.dart';
import '../components/order_detail_components.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});
  static const routeName = '/order-details';

  @override
  Widget build(BuildContext context) {
    final order = ModalRoute.of(context)!.settings.arguments as OrderModel;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBarWidget(title: 'Order details'),
      body: ListView(
        padding: const EdgeInsets.all(myPadding / 1.4),
        children: [
          OrderDetailCard(orderModel: order),
          const SizedBox(height: myPadding / 2),
          OrderDetails(orderModel: order),
          const SizedBox(height: myPadding / 2),
          const DeliveryInformation(),
          const SizedBox(height: myPadding * 6),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: myPadding/2),
          child: CustomElevatedButton(text: 'Buy Again', onPress: () {}),
        ),
      ),
      extendBody: true,
    );
  }
}
