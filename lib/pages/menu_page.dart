import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../models/cart_item.dart';
import '../widgets/menu_item_card.dart';
import 'cart_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String _selectedCategory = 'All Menu';
  List<CartItem> _cart = [];
  bool _isSideMenuOpen = true;

  final Map<String, List<MenuItem>> _menuItems = {
    'Curry': [
      MenuItem(
        id: 'c1',
        name: 'Paneer Masala',
        description: 'A juicy, seasoned patty served with toppings like lettuce, tomato, cheese, and sauces for a smoky, flavorful bite.',
        price: 250,
        category: 'Curry',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/main%20page-ldOva6eu9gMG5wx0VmltfVLchSg2zf.png',
      ),
      MenuItem(
        id: 'c2',
        name: 'Dhal Makhani',
        description: 'A juicy, seasoned patty served with toppings like lettuce, tomato, cheese, and sauces for a smoky, flavorful bite.',
        price: 200,
        category: 'Curry',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/main%20page-ldOva6eu9gMG5wx0VmltfVLchSg2zf.png',
      ),
      MenuItem(
        id: 'c3',
        name: 'Malai Kofta',
        description: 'A juicy, seasoned patty served with toppings like lettuce, tomato, cheese, and sauces for a smoky, flavorful bite.',
        price: 300,
        category: 'Curry',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/main%20page-ldOva6eu9gMG5wx0VmltfVLchSg2zf.png',
      ),
    ],
    'Chapathi': [
      MenuItem(
        id: 'ch1',
        name: 'Plain Chapathi',
        description: 'A juicy, seasoned patty served with toppings like lettuce, tomato, cheese, and sauces for a smoky, flavorful bite.',
        price: 30,
        category: 'Chapathi',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-5-85qNBSfCx7XX1xrmxTqbLQD5aPJEj6.png',
      ),
      MenuItem(
        id: 'ch2',
        name: 'Butter Chapathi',
        description: 'A juicy, seasoned patty served with toppings like lettuce, tomato, cheese, and sauces for a smoky, flavorful bite.',
        price: 40,
        category: 'Chapathi',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-5-85qNBSfCx7XX1xrmxTqbLQD5aPJEj6.png',
      ),
    ],
    'Starters': [
      MenuItem(
        id: 'st1',
        name: 'Vegetable Samosa',
        description: 'A juicy, seasoned patty served with toppings like lettuce, tomato, cheese, and sauces for a smoky, flavorful bite.',
        price: 60,
        category: 'Starters',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-5-85qNBSfCx7XX1xrmxTqbLQD5aPJEj6.png',
      ),
      MenuItem(
        id: 'st2',
        name: 'Chicken 65',
        description: 'A juicy, seasoned patty served with toppings like lettuce, tomato, cheese, and sauces for a smoky, flavorful bite.',
        price: 180,
        category: 'Starters',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-5-85qNBSfCx7XX1xrmxTqbLQD5aPJEj6.png',
      ),
    ],
    'Dessert': [
      MenuItem(
        id: 'ds1',
        name: 'Gulab Jamun',
        description: 'A juicy, seasoned patty served with toppings like lettuce, tomato, cheese, and sauces for a smoky, flavorful bite.',
        price: 80,
        category: 'Dessert',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-5-85qNBSfCx7XX1xrmxTqbLQD5aPJEj6.png',
      ),
      MenuItem(
        id: 'ds2',
        name: 'Rasmalai',
        description: 'A juicy, seasoned patty served with toppings like lettuce, tomato, cheese, and sauces for a smoky, flavorful bite.',
        price: 100,
        category: 'Dessert',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-5-85qNBSfCx7XX1xrmxTqbLQD5aPJEj6.png',
      ),
    ],
    'Beverages': [
      MenuItem(
        id: 'be1',
        name: 'Coca-Cola',
        description: 'A refreshing carbonated soft drink.',
        price: 30,
        category: 'Beverages',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-5-85qNBSfCx7XX1xrmxTqbLQD5aPJEj6.png',
      ),
      MenuItem(
        id: 'be2',
        name: 'Pepsi',
        description: 'A refreshing carbonated soft drink.',
        price: 30,
        category: 'Beverages',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-5-85qNBSfCx7XX1xrmxTqbLQD5aPJEj6.png',
      ),
    ],
    'Soups': [
      MenuItem(
        id: 'so1',
        name: 'Tomato Soup',
        description: 'A classic tomato soup.',
        price: 50,
        category: 'Soups',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-5-85qNBSfCx7XX1xrmxTqbLQD5aPJEj6.png',
      ),
      MenuItem(
        id: 'so2',
        name: 'Chicken Soup',
        description: 'A hearty chicken soup.',
        price: 60,
        category: 'Soups',
        imagePath: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-5-85qNBSfCx7XX1xrmxTqbLQD5aPJEj6.png',
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

  void _toggleSideMenu() {
    setState(() {
      _isSideMenuOpen = !_isSideMenuOpen;
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

    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4), // Light yellow background
      body: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isSmallScreen ? (_isSideMenuOpen ? screenWidth * 0.8 : 0) : 280,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Menu',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _buildCategoryCard('All Menu', '132'),
                      _buildCategoryCard('Chapathi', '25'),
                      _buildCategoryCard('Curry', '30'),
                      _buildCategoryCard('Starters', '59'),
                      _buildCategoryCard('Dessert', '59'),
                      _buildCategoryCard('Beverages', '10'),
                      _buildCategoryCard('Soups', '6'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.white,
                  child: Row(
                    children: [
                      if (!_isSideMenuOpen || isSmallScreen)
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: _toggleSideMenu,
                        ),
                      const Spacer(),
                      Text(
                        '#219',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFEB3B),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          'T2',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isSmallScreen ? 1 : 3,
                      childAspectRatio: 1,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemCount: displayedItems.length,
                    itemBuilder: (context, index) {
                      final item = displayedItems[index];
                      return _buildMenuItemCard(item);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
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
                      backgroundColor: const Color(0xFFFFEB3B),
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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

  Widget _buildCategoryCard(String title, String items) {
    final isSelected = title == _selectedCategory;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFFEB3B) : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => setState(() => _selectedCategory = title),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.black : Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$items items',
                  style: TextStyle(
                    color: isSelected ? Colors.black54 : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItemCard(MenuItem item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.network(
                item.imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹${item.price}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _addToCart(item),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('ADD'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}