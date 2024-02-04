import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutt_clothes_shop/common/functionality/toast_type_def.dart';
import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';

class ToastClass {
  static showToast(FirebaseAuthException e) {
    FToast().showToast(
      child: CommonToast(
        toastText: e.message.toString(),
        toastType: ToastTypeDef.defineToastType(e),
      ),
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 2),
      isDismissable: true,
    );
  }
}

class CommonToast extends StatelessWidget {
  final String toastText;
  final ToastType toastType;

  const CommonToast({
    super.key,
    required this.toastText,
    required this.toastType,
  });

  Widget returnCustomizedToast(
    String errorText, {
    required Color bgColor,
    required Icon icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: bgColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(
            width: 12.0,
          ),
          Flexible(child: Text(errorText)),
        ],
      ),
    );
  }

  Widget returnToast() {
    switch (toastType) {
      case (ToastType.success):
        return returnCustomizedToast(
          toastText,
          bgColor: AppColors.green,
          icon: const Icon(Icons.check),
        );

      case (ToastType.error):
        return returnCustomizedToast(
          toastText,
          bgColor: AppColors.red,
          icon: const Icon(Icons.error),
        );

      case (ToastType.info):
        return returnCustomizedToast(
          toastText,
          bgColor: AppColors.white,
          icon: const Icon(Icons.info),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return returnToast();
  }
}
