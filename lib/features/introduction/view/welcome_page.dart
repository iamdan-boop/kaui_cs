import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kaui_cs/features/introduction/components/operation_tile.dart';
import 'package:kaui_cs/gen/assets.gen.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  final _products = [
    {
      'backgroundColor': const Color(0x0ffccccc),
      'imagePath': Assets.icons.coffee,
      'text': 'COFFEE',
      'route': '',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good morning,',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                    const Text(
                      'Start morning with great coffee',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Popular coffee's and desserts.",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {},
                // child: OperationTile(
                //   backgroundColor:
                //       _products[index]['backgroundColor']! as Color,
                //   imagePath: _products[index]['imagePath']! as String,
                //   text: _products[index]['text']! as String,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
