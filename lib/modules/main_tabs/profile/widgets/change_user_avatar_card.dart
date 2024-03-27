import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';
import 'package:flutter/material.dart';

class ChangeUserPhotoCard extends StatelessWidget {
  final VoidCallback onChangeAvatarTap;

  const ChangeUserPhotoCard({
    super.key,
    required this.onChangeAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 55,
          backgroundColor: AppColors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              fit: BoxFit.fill,
              FirebaseAuth.instance.currentUser?.photoURL! ?? '',
              height: 110,
              width: 110,
            ),
          ),
        ),
        Positioned(
          right: -10,
          bottom: -10,
          child: Container(
            height: 42,
            width: 42,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.gray,
            ),
            child: Material(
              color: AppColors.gray,
              shape: const CircleBorder(),
              child: Ink(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: onChangeAvatarTap,
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
