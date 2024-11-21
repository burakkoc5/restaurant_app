import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:restaurant_app/common/constants/app_colors.dart';

class CustomBottomSheet {
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    bool isDismissible = true,
    bool isTransparent = false,
    bool expand = false,
    bool enableDrag = true,
    Color? backgroundColor,
  }) async {
    return showCustomModalBottomSheet<T>(
      containerWidget: (context, animation, child) {
        return Container(
            decoration: BoxDecoration(
              color: isTransparent
                  ? Colors.transparent
                  : backgroundColor ??
                      Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: child);
      },
      context: context,
      builder: (_) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.7, // 60% of screen height
        maxChildSize: 0.8,
        minChildSize: 0.4, // Minimum size on drag
        builder: (context, scrollController) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 48,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Expanded(
                  child: child,
                ),
              ],
            ),
          );
        },
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      backgroundColor: backgroundColor,
      elevation: 0,
      expand: expand,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
    );
  }
}
