import 'package:al_barq/src/core/components/buttons.dart';
import 'package:al_barq/src/core/components/general_container.dart';
import 'package:al_barq/src/core/components/nav_bar.dart';
import 'package:al_barq/src/core/constants/assets_strings.dart';
import 'package:al_barq/src/core/constants/constants.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:al_barq/src/features/orders/enums/order_status.dart';
import 'package:al_barq/src/features/orders/models/order_model.dart';
import 'package:al_barq/src/features/orders/screens/order_details.dart';
import 'package:al_barq/src/features/orders/screens/order_review.dart';
import 'package:al_barq/src/features/orders/screens/review_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/my_colors.dart';
import '../../products/models/product_model.dart';

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
                ListView.builder(
                  padding: EdgeInsets.all(myPadding),
                  itemCount: OrderModel.orderData.length,
                  itemBuilder: (context, index) {
                    final order = OrderModel.orderData;
                    return OrderCard(orderModel: order[index]);
                  },
                ),

                GeneralContainer(child: Column()),
                GeneralContainer(child: Column()),
                GeneralContainer(child: Column()),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomElevatedButton(
              text: 'Review',
              onPress: () {
                Navigator.pushNamed(
                  context,
                  ReviewOrderScreen.routeName,
                  // arguments: widget.orderModel.id,
                );
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OrderCard extends StatefulWidget {
  const OrderCard({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          OrderDetailsScreen.routeName,
          arguments: widget.orderModel,
        );
      },
      child: GeneralContainer(
        child: Column(
          children: [
            _orderId(),
            const SizedBox(height: 6),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.calendar_month_sharp, color: Colors.grey.shade600),
                const SizedBox(width: 6),
                Text(
                  _formatDate(widget.orderModel.date),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),

            _orderDetail(widget.orderModel.product),
            const SizedBox(height: 10),

            Divider(height: 10, color: Colors.grey.shade400, thickness: 1.5),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Rs ${widget.orderModel.price.toStringAsFixed(0)}",
                    style: context.textTheme.bodyMedium?.copyWith(fontSize: 17),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Expanded(
                  flex: 2,
                  child: CustomElevatedButton(
                    text: 'Review',
                    onPress: () {
                      Navigator.pushNamed(
                        context,
                        OrderReviewSCreen.routeName,
                        arguments: widget.orderModel,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderDetail(ProductModel productModel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            productModel.image,
            fit: BoxFit.cover,
            height: 100,
            width: 100,
            errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
          ),
        ),
        const SizedBox(width: myPadding / 2),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.name,
                style: context.textTheme.bodyLarge?.copyWith(),
              ),
              const SizedBox(height: 8),
              Text(
                productModel.category,
                style: context.textTheme.bodySmall?.copyWith(
                  color: MyColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Qty: ${productModel.quantity ?? 1}',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _orderId() {
    OrderStatus status = widget.orderModel.status;
    Color statusColor = status.color;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          AssetString.order,
          height: 20,
          width: 20,
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(
            MyColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        Text(
          'Order ID: ${widget.orderModel.id}',
          style: context.textTheme.bodyMedium?.copyWith(
            color: MyColors.primaryColor,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
          decoration: BoxDecoration(
            color: statusColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            status.title,
            style: context.textTheme.bodyLarge?.copyWith(
              color: statusColor,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";
  }
}
