import 'package:flutter/material.dart';
import 'package:restaurant_app/common/constants/app_colors.dart';

class AppContainerButton extends StatelessWidget {
  const AppContainerButton({
    required this.center,
    this.height,
    this.isBig = false,
    this.onPressed,
    this.color,
    this.padding,
    this.margin,
    super.key,
  });

  final Widget center;
  final Color? color;
  final double? height;
  final bool isBig;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: padding ??
                EdgeInsets.only(left: isBig ? 16 : 8, right: isBig ? 16 : 4),
            decoration: BoxDecoration(
              color: color ?? AppColors.primaryGreen,
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            height: height ?? 48,
            margin: margin,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: isBig ? 8 : 0),
                Expanded(child: center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
