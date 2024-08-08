import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/card.dart';
import '../models/product.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                String productId = cart.items.keys.elementAt(index);
                int quantity = cart.items[productId]!;
                return ListTile(
                  title: Text('Product $productId'),
                  subtitle: Text('Quantity: $quantity'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      cart.removeItem(Product(id: productId, name: 'Product $productId', price: 10.0)); // Placeholder product
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total Price: \$${cart.totalPrice}',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          ),

        ],
      ),
    );
  }
}