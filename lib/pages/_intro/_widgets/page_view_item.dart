import 'package:flutter/material.dart';

import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';

class PageViewItem extends StatelessWidget {
  final String assetPath;

  const PageViewItem({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 368,
      width: 261,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.lightGray1,
      ),
      child: Image.asset(
        assetPath,
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
