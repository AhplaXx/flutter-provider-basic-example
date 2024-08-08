import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_1/models/card.dart';
import 'package:provider_1/pages/card_page.dart';

import '../models/product.dart';


class ProductlistPage extends StatelessWidget {
  ProductlistPage({super.key});

  final List<Product> products = [
    Product(id: '1', name: 'Product 1', price: 10.0),
    Product(id: '2', name: 'Product 2', price: 20.0),
    Product(id: '3', name: 'Product 3', price: 30.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price}'),
            trailing: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white),
                foregroundColor: WidgetStatePropertyAll(Colors.black),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
              ),
              onPressed: () {
                Provider.of<Cart>(context, listen: false).addItem(
                    products[index]);
              },
              child: Text('Add to Cart'),
            ),
          );
        },
        
      ),

    );
  }
}
