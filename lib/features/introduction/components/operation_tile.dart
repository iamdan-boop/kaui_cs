import 'package:flutter/material.dart';

class OperationTile extends StatelessWidget {
  const OperationTile({
    required Color backgroundColor,
    required String imagePath,
    required String text,
    super.key,
  })  : _backgroundColor = backgroundColor,
        _imagePath = imagePath,
        _text = text;

  final Color _backgroundColor;
  final String _imagePath;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            _imagePath,
            height: 60,
            width: 60,
          ),
        ),
        const SizedBox(height: 3),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                _text,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
