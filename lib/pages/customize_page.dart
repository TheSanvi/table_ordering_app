import 'package:flutter/material.dart';
import '../widgets/modal_popup.dart';
import '../models/menu_item.dart';
import '../models/cart_item.dart';
import 'order_details_page.dart';

class CustomizePage extends StatefulWidget {
  final MenuItem item;
  final List<CartItem> cart;

  const CustomizePage({
    Key? key,
    required this.item,
    required this.cart,
  }) : super(key: key);

  static Future<void> show(BuildContext context, {required MenuItem item, required List<CartItem> cart}) {
    return showCustomModalBottomSheet(
      context: context,
      child: CustomizePage(item: item, cart: cart),
    );
  }

  @override
  _CustomizePageState createState() => _CustomizePageState();
}

class _CustomizePageState extends State<CustomizePage> {
  int quantity = 1;
  String selectedSize = 'Regular';
  List<String> selectedToppings = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.item.imageUrl,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                widget.item.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildQuantitySelector(),
                  const SizedBox(height: 16),
                  _buildSizeSelector(),
                  const SizedBox(height: 16),
                  _buildToppingsSelector(),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              final customizedItem = CartItem(
                item: widget.item,
                quantity: quantity,
                size: selectedSize,
                toppings: selectedToppings,
              );
              final updatedCart = List<CartItem>.from(widget.cart)..add(customizedItem);
              Navigator.of(context).pop(); // Close the CustomizePage
              OrderDetailsPage.show(context, updatedCart);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFEB3B),
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Add to Order',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Quantity', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                if (quantity > 1) {
                  setState(() => quantity--);
                }
              },
            ),
            Text('$quantity'),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() => quantity++);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Size', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: ['Regular', 'Large', 'Extra Large'].map((size) {
            return ChoiceChip(
              label: Text(size),
              selected: selectedSize == size,
              onSelected: (selected) {
                setState(() => selectedSize = size);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildToppingsSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Toppings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: ['Cheese', 'Onions', 'Tomatoes', 'Olives'].map((topping) {
            return FilterChip(
              label: Text(topping),
              selected: selectedToppings.contains(topping),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedToppings.add(topping);
                  } else {
                    selectedToppings.remove(topping);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}