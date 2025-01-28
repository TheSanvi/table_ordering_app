import 'package:flutter/material.dart';
import '../widgets/modal_popup.dart';

class OrderConfirmationPage extends StatelessWidget {
  const OrderConfirmationPage({super.key});

  static Future<void> show(BuildContext context) {
    return showCustomModalBottomSheet(
      context: context,
      width: 350,
      child: const OrderConfirmationPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/order%20confrimation%20page-L1MZHJBOz8stjUWi7KIiPKbbFjDb7C.png',
            height: 120,
          ),
          const SizedBox(height: 24),
          const Text(
            'Your Order is Confirmed!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFEB3B),
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Done',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}