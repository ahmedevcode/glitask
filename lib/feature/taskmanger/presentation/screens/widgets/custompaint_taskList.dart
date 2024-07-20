import 'package:flutter/material.dart';

class TopBartask extends StatelessWidget {
  const TopBartask({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: Loginpainter(),
      child: Container(),
    );
  }
}

class Loginpainter extends CustomPainter {
  final Color colorOne = Colors.cyan;
  final Color colorTwo = Colors.greenAccent;
  final Color colorThree = Colors.blueAccent;

  @override
  void paint(Canvas canvas, Size size) {
    final pathOne = Path();
    final paintOne = Paint();

    pathOne.lineTo(0, size.height * 0.5);
    pathOne.quadraticBezierTo(size.width * 0.10, size.height * 0.70,
        size.width * 0.17, size.height * 0.90);
    pathOne.quadraticBezierTo(
        size.width * 0.20, size.height, size.width * 0.25, size.height * 0.90);
    pathOne.quadraticBezierTo(size.width * 0.40, size.height * 0.40,
        size.width * 0.50, size.height * 0.70);
    pathOne.quadraticBezierTo(size.width * 0.60, size.height * 0.85,
        size.width * 0.65, size.height * 0.65);
    pathOne.quadraticBezierTo(
        size.width * 0.70, size.height * 0.90, size.width, 0);
    pathOne.close();

    paintOne.shader = LinearGradient(
      colors: [colorThree.withOpacity(0.8), colorThree],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawShadow(pathOne, Colors.black, 8.0, true);
    canvas.drawPath(pathOne, paintOne);

    final pathTwo = Path();
    final paintTwo = Paint();

    pathTwo.lineTo(0, size.height * 0.50);
    pathTwo.quadraticBezierTo(size.width * 0.10, size.height * 0.80,
        size.width * 0.15, size.height * 0.60);
    pathTwo.quadraticBezierTo(size.width * 0.20, size.height * 0.45,
        size.width * 0.27, size.height * 0.60);
    pathTwo.quadraticBezierTo(
        size.width * 0.45, size.height, size.width * 0.50, size.height * 0.80);
    pathTwo.quadraticBezierTo(size.width * 0.55, size.height * 0.45,
        size.width * 0.75, size.height * 0.75);
    pathTwo.quadraticBezierTo(
        size.width * 0.85, size.height * 0.93, size.width, size.height * 0.60);
    pathTwo.lineTo(size.width, 0);
    pathTwo.close();

    paintTwo.shader = LinearGradient(
      colors: [colorTwo.withOpacity(0.8), colorTwo],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawShadow(pathTwo, Colors.black, 6.0, true);
    canvas.drawPath(pathTwo, paintTwo);

    final pathThree = Path();
    final paintThree = Paint();

    pathThree.lineTo(0, size.height * 0.75);
    pathThree.quadraticBezierTo(size.width * 0.10, size.height * 0.55,
        size.width * 0.22, size.height * 0.70);
    pathThree.quadraticBezierTo(size.width * 0.30, size.height * 0.90,
        size.width * 0.40, size.height * 0.75);
    pathThree.quadraticBezierTo(size.width * 0.52, size.height * 0.50,
        size.width * 0.65, size.height * 0.70);
    pathThree.quadraticBezierTo(
        size.width * 0.75, size.height * 0.85, size.width, size.height * 0.60);
    pathThree.lineTo(size.width, 0);
    pathThree.close();

    paintThree.shader = LinearGradient(
      colors: [colorOne.withOpacity(0.8), colorOne],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ).createShader(Rect.fromLTWH(0, 0, size.width * .02, size.height * .5));

    canvas.drawShadow(pathThree, Colors.black, 4.0, true);
    canvas.drawPath(pathThree, paintThree);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
