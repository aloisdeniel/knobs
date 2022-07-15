import 'package:flutter/widgets.dart';

class KnobsIcon extends StatelessWidget {
  const KnobsIcon(
    this.data, {
    super.key,
    this.color,
  });

  final KnobsIconData data;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: CustomPaint(
        size: const Size(24, 24),
        painter: _IconPainter(
          data.path,
          color ?? const Color(0xFF000000),
        ),
      ),
    );
  }
}

class KnobsIconData {
  static final check = KnobsIconData._(
    Path()
      ..moveTo(20, 6)
      ..lineTo(9, 17)
      ..lineTo(4, 12),
  );

  static final cross = KnobsIconData._(
    Path()
      ..moveTo(18, 6)
      ..lineTo(6, 18)
      ..moveTo(6, 6)
      ..lineTo(18, 18),
  );

  static final doc = KnobsIconData._(
    Path()
      ..moveTo(14, 2)
      ..lineTo(6, 2)
      ..cubicTo(5.46957, 2, 4.96086, 2.21071, 4.58579, 2.58579)
      ..cubicTo(4.21071, 2.96086, 4, 3.46957, 4, 4)
      ..lineTo(4, 20)
      ..cubicTo(4, 20.5304, 4.21071, 21.0391, 4.58579, 21.4142)
      ..cubicTo(4.96086, 21.7893, 5.46957, 22, 6, 22)
      ..lineTo(18, 22)
      ..cubicTo(18.5304, 22, 19.0391, 21.7893, 19.4142, 21.4142)
      ..cubicTo(19.7893, 21.0391, 20, 20.5304, 20, 20)
      ..lineTo(20, 8)
      ..lineTo(14, 2)
      ..close()
      ..moveTo(14, 2)
      ..lineTo(14, 8)
      ..lineTo(20, 8)
      ..moveTo(16, 13)
      ..lineTo(8, 13)
      ..moveTo(16, 17)
      ..lineTo(8, 17)
      ..moveTo(10, 9)
      ..lineTo(9, 9)
      ..lineTo(8, 9),
  );

  static final back = KnobsIconData._(
    Path()
      ..moveTo(19, 12)
      ..lineTo(5, 12)
      ..moveTo(12, 19)
      ..lineTo(5, 12)
      ..lineTo(12, 5),
  );

  static final chevronDown = KnobsIconData._(
    Path()
      ..moveTo(6.03529, 9.75942)
      ..lineTo(12.0353, 15.7594)
      ..lineTo(18.0353, 9.75942),
  );

  const KnobsIconData._(this.path);
  final Path path;
}

class _IconPainter extends CustomPainter {
  const _IconPainter(
    this.path,
    this.color,
  );
  final Color color;
  final Path path;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint.color = color;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _IconPainter oldDelegate) {
    return color != oldDelegate.color || path != oldDelegate.path;
  }
}
