import 'package:ba_training_app/getx_demo/coltrollers/cart_controller.dart';
import 'package:ba_training_app/getx_demo/coltrollers/shopping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product.dart';

class GetXShoppingPageDemo extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  GetXShoppingPageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: GetX<ShoppingController>(
                  init: ShoppingController(),
                  builder: (controller) {
                    if (controller.products.value != null) {
                      final prodcts = controller.products;

                      return NewWidget(products: prodcts);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              GetX<CartController>(builder: (controller) {
                return Text(
                  "Total amount: \$ ${controller.totalPrice}",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
              const SizedBox(height: 100),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.amber,
          icon: const Icon(
            Icons.add_shopping_cart_rounded,
            color: Colors.black,
          ),
          label: GetX<CartController>(
            init: CartController(),
            builder: (controller) {
              return Text(
                controller.count.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  final cartController = Get.put(CartController());

  NewWidget({
    super.key,
    // required this.cartController,
    required this.products,
  });

  // final CartController cartController;
  final List<Product> products;
  // final cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${products[index].productName}',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text('${products[index].productDescription}'),
                      ],
                    ),
                    Text('${products[index].price}',
                        style: TextStyle(fontSize: 24)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    cartController.addToCart(products[index]);
                  },
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
