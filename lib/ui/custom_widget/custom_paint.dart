import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final Color color;
  final double cornerRadius;
  final bool isReversed;

  TrianglePainter(this.color, {this.cornerRadius = 5.0, this.isReversed = true});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    if (isReversed) {
      // 绘制反向三角形
      path.moveTo(size.width - cornerRadius, 0); // 起始点稍微向左移动
      path.lineTo(0, size.height / 2); // 顶点
      path.lineTo(size.width - cornerRadius, size.height); // 左下角
      path.quadraticBezierTo(size.width, size.height, size.width, size.height - cornerRadius); // 左下角圆角
      path.lineTo(size.width, cornerRadius); // 左上角
      path.quadraticBezierTo(size.width, 0, size.width - cornerRadius, 0); // 左上角圆角
    } else {
      // 绘制正向三角形
      path.moveTo(cornerRadius, 0); // 起始点稍微向右移动
      path.lineTo(size.width, size.height / 2); // 顶点
      path.lineTo(cornerRadius, size.height); // 右下角
      path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius); // 右下角圆角
      path.lineTo(0, cornerRadius); // 右上角
      path.quadraticBezierTo(0, 0, cornerRadius, 0); // 右上角圆角
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is TrianglePainter &&
           (oldDelegate.color != color ||
            oldDelegate.cornerRadius != cornerRadius ||
            oldDelegate.isReversed != isReversed);
  }
}
