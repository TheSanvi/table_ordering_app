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
      {'name': 'All Menu', 'items': 132},
      {'name': 'Chapathi', 'items': 25},
      {'name': 'Curry', 'items': 30},
      {'name': 'Starters', 'items': 59},
      {'name': 'Dessert', 'items': 59},
      {'name': 'Beverages', 'items': 45},
      {'name': 'Soups', 'items': 35},
    ];

    return Container(
      width: MediaQuery.of(context).size.width < 600 ? MediaQuery.of(context).size.width * 0.7 : 250,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: categories.map((category) => _buildCategoryCard(category)).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, dynamic> category) {
    final isSelected = category['name'] == selectedCategory;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () => onSelectCategory(category['name']),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.yellow[100] : Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category['name'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${category['items']} items',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}