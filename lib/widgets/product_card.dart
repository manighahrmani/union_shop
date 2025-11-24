import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({super.key, required this.title, required this.price, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/product'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(imageUrl, fit: BoxFit.cover, errorBuilder: (c,e,s) {
              return Container(color: Colors.grey[300], child: const Center(child: Icon(Icons.image_not_supported, color: Colors.grey)));
            }),
          ),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontSize: 14, color: Colors.black), maxLines: 2),
          const SizedBox(height: 4),
          Text(price, style: const TextStyle(fontSize: 13, color: Colors.grey)),
        ],
      ),
    );
  }
}