import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import 'customize_page.dart';

class CategoryItemsPage extends StatelessWidget {
  final String category;
  final List<MenuItem> items;

  const CategoryItemsPage({
    Key? key,
    required this.category,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            leading: Image.network(item.imageUrl, width: 60, height: 60, fit: BoxFit.cover),
            title: Text(item.name),
            subtitle: Text('₹${item.price.toStringAsFixed(2)}'),
            trailing: ElevatedButton(
              onPressed: () {
                CustomizePage.show(context, item: item, cart: []);
              },
              child: const Text('Add'),
            ),
          );
        },
      ),
    );
  }
}