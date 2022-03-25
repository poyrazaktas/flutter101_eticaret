import 'package:flutter/material.dart';
import 'package:flutter101_eticaret/repository/cart_repository.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final cart = CartRepository.cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sepetiniz"),
        ),
        body: Center(
            child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      "${cart.values.elementAt(index).first.name}  ${cart.values.elementAt(index).length}",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        "${cart.values.elementAt(index).length * cart.values.elementAt(index).first.price} TL"),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        print("silindi");
                      },
                    ),
                  );
                })));
  }
}
