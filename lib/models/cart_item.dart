import 'menu_item.dart';

class CartItem {
  final MenuItem item;
  int quantity;

  CartItem({required this.item, this.quantity = 1});

  int get total => (item.price * quantity).round(); // Cast to integer.
}
