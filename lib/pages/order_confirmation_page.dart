import 'package:flutter/material.dart';
import 'preparing_food_page.dart';

class OrderConfirmationPage extends StatelessWidget {
  const OrderConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              size: const Size(200, 120),
              painter: NotesIllustrationPainter(),
            ),
            const SizedBox(height: 32),
            const Text(
              'Your Order is Confirmed!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const PreparingFoodPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text(
                'Back to Menu',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotesIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange[100]!
      ..style = PaintingStyle.fill;

    // Draw string line
    final linePaint = Paint()
      ..color = Colors.grey[400]!
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(0, size.height * 0.2),
      Offset(size.width, size.height * 0.2),
      linePaint,
    );

    // Draw three hanging notes
    drawNote(canvas, size.width * 0.2, size.height * 0.3, size.width * 0.25, size.height * 0.4, paint);
    drawNote(canvas, size.width * 0.4, size.height * 0.2, size.width * 0.3, size.height * 0.5, paint);
    drawNote(canvas, size.width * 0.7, size.height * 0.25, size.width * 0.25, size.height * 0.4, paint);

    // Draw decorative pencil
    drawPencil(canvas, size.width * 0.8, size.height * 0.7, size.width * 0.3, paint);
  }

  void drawNote(Canvas canvas, double x, double y, double width, double height, Paint paint) {
    final path = Path()
      ..moveTo(x, y)
      ..lineTo(x + width, y)
      ..lineTo(x + width, y + height)
      ..lineTo(x, y + height)
      ..close();

    canvas.drawPath(path, paint);

    // Add lines to represent text
    final linePaint = Paint()
      ..color = Colors.orange[300]!
      ..strokeWidth = 2;

    for (var i = 0; i < 3; i++) {
      canvas.drawLine(
        Offset(x + width * 0.2, y + height * 0.3 + i * height * 0.2),
        Offset(x + width * 0.8, y + height * 0.3 + i * height * 0.2),
        linePaint,
      );
    }
  }

  void drawPencil(Canvas canvas, double x, double y, double length, Paint paint) {
    final pencilPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(x, y)
      ..lineTo(x - length * 0.1, y + length * 0.05)
      ..lineTo(x - length, y + length * 0.05)
      ..lineTo(x - length * 1.1, y)
      ..lineTo(x - length, y - length * 0.05)
      ..lineTo(x - length * 0.1, y - length * 0.05)
      ..close();

    canvas.drawPath(path, pencilPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}