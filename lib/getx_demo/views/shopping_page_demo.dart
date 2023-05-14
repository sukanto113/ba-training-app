import 'package:ba_training_app/getx_demo/coltrollers/cart_controller.dart';
import 'package:ba_training_app/getx_demo/coltrollers/shopping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                  builder: (controller) {
                    return ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(12),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${controller.products[index].productName}',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                        Text(
                                            '${controller.products[index].productDescription}'),
                                      ],
                                    ),
                                    Text(
                                        '\$${controller.products[index].price}',
                                        style: TextStyle(fontSize: 24)),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    cartController
                                        .addToCart(controller.products[index]);
                                  },
                                  child: const Text('Add to Cart'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
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
