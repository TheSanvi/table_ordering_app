import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import 'order_confirmation_page.dart';

class OrderBillPage extends StatelessWidget {
  final List<CartItem> cart;

  const OrderBillPage({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final subtotal = calculateSubtotal();
    final gst = calculateGST(subtotal);
    final total = subtotal + gst;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Header
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
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
              const SizedBox(height: 16),

              // Bill card
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Customer info
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/main%20page-ldOva6eu9gMG5wx0VmltfVLchSg2zf.png'),
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
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Bill items
                        const Text(
                          'Bill Summary',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: ListView.builder(
                            itemCount: cart.length,
                            itemBuilder: (context, index) {
                              final item = cart[index];
                              return Padding(
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
                              );
                            },
                          ),
                        ),

                        // Totals
                        const Divider(),
                        buildTotalRow('Item Total', subtotal),
                        buildTotalRow('GST and Restaurant charges', gst),
                        const SizedBox(height: 8),
                        buildTotalRow('Grand Total', total, isGrandTotal: true),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Confirm button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrderConfirmationPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFEB3B),
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
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

  double calculateSubtotal() {
    return cart.fold(0.0, (total, item) => total + (item.item.price * item.quantity));
  }

  double calculateGST(double subtotal) {
    return subtotal * 0.18;
  }
}