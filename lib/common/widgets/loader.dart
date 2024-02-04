import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';
import 'package:flutt_clothes_shop/providers/loader_provider.dart';

class CommonLoader extends StatelessWidget {
  final Widget child;

  const CommonLoader({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        context.watch<LoaderProvider>().isLoading
            ? Container(
                decoration: const BoxDecoration(
                  color: Colors.black38,
                ),
                child: const Center(
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
