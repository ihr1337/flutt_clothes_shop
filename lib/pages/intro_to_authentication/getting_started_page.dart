import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutt_clothes_shop/common/buttons/blurred_round_button.dart';
import 'package:flutt_clothes_shop/common/ui_consts/app_text_styles.dart';

class GettingStartedPage extends StatelessWidget {
  const GettingStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black45,
                  BlendMode.darken,
                ),
                image: AssetImage(
                  'assets/images/getting_started_bg.png',
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 260,
            child: Text(
              'Welcome to FluttShop!',
              style: AppTextStyles.white25,
            ),
          ),
          const Positioned(
            bottom: 220,
            child: Text(
              'The home for a fashionista!',
              style: AppTextStyles.white16,
            ),
          ),
          Positioned(
            bottom: 120,
            child: BlurredRoundButton(
              onTap: () => context.go('/intro'),
              text: 'Get started',
            ),
          )
        ],
      ),
    );
  }
}
