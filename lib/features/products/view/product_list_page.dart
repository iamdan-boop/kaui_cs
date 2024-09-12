import 'package:flutter/material.dart';
import 'package:kaui_cs/common/components/bottom_bar.dart';
import 'package:kaui_cs/common/components/custom_app_bar.dart';
import 'package:kaui_cs/data/local/model/coffee.dart';
import 'package:kaui_cs/features/products/components/product_item_card.dart';
import 'package:kaui_cs/gen/assets.gen.dart';
import 'package:kaui_cs/service/coffee_service.dart';

class ProductListPage extends StatefulWidget {
  ProductListPage({
    required String category,
    super.key,
  }) : _category = category;

  final String _category;

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late Future<List<Coffee>> _coffees;

  @override
  void initState() {
    super.initState();
    _coffees = CoffeeService().fetchCoffees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: widget._category,
          color: Colors.brown,
        ),
        bottomNavigationBar: const BottomBar(),
        body: FutureBuilder<List<Coffee>>(
          future: _coffees,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No coffee available'));
            }

            final coffees = snapshot.data!;

            return ListView.builder(
              itemCount: coffees.length,
              itemBuilder: (context, index) {
                final coffee = coffees[index];
                return ProductItemCard(
                  title: coffee.title,
                  amount: coffee.amount.toString(),
                  imagePath: coffee.imagePath,
                );
              },
            );
          },
        ));
  }
}
// Column(
// children: [
// Expanded(
// child: GridView.builder(
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// ),
// itemCount: _coffees.length,
// itemBuilder: (context, index) => GestureDetector(
// onTap: () {},
// child: ProductItemCard(
// title: _coffees[index]['title'] as String,
// imagePath: _coffees[index]['imagePath'] as String,
// amount: _coffees[index]['amount'] as String,
// ),
// ),
// ),
// ),
// ],
// ),
