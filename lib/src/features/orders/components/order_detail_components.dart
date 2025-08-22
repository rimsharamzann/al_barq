import 'package:al_barq/src/core/components/general_container.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:al_barq/src/features/orders/models/order_model.dart';
import 'package:flutter/material.dart';

class OrderDetailCard extends StatelessWidget {
  const OrderDetailCard({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.width,
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [MyColors.primaryColor, Colors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Details',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 6),
              Text(
                orderModel.id,
                style: context.textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 6),
              Text(
                orderModel.date.toString(),
                style: context.textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: CircleAvatar(
            backgroundColor: Colors.white12,
            radius: 40,
            child: Padding(
              padding: EdgeInsetsGeometry.only(bottom: 28),
              child: Icon(Icons.circle, size: 16, color: Colors.amber),
            ),
          ),
        ),
      ],
    );
  }
}

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      child:
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Items',
            style: context.textTheme.bodyLarge?.copyWith(
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 6),
          Text(
            orderModel.quantity.toString(),
            style: context.textTheme.headlineSmall,
          ),
          SizedBox(height: 6),

          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVQR3IO2qc94kPhg_29KSAyd5wBfZmHxn49A&s',
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderModel.product.name,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                      ),
                    ),

                    SizedBox(height: 10),
                    Text(
                      orderModel.product.category,
                      // 'PANELS',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: MyColors.primaryColor,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'qty : ${orderModel.product.quantity}',
                      style: context.textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            width: context.width,
            child: Divider(
              height: 10,
              color: Colors.grey.shade400,
              thickness: 1.5,
            ),
          ),
          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order Amount', style: context.textTheme.displaySmall),

              Text(
                'Rs ${orderModel.product.quantity! * orderModel.product.price}',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: MyColors.primaryColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DeliveryInformation extends StatelessWidget {
  const DeliveryInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Delivery Information', style: context.textTheme.bodyLarge),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: MyColors.mainColor,
                ),
                child: Icon(
                  Icons.location_on_outlined,
                  color: MyColors.primaryColor,
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Home', style: context.textTheme.bodyLarge),
                  SizedBox(height: 4),
                  Text(
                    'New York, NY 10001',
                    style: context.textTheme.labelSmall,
                  ),
                  SizedBox(height: 6),
                  Text('Ali Haider', style: context.textTheme.labelSmall),
                  SizedBox(height: 6),
                  Text('09876543234567', style: context.textTheme.labelSmall),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
