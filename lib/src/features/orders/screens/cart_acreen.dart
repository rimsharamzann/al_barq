import 'package:al_barq/config/theme_data.dart';
import 'package:al_barq/src/core/components/buttons.dart';
import 'package:al_barq/src/core/components/general_container.dart';
import 'package:al_barq/src/core/components/nav_bar.dart';
import 'package:al_barq/src/core/constants/assets_strings.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:al_barq/src/features/orders/screens/checkout.dart';
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
      name: 'Solar Inverter',

      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVQR3IO2qc94kPhg_29KSAyd5wBfZmHxn49A&s',
      rating: 4,
      price: 8000,
      id: '1',
      description: '',
    ),
    ProductModel(
      description: '',
      category: 'BATTERIES',
      name: 'Lithium Battery',
      image:
          'https://plus.unsplash.com/premium_photo-1683120793196-0797cec08a7d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bGl0aGl1bSUyMGJhdHRlcnl8ZW58MHx8MHx8fDA%3D',
      rating: 5,
      price: 8000,
      id: '2',
    ),
    ProductModel(
      category: 'WIRES',
      name: 'Copper Wire',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXyezadvS7VY-FHOzHFSKliyeftUiF0FxOdQ&s',
      rating: 3.5,
      description: '',
      price: 8000,
      id: '3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Cart'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: myPadding / 2),

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
          GeneralContainer(
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
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Rs 80000',
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: MyColors.primaryColor,
                          fontSize: 16,
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
                      Navigator.pushNamed(context, CheckoutScreen.routeName);
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
    return GeneralContainer(
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                productModel.image,
                // AssetString.inverter,
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
                      productModel.name,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
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
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.deepOrange,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuantityIncrement(),
                    Text(
                      productModel.price.toString(),
                      // 'RS 25000',
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: MyColors.primaryColor,
                        fontSize: 12,
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
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
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
