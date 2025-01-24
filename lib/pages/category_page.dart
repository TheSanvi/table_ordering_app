import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../widgets/menu_item_card.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  final List<MenuItem> items;
  final Function(MenuItem) onAddToCart;

  const CategoryPage({
    super.key,
    required this.category,
    required this.items,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Colors.yellow,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return MenuItemCard(
            item: item,
            onAddToCart: () => onAddToCart(item),
          );
        },
      ),
    );
  }
}