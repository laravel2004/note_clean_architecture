import 'dart:math';

import 'package:flutter/material.dart';

final _lightColor = [
  Colors.amber.shade300,
  Colors.lightBlue.shade300,
  Colors.lightGreen.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100,
];

class CardIdea extends StatelessWidget {
  const CardIdea({super.key, required this.title, required this.publishedAt, required this.index, required this.isImportant});
  final String title;
  final String publishedAt;
  final int index;
  final bool isImportant;

  @override
  Widget build(BuildContext context) {
    var random = Random();
    final minHeight = _getMinHeight(random.nextInt(4));
    final color = _lightColor[random.nextInt(100) % _lightColor.length];

    return  Card(
      color: color,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        constraints: BoxConstraints(minHeight: minHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.category,
            ),
            Text(title),
            const SizedBox(
              height: 30.0,
            ),
            Text(publishedAt),
            const SizedBox(height: 10),
            Text(isImportant ? "Important" : "Not Important"),
          ],
        ),
      ),
    );
  }

  double _getMinHeight(int index) {
    switch(index % 4) {
      case 0:
      case 3:
        return 100;
      case 1:
      case 2:
        return 150;
      default:
        return 100;
    }
  }
}