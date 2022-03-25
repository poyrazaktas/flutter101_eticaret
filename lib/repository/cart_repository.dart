import 'package:flutter101_eticaret/models/product.dart';

class CartRepository {
  
  static Map<int, List<Product>> cart={};

  static final CartRepository _cartRepository =  CartRepository._internal();

  static int get numberOfProducts {

    if(cart.isEmpty){
      return 0;
    }

    int counter = 0;

    for (var productList in cart.values) {
      counter  +=  productList.length;
    }

    return counter;

  }

  factory CartRepository(){
    return _cartRepository;
  }

  CartRepository._internal();


}