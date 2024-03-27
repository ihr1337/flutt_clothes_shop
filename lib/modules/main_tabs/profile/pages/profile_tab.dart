import 'package:flutt_clothes_shop/providers/profile_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/profile/util/card_position_enum.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/profile/util/profile_page_options_enum.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/profile/widgets/profile_tab_option_card.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/profile/widgets/user_info_with_settings.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final containerHeight = MediaQuery.sizeOf(context).height / 2;
    const cardsList = ProfileTabOptions.values;
    final cardFunctionsList = [
      //TODO: complete functionality for profile tab
      () {},
      () {},
      () {},
      () {},
      () {},

      ///Logout function
      () =>
          Provider.of<ProfileProvider>(context, listen: false).logOut(context),
    ];

    CardPosition? defineCardPosition(List cardList, card) {
      final index = cardList.indexOf(card);

      if (index == 0) {
        return CardPosition.isFirst;
      } else if (index >= 1 && index <= 4) {
        return CardPosition.isMiddle;
      } else if (index == 5) {
        return CardPosition.isLast;
      } else {
        return null;
      }
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const UserInfoWithSettings(),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.lightGray2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  for (final card in cardsList) ...[
                    ProfileTabOptionCard(
                      cardPosition: defineCardPosition(cardsList, card)!,
                      cardHeight: (containerHeight / 6) - 1,
                      cardProps: card,
                      onCardTap: cardFunctionsList[cardsList.indexOf(card)],
                    ),
                    if (card != cardsList.last) const Divider(height: 1)
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
