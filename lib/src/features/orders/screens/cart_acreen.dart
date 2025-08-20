import 'package:al_barq/src/core/components/buttons.dart';
import 'package:al_barq/src/core/components/custom_container.dart';
import 'package:al_barq/src/core/components/layout_widget.dart';
import 'package:al_barq/src/core/constants/assets_strings.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:al_barq/src/features/orders/screens/order_details.dart';
import 'package:al_barq/src/features/products/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  static const routeName = '/cart-screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<ProductModel> products = [
    ProductModel(
      category: 'PANELS',
      title: 'Solar Inverter',
      image: AssetString.inverter,
      rating: 4,
      price: 'RS 8000',
      id: '1',
    ),
    ProductModel(
      category: 'BATTERIES',
      title: 'Lithium Battery',
      image: AssetString.battery,
      rating: 5,
      price: 'RS 12000',
      id: '2',
    ),
    ProductModel(
      category: 'WIRES',
      title: 'Copper Wire',
      image: AssetString.battery1,
      rating: 3.5,
      price: 'RS 2000',
      id: '3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      title: 'My cart',
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: products.length,
            padding: const EdgeInsets.all(2),
            itemBuilder: (context, index) {
              final product = products[index];
              return MyCartCard(productModel: product);
            },
          ),
          SizedBox(height: 10),
          CustomContainer(
            margin: EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Total',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Rs 80000',
                        style: TextStyle(
                          color: MyColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
                Expanded(
                  flex: 2,
                  child: CustomElevatedButton(
                    text: 'Check out',
                    onPress: () {
                      Navigator.pushNamed(
                        context,
                        OrderDetailsScreen.routeName,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyCartCard extends StatelessWidget {
  const MyCartCard({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productModel.title,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SvgPicture.asset(
                      AssetString.delete,
                      height: 20,
                      width: 20,
                      colorFilter: const ColorFilter.mode(
                        Colors.red,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange.shade50,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    productModel.category,
                    // 'PANELS',
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuantityIncrement(),
                    Text(
                      productModel.price,
                      // 'RS 25000',
                      style: const TextStyle(
                        color: MyColors.primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuantityIncrement extends StatefulWidget {
  const QuantityIncrement({super.key});

  @override
  State<QuantityIncrement> createState() => _QuantityIncrementState();
}

class _QuantityIncrementState extends State<QuantityIncrement> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.white,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.remove, size: 14, color: Colors.black),
              onPressed: () {
                setState(() {
                  if (quantity > 1) quantity--;
                });
              },
            ),
          ),
          SizedBox(width: 6),

          Text(
            "$quantity",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),

          SizedBox(width: 6),

          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.white,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.add, size: 14, color: Colors.black),
              onPressed: () {
                setState(() {
                  quantity++;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
