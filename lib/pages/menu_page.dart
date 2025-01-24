import 'package:flutter/material.dart';
import 'package:food_menu/widgets/side_menu..dart';
import '../models/menu_item.dart';
import '../models/cart_item.dart';

import '../widgets/menu_item_card.dart';
import 'category_page.dart';
import 'cart_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String _selectedCategory = 'All Menu';
  final List<CartItem> _cart = [];

  final Map<String, List<MenuItem>> _menuItems = {
    'Chapathi': [
      MenuItem(
        id: 'ch1',
        name: 'Plain Chapathi',
        description: 'Soft, whole wheat flatbread.',
        price: 30,
        category: 'Chapathi',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%20(1093)-9dyZMCavH0qo2gieLfvrfT55PXiBo2.png',
      ),
      MenuItem(
        id: 'ch2',
        name: 'Butter Chapathi',
        description: 'Chapathi topped with melted butter.',
        price: 40,
        category: 'Chapathi',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%20(1093)-9dyZMCavH0qo2gieLfvrfT55PXiBo2.png',
      ),
    ],
    'Curry': [
      MenuItem(
        id: 'cu1',
        name: 'Paneer Butter Masala',
        description: 'Creamy curry with paneer cheese cubes.',
        price: 200,
        category: 'Curry',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%20(1093)-9dyZMCavH0qo2gieLfvrfT55PXiBo2.png',
      ),
      MenuItem(
        id: 'cu2',
        name: 'Chicken Tikka Masala',
        description: 'Grilled chicken in a spiced tomato-based sauce.',
        price: 250,
        category: 'Curry',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%20(1093)-9dyZMCavH0qo2gieLfvrfT55PXiBo2.png',
      ),
    ],
    'Starters': [
      MenuItem(
        id: 'st1',
        name: 'Vegetable Samosa',
        description: 'Crispy pastry filled with spiced potatoes and peas.',
        price: 60,
        category: 'Starters',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%20(1093)-9dyZMCavH0qo2gieLfvrfT55PXiBo2.png',
      ),
      MenuItem(
        id: 'st2',
        name: 'Chicken 65',
        description: 'Spicy, deep-fried chicken bites.',
        price: 180,
        category: 'Starters',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%20(1093)-9dyZMCavH0qo2gieLfvrfT55PXiBo2.png',
      ),
    ],
    'Dessert': [
      MenuItem(
        id: 'ds1',
        name: 'Gulab Jamun',
        description: 'Sweet, fried dough balls soaked in sugar syrup.',
        price: 80,
        category: 'Dessert',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%20(1093)-9dyZMCavH0qo2gieLfvrfT55PXiBo2.png',
      ),
      MenuItem(
        id: 'ds2',
        name: 'Rasmalai',
        description: 'Soft paneer balls in sweet, creamy milk.',
        price: 100,
        category: 'Dessert',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%20(1093)-9dyZMCavH0qo2gieLfvrfT55PXiBo2.png',
      ),
    ],
    'Beverages': [
      MenuItem(
        id: 'bv1',
        name: 'Mango Lassi',
        description: 'Creamy yogurt drink with mango flavor.',
        price: 80,
        category: 'Beverages',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%20(1093)-9dyZMCavH0qo2gieLfvrfT55PXiBo2.png',
      ),
      MenuItem(
        id: 'bv2',
        name: 'Masala Chai',
        description: 'Spiced Indian tea with milk.',
        price: 40,
        category: 'Beverages',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%20(1093)-9dyZMCavH0qo2gieLfvrfT55PXiBo2.png',
      ),
    ],
    'Soups': [
      MenuItem(
        id: 'sp1',
        name: 'Veg Soup',
        description: 'A hearty vegetable soup with a mix of fresh, seasonal vegetables.',
        price: 250,
        category: 'Soups',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%20(1093)-9dyZMCavH0qo2gieLfvrfT55PXiBo2.png',
      ),
      MenuItem(
        id: 'sp2',
        name: 'Cream of garlic soup',
        description: 'A rich, creamy soup infused with roasted garlic flavor.',
        price: 200,
        category: 'Soups',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%20(1093)-9dyZMCavH0qo2gieLfvrfT55PXiBo2.png',
      ),
      MenuItem(
        id: 'sp3',
        name: 'Manchow Soup',
        description: 'A spicy and sour soup with vegetables, chicken, and crispy noodles.',
        price: 300,
        category: 'Soups',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%20(1093)-9dyZMCavH0qo2gieLfvrfT55PXiBo2.png',
      ),
    ],
  };

  List<MenuItem> get _allMenuItems {
    return _menuItems.values.expand((items) => items).toList();
  }

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _addToCart(MenuItem item) {
    setState(() {
      final existingItem = _cart.firstWhere(
            (cartItem) => cartItem.item.id == item.id,
        orElse: () => CartItem(item: item, quantity: 0),
      );

      if (existingItem.quantity == 0) {
        _cart.add(existingItem);
      }
      existingItem.quantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayedItems = _selectedCategory == 'All Menu'
        ? _allMenuItems
        : _menuItems[_selectedCategory] ?? [];

    return Scaffold(
      body: Row(
        children: [
          SideMenu(
            selectedCategory: _selectedCategory,
            onSelectCategory: _selectCategory,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: displayedItems.length,
                    itemBuilder: (context, index) {
                      final item = displayedItems[index];
                      return MenuItemCard(
                        item: item,
                        onAddToCart: () => _addToCart(item),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartPage(cart: _cart),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}