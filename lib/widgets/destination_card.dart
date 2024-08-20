import 'package:flutter/material.dart';
import '../utils/image_loader.dart';

class DestinationCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  const DestinationCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 16),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: loadImage(imageUrl),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(price),
          ],
        ),
      ),
    );
  }
}
