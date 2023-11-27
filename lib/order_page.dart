import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  final String itemName;
  final int quantity;
  final int totalPrice;

  const OrderPage({super.key,
    required this.itemName,
    required this.quantity,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Item: $itemName'),
            Text('Quantity: $quantity kg'),
            Text('Total Price: \$${totalPrice.toString()}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement order placement logic here
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Order Placed'),
                      content: const Text('Your order has been placed successfully.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.popUntil(context, ModalRoute.withName('/'));
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Order Now'),
            ),
          ],
        ),
      ),
    );
  }
}