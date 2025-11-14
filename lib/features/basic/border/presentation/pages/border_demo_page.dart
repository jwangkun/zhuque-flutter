import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';

/// 边框演示组件
class BorderDemoPage extends StatelessWidget {
  const BorderDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('边框'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, '边框样式'),
            const SizedBox(height: 16),
            _buildBorderStyles(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '边框宽度'),
            const SizedBox(height: 16),
            _buildBorderWidths(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '圆角设置'),
            const SizedBox(height: 16),
            _buildBorderRadius(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '边框颜色'),
            const SizedBox(height: 16),
            _buildBorderColors(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '虚线边框'),
            const SizedBox(height: 16),
            _buildDashedBorders(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '组合边框'),
            const SizedBox(height: 16),
            _buildCombinedBorders(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
    );
  }

  Widget _buildBorderStyles(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('实线边框'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBorderBox('单边框', Border.all(color: Colors.grey, width: 1)),
            _buildBorderBox('双边框', Border.all(color: Colors.grey, width: 2)),
            _buildBorderBox('粗边框', Border.all(color: Colors.grey, width: 3)),
          ],
        ),
        const SizedBox(height: 16),
        const Text('不同边'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBorderBox('上边框', Border(top: BorderSide(color: Colors.grey, width: 2))),
            _buildBorderBox('下边框', Border(bottom: BorderSide(color: Colors.grey, width: 2))),
            _buildBorderBox('左边框', Border(left: BorderSide(color: Colors.grey, width: 2))),
            _buildBorderBox('右边框', Border(right: BorderSide(color: Colors.grey, width: 2))),
          ],
        ),
      ],
    );
  }

  Widget _buildBorderWidths(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('边框粗细'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBorderBox('1px', Border.all(color: Colors.grey, width: 1)),
            _buildBorderBox('2px', Border.all(color: Colors.grey, width: 2)),
            _buildBorderBox('3px', Border.all(color: Colors.grey, width: 3)),
            _buildBorderBox('4px', Border.all(color: Colors.grey, width: 4)),
          ],
        ),
        const SizedBox(height: 16),
        const Text('响应式边框'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildResponsiveBorderBox('细边框', 1.0),
            _buildResponsiveBorderBox('中边框', 2.0),
            _buildResponsiveBorderBox('粗边框', 3.0),
          ],
        ),
      ],
    );
  }

  Widget _buildBorderRadius(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('圆角大小'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildRoundedBox('小圆角', BorderRadius.circular(4)),
            _buildRoundedBox('中圆角', BorderRadius.circular(8)),
            _buildRoundedBox('大圆角', BorderRadius.circular(16)),
            _buildRoundedBox('圆形', BorderRadius.circular(50)),
          ],
        ),
        const SizedBox(height: 16),
        const Text('不同圆角'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildRoundedBox('左上', const BorderRadius.only(
              topLeft: Radius.circular(16),
            )),
            _buildRoundedBox('右上', const BorderRadius.only(
              topRight: Radius.circular(16),
            )),
            _buildRoundedBox('左下', const BorderRadius.only(
              bottomLeft: Radius.circular(16),
            )),
            _buildRoundedBox('右下', const BorderRadius.only(
              bottomRight: Radius.circular(16),
            )),
          ],
        ),
        const SizedBox(height: 16),
        const Text('椭圆角'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildRoundedBox('椭圆1', const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(5),
            )),
            _buildRoundedBox('椭圆2', const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(5),
              bottomLeft: Radius.circular(20),
            )),
          ],
        ),
      ],
    );
  }

  Widget _buildBorderColors(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('主题色边框'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBorderBox('主色', Border.all(color: AppColors.primary, width: 2)),
            _buildBorderBox('辅色', Border.all(color: AppColors.secondary, width: 2)),
            _buildBorderBox('成功', Border.all(color: AppColors.success, width: 2)),
            _buildBorderBox('警告', Border.all(color: AppColors.warning, width: 2)),
          ],
        ),
        const SizedBox(height: 16),
        const Text('中性色边框'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBorderBox('灰色1', Border.all(color: Colors.grey.shade100, width: 2)),
            _buildBorderBox('灰色2', Border.all(color: Colors.grey.shade300, width: 2)),
            _buildBorderBox('灰色3', Border.all(color: Colors.grey.shade500, width: 2)),
            _buildBorderBox('灰色4', Border.all(color: Colors.grey.shade700, width: 2)),
          ],
        ),
        const SizedBox(height: 16),
        const Text('半透明边框'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBorderBox('半透明1', Border.all(
              color: Colors.grey.withOpacity(0.3),
              width: 2,
            )),
            _buildBorderBox('半透明2', Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 2,
            )),
            _buildBorderBox('半透明3', Border.all(
              color: Colors.grey.withOpacity(0.7),
              width: 2,
            )),
          ],
        ),
      ],
    );
  }

  Widget _buildDashedBorders(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('虚线边框'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCustomPaintBorder('虚线1', [4, 2]),
            _buildCustomPaintBorder('虚线2', [8, 4]),
            _buildCustomPaintBorder('点线', [2, 4]),
          ],
        ),
        const SizedBox(height: 16),
        const Text('虚线颜色'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCustomPaintBorder('红色虚线', [4, 2], Colors.red),
            _buildCustomPaintBorder('蓝色虚线', [4, 2], Colors.blue),
            _buildCustomPaintBorder('绿色虚线', [4, 2], Colors.green),
          ],
        ),
        const SizedBox(height: 16),
        const Text('虚线粗细'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCustomPaintBorder('细虚线', [4, 2], Colors.grey, 1.0),
            _buildCustomPaintBorder('中虚线', [4, 2], Colors.grey, 2.0),
            _buildCustomPaintBorder('粗虚线', [4, 2], Colors.grey, 3.0),
          ],
        ),
      ],
    );
  }

  Widget _buildCombinedBorders(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('组合边框'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCombinedBorder('双色边框', [
              BorderSide(color: AppColors.primary, width: 2),
              BorderSide(color: AppColors.secondary, width: 2),
            ]),
            _buildCombinedBorder('粗细边框', [
              BorderSide(color: Colors.grey, width: 4),
              BorderSide(color: Colors.white, width: 2),
            ]),
          ],
        ),
        const SizedBox(height: 16),
        const Text('渐变边框'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildGradientBorder('渐变1', [AppColors.primary, AppColors.secondary]),
            _buildGradientBorder('渐变2', [AppColors.success, AppColors.warning]),
          ],
        ),
        const SizedBox(height: 16),
        const Text('阴影边框'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildShadowBorder('阴影1'),
            _buildShadowBorder('阴影2'),
          ],
        ),
      ],
    );
  }

  Widget _buildBorderBox(String title, Border border) {
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 11),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildRoundedBox(String title, BorderRadius borderRadius) {
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: borderRadius,
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 11),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildResponsiveBorderBox(String title, double width) {
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: width,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 11),
              textAlign: TextAlign.center,
            ),
            Text(
              '${width.toStringAsFixed(0)}px',
              style: const TextStyle(fontSize: 9, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomPaintBorder(String title, List<double> dashPattern, [Color color = Colors.grey, double strokeWidth = 2.0]) {
    return CustomPaint(
      size: const Size(80, 60),
      painter: DashedBorderPainter(
        dashPattern: dashPattern,
        color: color,
        strokeWidth: strokeWidth,
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 11),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildCombinedBorder(String title, List<BorderSide> sides) {
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        border: Border(
          top: sides[0],
          right: sides[1],
          bottom: sides[0],
          left: sides[1],
        ),
        // 移除borderRadius，因为不同颜色的边框不支持圆角
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 11),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildGradientBorder(String title, List<Color> colors) {
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        border: GradientBorder(
          gradient: LinearGradient(colors: colors),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 11),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildShadowBorder(String title) {
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 11),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final List<double> dashPattern;
  final Color color;
  final double strokeWidth;

  DashedBorderPainter({
    required this.dashPattern,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(4),
      ));

    final dashPath = _createDashedPath(path, dashPattern);
    canvas.drawPath(dashPath, paint);
  }

  Path _createDashedPath(Path sourcePath, List<double> dashPattern) {
    final dashPath = Path();
    var distance = 0.0;
    var draw = true;
    var dashIndex = 0;

    sourcePath.computeMetrics().forEach((metric) {
      while (distance < metric.length) {
        final dashLength = dashPattern[dashIndex % dashPattern.length];
        if (draw) {
          dashPath.addPath(
            metric.extractPath(distance, distance + dashLength),
            Offset.zero,
          );
        }
        distance += dashLength;
        draw = !draw;
        dashIndex++;
      }
    });

    return dashPath;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class GradientBorder extends Border {
  final Gradient gradient;
  final double width;

  GradientBorder({
    required this.gradient,
    required this.width,
  }) : super();

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    if (isUniform) {
      switch (shape) {
        case BoxShape.circle:
          assert(borderRadius == null, 'A borderRadius cannot be given when shape is a BoxShape.circle.');
          _paintGradientCircleBorder(canvas, rect);
          break;
        case BoxShape.rectangle:
          if (borderRadius != null) {
            _paintGradientRoundedRectangleBorder(canvas, rect, borderRadius);
            return;
          }
          _paintGradientRectangleBorder(canvas, rect);
          break;
      }
      return;
    }

    super.paint(canvas, rect, textDirection: textDirection, shape: shape, borderRadius: borderRadius);
  }

  void _paintGradientCircleBorder(Canvas canvas, Rect rect) {
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    canvas.drawCircle(rect.center, rect.shortestSide / 2, paint);
  }

  void _paintGradientRectangleBorder(Canvas canvas, Rect rect) {
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    canvas.drawRect(rect, paint);
  }

  void _paintGradientRoundedRectangleBorder(Canvas canvas, Rect rect, BorderRadius borderRadius) {
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    final rrect = borderRadius.toRRect(rect);
    canvas.drawRRect(rrect, paint);
  }
}