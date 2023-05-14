import 'package:get/get.dart';
import '../models/product.dart';

class CartController extends GetxController {
  var cartItems = List<Product>.empty().obs;
  double get totalPrice => cartItems.fold(
        0,
        (previousValue, element) => previousValue + element.price,
      );

  int get count => cartItems.length;

  void addToCart(Product product) {
    cartItems.add(product);
  }
}
