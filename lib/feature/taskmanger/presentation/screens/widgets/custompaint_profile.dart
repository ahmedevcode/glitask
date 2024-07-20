import 'package:flutter/material.dart';

class CustompaintProfile extends StatelessWidget {
  const CustompaintProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LoginPainterV3(),
      child: Container(),
    );
  }
}

class LoginPainterV3 extends CustomPainter {
  final Color colorTwo = Colors.greenAccent;
  final Color colorFour = Colors.purpleAccent;
  final Color colorFive = Colors.cyan;

  @override
  void paint(Canvas canvas, Size size) {
    final pathOne = Path();
    final paintOne = Paint();

    pathOne.lineTo(0, size.height * 0.6);
    pathOne.quadraticBezierTo(size.width * 0.15, size.height * 0.80,
        size.width * 0.25, size.height * 0.90);
    pathOne.quadraticBezierTo(size.width * 0.40, size.height * 1.05,
        size.width * 0.50, size.height * 0.80);
    pathOne.quadraticBezierTo(size.width * 0.60, size.height * 0.65,
        size.width * 0.75, size.height * 0.85);
    pathOne.quadraticBezierTo(
        size.width * 0.90, size.height, size.width, size.height * 0.70);
    pathOne.lineTo(size.width, 0);
    pathOne.close();

    paintOne.shader = LinearGradient(
      colors: [colorFour.withOpacity(0.8), colorFour],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawShadow(pathOne, Colors.black, 8.0, true);
    canvas.drawPath(pathOne, paintOne);

    final pathTwo = Path();
    final paintTwo = Paint();

    pathTwo.lineTo(0, size.height * 0.45);
    pathTwo.quadraticBezierTo(size.width * 0.10, size.height * 0.65,
        size.width * 0.15, size.height * 0.50);
    pathTwo.quadraticBezierTo(size.width * 0.30, size.height * 0.75,
        size.width * 0.40, size.height * 0.60);
    pathTwo.quadraticBezierTo(size.width * 0.55, size.height * 0.40,
        size.width * 0.70, size.height * 0.65);
    pathTwo.quadraticBezierTo(
        size.width * 0.85, size.height * 0.90, size.width, size.height * 0.55);
    pathTwo.lineTo(size.width, 0);
    pathTwo.close();

    // paintTwo.shader = LinearGradient(
    //   colors: [colorThree.withOpacity(0.8), colorThree],
    //   begin: Alignment.topRight,
    //   end: Alignment.bottomLeft,
    // ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

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
      colors: [colorTwo.withOpacity(0.8), colorTwo],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawShadow(pathThree, Colors.black, 4.0, true);
    canvas.drawPath(pathThree, paintThree);

    final pathFour = Path();
    final paintFour = Paint();

    pathFour.lineTo(0, size.height * 0.75);
    pathFour.quadraticBezierTo(size.width * 0.10, size.height * 0.55,
        size.width * 0.22, size.height * 0.70);
    pathFour.quadraticBezierTo(size.width * 0.30, size.height * 0.90,
        size.width * 0.40, size.height * 0.75);
    pathFour.quadraticBezierTo(size.width * 0.52, size.height * 0.50,
        size.width * 0.65, size.height * 0.70);
    pathFour.quadraticBezierTo(
        size.width * 0.75, size.height * 0.85, size.width, size.height * 0.60);
    pathFour.lineTo(size.width, 0);
    pathFour.close();

    // paintFour.shader = LinearGradient(
    //   colors: [.withOpacity(0.8), colorOne],
    //   begin: Alignment.bottomLeft,
    //   end: Alignment.topRight,
    // ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawShadow(pathFour, Colors.black, 2.0, true);
    canvas.drawPath(pathFour, paintFour);

    final pathFive = Path();
    final paintFive = Paint();

    pathFive.lineTo(0, size.height * 0.85);
    pathFive.quadraticBezierTo(size.width * 0.15, size.height * 0.65,
        size.width * 0.30, size.height * 0.85);
    pathFive.quadraticBezierTo(size.width * 0.45, size.height * 1.05,
        size.width * 0.60, size.height * 0.85);
    pathFive.quadraticBezierTo(size.width * 0.75, size.height * 0.65,
        size.width * 0.85, size.height * 0.85);
    pathFive.quadraticBezierTo(
        size.width * 0.95, size.height, size.width, size.height * 0.85);
    pathFive.lineTo(size.width, 0);
    pathFive.close();

    paintFive.shader = LinearGradient(
      colors: [colorFive.withOpacity(0.8), colorFive],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawShadow(pathFive, Colors.black, 10.0, true);
    canvas.drawPath(pathFive, paintFive);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
