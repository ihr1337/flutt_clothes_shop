import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutt_clothes_shop/common/buttons/custom_round_button.dart';
import 'package:flutt_clothes_shop/common/ui_consts/app_text_styles.dart';

class ResetPasswordEmailSent extends StatelessWidget {
  const ResetPasswordEmailSent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 368,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 35, 25, 35),
        child: Column(
          children: [
            Image.asset('assets/icons/email_sent.png'),
            const SizedBox(height: 30),
            const Text(
              'Email with instructions has been sent to your email address.',
              textAlign: TextAlign.center,
              style: AppTextStyles.black17,
            ),
            const SizedBox(height: 60),
            CustomRoundButton(
              text: 'Back to Login',
              onTap: () => context.go('/login'),
            )
          ],
        ),
      ),
    );
  }
}
