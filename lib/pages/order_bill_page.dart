import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../widgets/modal_popup.dart';
import 'order_confirmation_page.dart';

class OrderBillPage extends StatelessWidget {
  final List<CartItem> cart;

  const OrderBillPage({
    Key? key,
    required this.cart,
  }) : super(key: key);

  static Future<void> show(BuildContext context, List<CartItem> cart) {
    return showCustomModalBottomSheet(
      context: context,
      width: 450,
      child: OrderBillPage(cart: cart),
    );
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final subtotal = calculateSubtotal();
    final gst = calculateGST(subtotal);
    final total = subtotal + gst;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: const NetworkImage('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/main%20page-ldOva6eu9gMG5wx0VmltfVLchSg2zf.png'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('#219', style: Theme.of(context).textTheme.titleLarge),
                    Text(
                      '${now.month}/${now.day}/${now.year}, ${now.hour}:${now.minute} ${now.hour >= 12 ? "PM" : "AM"}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEB3B),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'T2',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            margin: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bill Summary',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ...cart.map((item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.item.name),
                            Text('x${item.quantity}'),
                          ],
                        ),
                        Text('₹${(item.item.price * item.quantity).toStringAsFixed(2)}'),
                      ],
                    ),
                  )),
                  const Divider(height: 32),
                  buildTotalRow('Item Total', subtotal),
                  buildTotalRow('GST and Restaurant charges', gst),
                  const SizedBox(height: 8),
                  buildTotalRow('Grand Total', total, isGrandTotal: true),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Payment Method',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildPaymentOption(Icons.credit_card, 'Credit Card'),
                    _buildPaymentOption(Icons.account_balance_wallet, 'Wallet'),
                    _buildPaymentOption(Icons.money, 'Cash'),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the OrderBillPage
                      OrderConfirmationPage.show(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFEB3B),
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Confirm Payment',
                      style: TextStyle(
                        fontSize: 16,
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

  Widget buildTotalRow(String label, double amount, {bool isGrandTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (!isGrandTotal)
                Icon(
                  label.contains('GST') ? Icons.receipt : Icons.shopping_bag,
                  size: 16,
                  color: Colors.grey[600],
                ),
              if (!isGrandTotal) const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: isGrandTotal ? 18 : 14,
                  fontWeight: isGrandTotal ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
          Text(
            '₹${amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: isGrandTotal ? 18 : 14,
              fontWeight: isGrandTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }

  double calculateSubtotal() {
    return cart.fold(0.0, (total, item) => total + (item.item.price * item.quantity));
  }

  double calculateGST(double subtotal) {
    return subtotal * 0.18;
  }
}