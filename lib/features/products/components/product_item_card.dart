import 'package:flutter/material.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    required String title,
    required String amount,
    required String imagePath,
    super.key,
  })  : _title = title,
        _amount = amount,
        _imagePath = imagePath;

  final String _title;
  final String _amount;
  final String _imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(Radius.circular(13)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                _imagePath,
                height: 110,
                width: 110,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.brown[700],
              ),
            ),
            Text(
              'PHP $_amount',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
