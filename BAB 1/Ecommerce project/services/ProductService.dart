import '../models/Product.dart';

Future<Product> fetchProductDetails(String productName, double price, bool inStock) async {
  await Future.delayed(Duration(seconds: 2));
  return Product(productName, price, inStock);
}