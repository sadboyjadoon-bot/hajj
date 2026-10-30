import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/hajj_models.dart';

const emerald = AppColors.emerald;
const emeraldDeep = AppColors.emeraldDeep;
const gold = AppColors.gold;
const parchment = AppColors.lightBackground;

class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    super.key,
    this.padding = const EdgeInsets.all(18),
    this.onTap,
    this.color,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: color,
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: BorderSide(color: theme.colorScheme.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading(this.title, {super.key, this.action, this.onAction});

  final String title;
  final String? action;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        if (action != null)
          TextButton(onPressed: onAction, child: Text(action!)),
      ],
    );
  }
}

class RitualTypeChip extends StatelessWidget {
  const RitualTypeChip(this.type, {super.key});

  final RitualType type;

  @override
  Widget build(BuildContext context) {
    final baseColor = switch (type) {
      RitualType.pillar => const Color(0xFF9A4D3D),
      RitualType.wajib => const Color(0xFFAD7C25),
      RitualType.sunnah => emerald,
      RitualType.optional => const Color(0xFF65736D),
    };
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark
        ? Color.lerp(baseColor, Colors.white, 0.42)!
        : baseColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: isDark ? 0.17 : 0.1),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        type.label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class IslamicPattern extends StatelessWidget {
  const IslamicPattern({
    super.key,
    this.color = Colors.white,
    this.opacity = 0.13,
  });

  final Color color;
  final double opacity;

  @override
  Widget build(BuildContext context) => CustomPaint(
    painter: _PatternPainter(color.withValues(alpha: opacity)),
    child: const SizedBox.expand(),
  );
}

class _PatternPainter extends CustomPainter {
  const _PatternPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;
    const spacing = 42.0;
    for (double y = -spacing; y < size.height + spacing; y += spacing) {
      for (double x = -spacing; x < size.width + spacing; x += spacing) {
        final center = Offset(x, y);
        final path = Path();
        for (var i = 0; i < 8; i++) {
          final angle = math.pi / 4 * i;
          final point = Offset(
            center.dx + math.cos(angle) * 18,
            center.dy + math.sin(angle) * 18,
          );
          if (i == 0) {
            path.moveTo(point.dx, point.dy);
          } else {
            path.lineTo(point.dx, point.dy);
          }
        }
        path.close();
        canvas.drawPath(path, paint);
        canvas.drawCircle(center, 7, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _PatternPainter oldDelegate) =>
      oldDelegate.color != color;
}

class NoteBanner extends StatelessWidget {
  const NoteBanner({
    required this.title,
    required this.message,
    super.key,
    this.icon = Icons.info_outline,
  });

  final String title;
  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.primary.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colors.primary.withValues(alpha: 0.13)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: colors.primary),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodySmall
                      ?.copyWith(height: 1.5, color: colors.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageBody extends StatelessWidget {
  const PageBody({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth > 900 ? 900.0 : 680.0;
        return Center(
          child: SizedBox(
            width: maxWidth,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
              children: children,
            ),
          ),
        );
      },
    );
  }
}
