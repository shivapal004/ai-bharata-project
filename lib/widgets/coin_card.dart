import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  final String name;
  final String price;
  final String change;

  const CoinCard({super.key, required this.name, required this.price, required this.change});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(price, style: TextStyle(fontSize: 16)),
        Text(change, style: TextStyle(color: change.startsWith('-') ? Colors.red : Colors.green)),
      ],
    );
  }
}
