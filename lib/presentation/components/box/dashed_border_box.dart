import 'dart:ui';

import 'package:flutter/material.dart';

class DashedBorderBox extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Color? color;

  const DashedBorderBox({
    super.key,
    required this.child,
    this.borderRadius = 8.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(borderRadius, color ?? Colors.black),
      child: child,
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final double borderRadius;
  final Color color;

  DashedBorderPainter(this.borderRadius, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color // Warna garis
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const double dashWidth = 4.0; // Panjang garis putus
    const double dashSpace = 4.0; // Jarak antar garis putus

    // Membuat Path untuk border rounded rectangle
    final Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(borderRadius),
        ),
      );

    // Menggambar garis putus-putus di sepanjang path
    _drawDashedLine(canvas, paint, path, dashWidth, dashSpace);
  }

  // Fungsi untuk menggambar garis putus-putus di sepanjang suatu path
  void _drawDashedLine(
    Canvas canvas,
    Paint paint,
    Path path,
    double dashWidth,
    double dashSpace,
  ) {
    final PathMetrics pathMetrics = path.computeMetrics();
    for (final PathMetric pathMetric in pathMetrics) {
      double distance = 0;
      while (distance < pathMetric.length) {
        final tangent = pathMetric.getTangentForOffset(distance);
        final start = tangent!.position;
        final end = pathMetric.getTangentForOffset(distance + dashWidth)!.position;
        canvas.drawLine(start, end, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
