import 'package:flutter/material.dart';

class ZoneCard extends StatelessWidget {
  final String name;
  final String change;

  const ZoneCard({super.key, required this.name, required this.change});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            const Spacer(),
            Text(change, style: TextStyle(color: change.startsWith('-') ? Colors.red : Colors.green)),
          ],
        ),
      ),
    );
  }
}