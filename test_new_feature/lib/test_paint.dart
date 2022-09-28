import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class TestPaint extends StatefulWidget {
  const TestPaint({Key? key}) : super(key: key);

  @override
  State<TestPaint> createState() => _TestPaintState();
}

class Point {
  final double dx;
  final double dy;

  const Point({
    required this.dx,
    required this.dy,
  });
}

class _TestPaintState extends State<TestPaint> {
  final points = [
    Point(dx: 50, dy: 300),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
    Point(dx: 0, dy: 0),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 400,
            width: 400,
            child: Stack(
              children: [
                CustomPaint(
                  painter: RectPainter(),
                ),
                ...List.generate(
                  points.length,
                  (i) {
                    final p = points[i];
                    final dx = p.dx;
                    final dy = p.dy;
                    return CustomPaint(
                      painter: PointPainter(dx: dx, dy: dy),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          TextButton(
            onPressed: startRun,
            child: const Text('Start Run'),
          ),
          const SizedBox(height: 32),
          TextButton(
            onPressed: resetRun,
            child: const Text('Reset Run'),
          ),
        ],
      ),
    );
  }

  void startRun() {
    // runs every 1 second
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        // copy left to right by 1
        for (int i = points.length - 1; i > 0; i--) {
          final prevPoint = points[i - 1];
          if (prevPoint.dx != 0) {
            points[i] = Point(
              dx: prevPoint.dx + 10,
              dy: prevPoint.dy,
            );
          }
        }

        final random = Random();
        // insert new position into first
        points[0] = Point(
          dx: points[1].dx - 10,
          dy: points[1].dy - random.nextInt(20),
        );
      });
    });
  }

  void resetRun() {
    // runs every 1 second
  }
}

class RectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rectPaint = Paint()
      ..color = const Color(0xff995588)
      ..style = PaintingStyle.fill;

    canvas.drawRect(const Offset(50, 50) & const Size(300, 300), rectPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class PointPainter extends CustomPainter {
  final double dx;
  final double dy;

  const PointPainter({
    required this.dx,
    required this.dy,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var pointPaint = Paint()
      ..color = const Color(0xff000000)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(dx, dy), 5, pointPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
