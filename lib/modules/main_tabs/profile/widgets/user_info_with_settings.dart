import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';
import 'package:flutt_clothes_shop/common/ui_consts/app_text_styles.dart';

class UserInfoWithSettings extends StatelessWidget {
  const UserInfoWithSettings({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: check why image wouldnt update with stream
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        print('rebuild');
        return Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 32.0, 12.0, 32.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 34,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    snapshot.data?.photoURL ?? '',
                    height: 68,
                    width: 68,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    snapshot.data?.displayName ?? 'no name',
                    style: AppTextStyles.blackBold16,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    snapshot.data?.email! ?? 'no email',
                    style: AppTextStyles.black12,
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () =>
                    context.push('/tab_base/profile/edit_user_info'),
                icon: const Icon(
                  Icons.settings,
                  color: AppColors.black,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
