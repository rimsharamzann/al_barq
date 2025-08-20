import 'package:al_barq/src/core/components/custom_container.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:al_barq/src/features/products/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/assets_strings.dart';

class OrderDetailCard extends StatelessWidget {
  const OrderDetailCard({super.key});

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
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 6),
              // TODO : actual order Id
              Text(
                '#09865432',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Tuesday June 25, 2025',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
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
  const OrderDetails({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Items',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 6),
          Text(
            '1 item',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 6),

          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    AssetString.inverter,
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
                      productModel.title,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),
                    Text(
                      productModel.category,
                      // 'PANELS',
                      style: const TextStyle(
                        color: MyColors.primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'qty : 1',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
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
              Text(
                'Order Amount',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),

              Text(
                'Rs ${productModel.price}',
                style: const TextStyle(
                  color: MyColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Information',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
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
                  Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'New York, NY 10001',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Ali Haider',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '09876543234567',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
