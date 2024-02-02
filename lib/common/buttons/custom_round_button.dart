import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutt_clothes_shop/common/ui_consts/app_text_styles.dart';

class CustomRoundButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isActive;

  const CustomRoundButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 193,
      height: 53,
      decoration: BoxDecoration(
        color: isActive ? AppColors.darkBrown : AppColors.lightGray3,
        borderRadius: BorderRadius.circular(26.5),
      ),
      child: TextButton(
        onPressed: isActive ? onTap : null,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(
            Colors.white.withOpacity(0.1),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.whiteBold16,
        ),
      ),
    );
  }
}
