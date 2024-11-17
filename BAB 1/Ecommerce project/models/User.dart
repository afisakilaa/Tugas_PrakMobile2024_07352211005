import 'Product.dart';
import 'Role.dart';

class User {
  String name;
  int age;
  late List<Product> products;
  Role? role;

  User(this.name, this.age, {this.role});
}

class AdminUser extends User {
  AdminUser(String name, int age) : super(name, age, role: Role.Admin);

  void addProduct(Product product) {
    if (product.inStock) {
      Set<Product> productSet = Set.from(products);
      productSet.add(product);
      products = productSet.toList();
      print('Produk ${product.productName} berhasil ditambahkan oleh Admin.');
    } else {
      throw Exception('Produk ${product.productName} sudah tidak tersedia dalam stok.');
    }
  }

  void removeProduct(Product product) {
    products.remove(product);
    print('Produk ${product.productName} berhasil dihapus oleh Admin.');
  }
}

class CustomerUser extends User {
  CustomerUser(String name, int age) : super(name, age, role: Role.Customer);

  void viewProducts() {
    print('Daftar Produk untuk Customer ${this.name}:');
    for (var product in products) {
      print('${product.productName} - \$${product.price}');
    }
  }
}
