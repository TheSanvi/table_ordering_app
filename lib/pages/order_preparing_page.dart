import 'package:flutter/material.dart';
import '../widgets/modal_popup.dart';

class OrderPreparingPage extends StatelessWidget {
  const OrderPreparingPage({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) {
    return showCustomModalBottomSheet(
      context: context,
      width: 350,
      child: const OrderPreparingPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFEB3B)),
          ),
          const SizedBox(height: 24),
          const Text(
            'Preparing Your Order',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Our chefs are working hard to prepare your delicious meal. It won\'t be long!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the OrderPreparingPage
                // Here you would typically navigate back to the main menu or a order history page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFEB3B),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Back to Main Menu',
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
    );
  }
}