import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import 'category_items_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data - replace with your actual data
    final categories = ['Beverages', 'Snacks', 'Desserts', 'Main Course'];
    final items = [
      MenuItem(
        id: '1',
        name: 'Coffee',
        description: 'Hot brewed coffee',
        price: 2.50,
        imageUrl: 'https://example.com/coffee.jpg',
        category: 'Beverages',
      ),
      MenuItem(
        id: '2',
        name: 'Tea',
        description: 'Assorted tea selection',
        price: 2.00,
        imageUrl: 'https://example.com/tea.jpg',
        category: 'Beverages',
      ),
      MenuItem(
        id: '3',
        name: 'French Fries',
        description: 'Crispy french fries',
        price: 3.00,
        imageUrl: 'https://example.com/fries.jpg',
        category: 'Snacks',
      ),
      MenuItem(
        id: '4',
        name: 'Chocolate Cake',
        description: 'Rich chocolate cake',
        price: 5.00,
        imageUrl: 'https://example.com/cake.jpg',
        category: 'Desserts',
      ),
      MenuItem(
        id: '5',
        name: 'Pasta Carbonara',
        description: 'Classic pasta carbonara',
        price: 12.00,
        imageUrl: 'https://example.com/pasta.jpg',
        category: 'Main Course',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final categoryItems = items.where((item) => item.category == category).toList();
          return ListTile(
            title: Text(category),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryItemsPage(
                    category: category,
                    items: categoryItems,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}