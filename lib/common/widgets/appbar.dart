import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';
import 'package:flutt_clothes_shop/common/ui_consts/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  final Size preferredSize;

  const CommonAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
  }) : preferredSize = const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: AppColors.white,
      leading: context.canPop()
          ? leading ??
              IconButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.white),
                  elevation: MaterialStateProperty.all<double>(4.0),
                  shadowColor: MaterialStateProperty.all<Color>(
                      AppColors.black.withOpacity(0.2)),
                ),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.black,
                ),
                onPressed: () => context.pop(),
              )
          : null,
      title: title != null
          ? Text(
              title!,
              style: AppTextStyles.black18bold,
            )
          : null,
      actions: actions,
    );
  }
}
