import 'package:al_barq/src/core/components/buttons.dart';
import 'package:al_barq/src/core/components/custom_container.dart';
import 'package:al_barq/src/core/components/layout_widget.dart';
import 'package:al_barq/src/core/constants/assets_strings.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:al_barq/src/features/orders/screens/order_details.dart';
import 'package:al_barq/src/features/orders/screens/review_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/my_colors.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  static const routeName = '/order-screen';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBarWidget(title: 'Orders'),
      body: Column(
        children: [
          DefaultTabController(
            length: 4,
            child: Container(
              height: 40,
              padding: EdgeInsets.all(4),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white70,
                ),
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  controller: controller,
                  tabs: const [
                    Tab(text: 'All'),
                    Tab(text: 'Confirmed'),
                    Tab(text: 'Processing'),
                    Tab(text: 'Shipping'),
                  ],
                  labelStyle: context.textTheme.bodyMedium,
                  labelColor: Colors.white,
                  indicatorColor: Colors.white,
                  indicatorAnimation: TabIndicatorAnimation.linear,
                  unselectedLabelColor: Colors.grey.shade700,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: MyColors.primaryColor,
                  ),
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                ListView(
                  children: [...List.generate(3, (index) => OrderCard())],
                ),

                CustomContainer(child: Column()),
                CustomContainer(child: Column()),
                CustomContainer(child: Column()),
              ],
            ),
          ),

          CustomElevatedButton(
            text: 'Review',
            onPress: () {
              Navigator.pushNamed(context, ReviewOrderScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

class OrderCard extends StatefulWidget {
  const OrderCard({super.key});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          _orderId(),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.calendar_month_sharp, color: Colors.grey.shade600),
              SizedBox(width: 6),
              Text(
                'June 24, 2025',
                style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
              ),
            ],
          ),
          SizedBox(height: 6),
          _orderDetail(),
          SizedBox(height: 10),

          Divider(height: 10, color: Colors.grey.shade400, thickness: 1.5),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Rs 8000',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Expanded(
                flex: 2,
                child: CustomElevatedButton(
                  text: 'Check out',
                  onPress: () {
                    Navigator.pushNamed(context, OrderDetailsScreen.routeName);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _orderDetail() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            AssetString.inverter,
            fit: BoxFit.cover,
            height: 100,
            width: 100,
          ),
        ),
        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Solar inverter 200W',
                // productModel.title,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'PANEL',
                style: const TextStyle(
                  color: MyColors.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              Text(
                'Qty: 1',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _orderId() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          AssetString.order,
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(
            MyColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        Text(
          'Order ID: 47754478',
          style: TextStyle(color: MyColors.primaryColor, fontSize: 14),
        ),
        Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
          decoration: BoxDecoration(
            color: Colors.deepOrange.shade50,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            'processing',
            style: const TextStyle(
              color: Colors.deepOrange,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
