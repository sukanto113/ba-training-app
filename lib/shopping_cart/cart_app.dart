import 'package:ba_training_app/shopping_cart/cart.dart';
import 'package:ba_training_app/shopping_cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartApp extends StatelessWidget {
  const CartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(),
      child: MaterialApp(
        home: ProductPage(),
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Product"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: allProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(allProducts.elementAt(index).name),
            trailing: IconButton(
              onPressed: () {
                BlocProvider.of<CartBloc>(context).add(
                  AddProductToCartEvent(allProducts.elementAt(index)),
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
            ),
          );
        },
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: BlocBuilder<CartBloc, Cart>(
        builder: (context, cart) {
          return ListView.builder(
            itemCount: cart.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(cart.products.elementAt(index).name),
                trailing: IconButton(
                  onPressed: () {
                    BlocProvider.of<CartBloc>(context).add(
                      RemoveProductFromCartEvent(
                        cart.products.elementAt(index),
                      ),
                    );
                  },
                  icon: const Icon(Icons.remove_shopping_cart),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
