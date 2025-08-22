import 'package:al_barq/src/core/components/general_container.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:al_barq/src/features/products/models/product_model.dart'
    show ProductModel;
import 'package:flutter/material.dart';

class OrderItemsCard extends StatefulWidget {
  const OrderItemsCard({super.key, required this.products});
  final List<ProductModel> products;

  @override
  State<OrderItemsCard> createState() => _OrderItemsCardState();
}

class _OrderItemsCardState extends State<OrderItemsCard> {
  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Items',
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${widget.products.length} items',
                style: context.textTheme.labelSmall,
              ),
            ],
          ),

          const SizedBox(height: 10),

          // List of order items
          ...List.generate(
            widget.products.length,
            (index) => Column(
              children: [
                _orderDetail(widget.products[index]),
                const SizedBox(height: 12),
                if (index != widget.products.length - 1)
                  Divider(color: Colors.grey.shade400, thickness: 1.5),
                const SizedBox(height: 12),
              ],
            ),
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _orderDetail(ProductModel product) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            product.image,
            // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVQR3IO2qc94kPhg_29KSAyd5wBfZmHxn49A&s',
            fit: BoxFit.cover,
            height: 100,
            width: 100,
          ),
        ),
        const SizedBox(width: 10),

        // Product details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                product.category,
                style: context.textTheme.bodySmall?.copyWith(
                  color: MyColors.primaryColor,

                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rs ${product.price}',
                    style: context.textTheme.bodyMedium,
                  ),
                  Text(
                    'Qty: ${product.quantity ?? 1}',
                    style: context.textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OrderSummary extends StatefulWidget {
  const OrderSummary({super.key});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Summary', style: context.textTheme.bodyLarge),
          SizedBox(height: 6),
          _orderItem('Sub Total', 'Rs 600'),
          SizedBox(height: 6),
          _orderItem('Delivery Fee', 'Rs 20'),
          SizedBox(height: 6),
          _orderItem('Service Fee', 'Rs 100'),
          SizedBox(height: 6),
          _orderItem('Tax', 'Rs 5'),
          SizedBox(height: 6),
          Divider(color: Colors.grey.shade400, thickness: 1.5),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Amount', style: context.textTheme.displaySmall),
              Text(
                'Rs 8000',
                style: context.textTheme.displaySmall?.copyWith(
                  color: MyColors.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _orderItem(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.grey.shade700,
          ),
        ),
        Text(
          value,
          style: context.textTheme.labelMedium?.copyWith(
            color: context.textTheme.bodyLarge?.color,
          ),
        ),
      ],
    );
  }
}
