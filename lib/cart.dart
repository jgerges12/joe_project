import 'package:flutter/material.dart';
import 'order_page.dart';

class CartWidget extends StatefulWidget {
  final String itemName;
  final int pricePerKg;

  const CartWidget({super.key,
    required this.itemName,
    required this.pricePerKg,
  });

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('Enter quantity (kg): '),
            SizedBox(
              width: 50,
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    quantity = int.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text('Total Price: \$${quantity * widget.pricePerKg}'),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderPage(
                  itemName: widget.itemName,
                  quantity: quantity,
                  totalPrice: quantity * widget.pricePerKg,
                ),
              ),
            );
          },
          child: const Text('Add to Cart'),
        ),
      ],
    );
  }
}