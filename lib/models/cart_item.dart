import 'menu_item.dart';

class CartItem {
  final MenuItem item;
  int quantity;
  String size;
  List<String> toppings;

  CartItem({
    required this.item,
    this.quantity = 1,
    this.size = 'Regular',
    this.toppings = const [],
  });
}