import 'package:flutter/material.dart';
import 'information.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StoreHomePage(),
    );
  }
}

class StoreHomePage extends StatelessWidget {
  const StoreHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/backg.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          // Content
          ListView(
            children: const [
              StoreItemBox(
                itemName: 'Tomato',
                pricePerKg: 10,
                imageAsset: 'assets/pic1.jpg',
              ),
              StoreItemBox(
                itemName: 'Banane',
                pricePerKg: 20,
                imageAsset: 'assets/pic4.jpg',
              ),
              StoreItemBox(
                itemName: 'Avocado',
                pricePerKg: 30,
                imageAsset: 'assets/pic2.jpg',
              ),
              StoreItemBox(
                itemName: 'Mango',
                pricePerKg: 25,
                imageAsset: 'assets/pic3.jpg',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StoreItemBox extends StatelessWidget {
  final String itemName;
  final int pricePerKg;
  final String imageAsset;

  const StoreItemBox({super.key,
    required this.itemName,
    required this.pricePerKg,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InformationPage(
              itemName: itemName,
              pricePerKg: pricePerKg,
              imageAsset: imageAsset,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              imageAsset,
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 10),
            Text(itemName),
          ],
        ),
      ),
    );
  }
}
