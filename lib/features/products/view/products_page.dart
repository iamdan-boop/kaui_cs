import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaui_cs/common/components/bottom_bar.dart';
import 'package:kaui_cs/common/router/app_routes.dart';
import 'package:kaui_cs/features/introduction/components/operation_tile.dart';
import 'package:kaui_cs/gen/assets.gen.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  final _products = [
    {
      'backgroundColor': const Color(0xFFCCCCCC),
      'imagePath': Assets.icons.coffee.path,
      'text': 'COFFEE',
      'route': AppRoutes.productList,
      'params': 'coffee',
    },
    {
      'backgroundColor': const Color(0xFFCCCCCC),
      'imagePath': Assets.icons.dessert.path,
      'text': 'DESSERTS',
      'route': AppRoutes.productList,
      'params': 'desserts',
    }
  ];

  final _otherProduct = [
    {
      'backgroundColor': const Color(0xFFCCCCCC),
      'imagePath': Assets.icons.chocolateCake.path,
      'text': 'Cakes',
      'route': AppRoutes.productList,
      'params': 'cakes',
    },
    {
      'backgroundColor': const Color(0xFFCCCCCC),
      'imagePath': Assets.icons.coffeeBeans.path,
      'text': 'Coffee Beans',
      'route': AppRoutes.productList,
      'params': 'coffee-beans',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 17,
                ),
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
                        color: Colors.brown,
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
              itemCount: _products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => context.pushNamed(
                  _products[index]['route']! as String,
                  pathParameters: {
                    'category': _products[index]['params']! as String,
                  },
                ),
                child: OperationTile(
                  backgroundColor:
                      _products[index]['backgroundColor']! as Color,
                  imagePath: _products[index]['imagePath']! as String,
                  text: _products[index]['text']! as String,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Other products',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: _otherProduct.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => context.pushNamed(
                  _otherProduct[index]['route']! as String,
                  pathParameters: {
                    'category': _otherProduct[index]['params']! as String,
                  },
                ),
                child: OperationTile(
                  backgroundColor:
                  _otherProduct[index]['backgroundColor']! as Color,
                  imagePath: _otherProduct[index]['imagePath']! as String,
                  text: _otherProduct[index]['text']! as String,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
