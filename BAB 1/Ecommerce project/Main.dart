import 'models/Product.dart';
import 'models/User.dart';
import 'services/ProductService.dart';

void main() async {
  var product1 = Product("Laptop", 1200.0, true);
  var product2 = Product("Smartphone", 800.0, true);
  var product3 = Product("Tablet", 500.0, false);

  Map<String, Product> productMap = {
    product1.productName: product1,
    product2.productName: product2,
    product3.productName: product3,
  };

  var adminUser = AdminUser("Nadia", 21);
  var customerUser = CustomerUser("Asep", 21);

  adminUser.products = [];
  customerUser.products = [product1, product2];

  try {
    adminUser.addProduct(product1);
    adminUser.addProduct(product3);
  } on Exception catch (e) {
    print("Kesalahan: $e");
  }

  adminUser.removeProduct(product1);

  customerUser.viewProducts();

  print("\nMengambil detail produk secara asinkron:");
  Product fetchedProduct = await fetchProductDetails("Headphone", 150.0, true);
  print("Produk yang diambil: ${fetchedProduct.productName} - \$${fetchedProduct.price}");
}