import 'package:flutter/material.dart';

import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';
import 'package:flutt_clothes_shop/common/ui_consts/app_text_styles.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/profile/util/card_position_enum.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/profile/util/profile_page_options_enum.dart';

class ProfileTabOptionCard extends StatelessWidget {
  final ProfileTabOptions cardProps;
  final VoidCallback onCardTap;
  final double cardHeight;
  final CardPosition cardPosition;

  const ProfileTabOptionCard({
    super.key,
    required this.cardProps,
    required this.onCardTap,
    required this.cardHeight,
    required this.cardPosition,
  });

  @override
  Widget build(BuildContext context) {
    final inkCondition = cardPosition == CardPosition.isFirst
        ? const BorderRadius.vertical(top: Radius.circular(20))
        : cardPosition == CardPosition.isLast
            ? const BorderRadius.vertical(bottom: Radius.circular(20))
            : null;

    return Material(
      child: InkWell(
        borderRadius: inkCondition,
        onTap: () => onCardTap(),
        child: Ink(
          height: cardHeight,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: inkCondition,
          ),
          child: Row(
            children: [
              const SizedBox(width: 20),
              cardProps.icon,
              const SizedBox(width: 20),
              Text(
                cardProps.title,
                style: AppTextStyles.gray14w400,
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}
