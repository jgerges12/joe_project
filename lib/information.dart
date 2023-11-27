import 'package:flutter/material.dart';
import 'cart.dart';

class InformationPage extends StatelessWidget {
  final String itemName;
  final int pricePerKg;
  final String imageAsset;

  const InformationPage({super.key,
    required this.itemName,
    required this.pricePerKg,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageAsset,
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 20),
            Text('Item: $itemName'),
            Text('Price per kg: \$$pricePerKg'),
            const SizedBox(height: 20),
            CartWidget(itemName: itemName, pricePerKg: pricePerKg),
          ],
        ),
      ),
    );
  }
}