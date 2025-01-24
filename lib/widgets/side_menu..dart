import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onSelectCategory;

  const SideMenu({
    super.key,
    required this.selectedCategory,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      'All Menu',
      'Chapathi',
      'Curry',
      'Starters',
      'Dessert',
      'Beverages',
      'Soups',
    ];

    return Container(
      width: MediaQuery.of(context).size.width < 600 ? MediaQuery.of(context).size.width * 0.7 : 250,
      color: Colors.grey[200],
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: categories.map((category) => _buildCategoryTile(category)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTile(String category) {
    final isSelected = category == selectedCategory;
    return ListTile(
      title: Text(
        category,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      tileColor: isSelected ? Colors.yellow : null,
      onTap: () => onSelectCategory(category),
    );
  }
}