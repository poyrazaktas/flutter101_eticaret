import 'package:flutter101_eticaret/models/product.dart';

class ProductRepository {
  static List<Product> getAll() {
    return [
      Product(id: 1, name: "elma", price: 1),
      Product(id: 2, name: "armut", price: 2),
      Product(id: 3, name: "kivi", price: 1),
      Product(id: 4, name: "muz", price: 3),
      Product(id: 5, name: "portakal", price: 2),
      Product(id: 6, name: "incir", price: 5),
    ];
  }
}
