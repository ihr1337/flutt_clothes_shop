import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';
import 'package:flutt_clothes_shop/common/ui_consts/app_text_styles.dart';
import 'package:flutter/material.dart';

class UiConstants {
  static const authPagePadding = EdgeInsets.fromLTRB(35, 20, 35, 50);

  static const inputDecoration = InputDecoration(
    focusedBorder: UnderlineInputBorder(),
    border: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightGray2)),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightGray2)),
    hintStyle: AppTextStyles.black14w400,
  );

  static ButtonStyle textButtonStyle = ButtonStyle(
    overlayColor: MaterialStateProperty.all(AppColors.gray.withOpacity(0.1)),
  );
}
