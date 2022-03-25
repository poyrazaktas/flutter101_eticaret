import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter101_eticaret/pages/cart_page.dart';
import 'package:flutter101_eticaret/repository/cart_repository.dart';
import 'package:flutter101_eticaret/repository/product_repository.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final products = ProductRepository.getAll();

  late int numberOfProducs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numberOfProducs = CartRepository.numberOfProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-MANAV"),
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 0, end: 3),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              "$numberOfProducs",
              style: const TextStyle(color: Colors.white),
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
            ),
          )
        ],
      ),
      body: Center(
          child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  title: Text(
                    "${products[index].name} ${products[index].price} TL",
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    if (CartRepository.cart[index] == null) {
                      CartRepository.cart[index] = [];
                      CartRepository.cart[index]!.add(products[index]);
                    } else {
                      CartRepository.cart[index]!.add(products[index]);
                    }

                    setState(() {
                      numberOfProducs = CartRepository.numberOfProducts;
                    });
                  },
                );
              })),
    );
  }
}
