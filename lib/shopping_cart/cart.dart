class Product {
  String name;
  bool inCart;

  Product({
    required this.name,
    required this.inCart,
  });
}

class Cart {
  List<Product> products = [];
  void addProduct(Product product) {
    products.add(product);
  }

  void removeProduct(Product product) {
    products.remove(product);
  }
}

final allProducts = [
  Product(name: "Product 1", inCart: false),
  Product(name: "Product 2", inCart: false),
  Product(name: "Product 3", inCart: false),
  Product(name: "Product 4", inCart: false),
  Product(name: "Product 5", inCart: false),
];
