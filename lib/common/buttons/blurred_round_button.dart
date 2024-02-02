import 'dart:ui';

import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutt_clothes_shop/common/ui_consts/app_text_styles.dart';

class BlurredRoundButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const BlurredRoundButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
        child: Container(
          width: 193,
          height: 53,
          decoration: BoxDecoration(
            color: AppColors.gray.withOpacity(0.5),
            borderRadius: BorderRadius.circular(26.5),
            border: Border.all(
              color: AppColors.white,
            ),
          ),
          child: TextButton(
            onPressed: onTap,
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all<Color>(
                AppColors.white.withOpacity(0.1),
              ),
            ),
            child: Text(
              text,
              style: AppTextStyles.whiteBold16,
            ),
          ),
        ),
      ),
    );
  }
}
