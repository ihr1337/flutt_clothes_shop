import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/profile/util/card_position_enum.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/profile/util/profile_page_options_model.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/profile/widgets/profile_tab_option_card.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/profile/widgets/user_info_with_settings.dart';
import 'package:flutt_clothes_shop/providers/loader_provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final containerHeight = MediaQuery.sizeOf(context).height / 2;
    final cardsList = ProfilePageOptionModel.cardsInfoList;
    final cardFunctionsList = [
      //TODO: complete functionality for profile page
      () {},
      () {},
      () {},
      () {},
      () {},

      ///Logout function
      () async {
        context.read<LoaderProvider>().enableLoader();
        await Future.delayed(const Duration(milliseconds: 500));
        await FirebaseAuth.instance.signOut();
        if (context.mounted) context.go('/login');
        if (context.mounted) context.read<LoaderProvider>().disableLoader();
      },
    ];

    CardPosition defineCardPosition(List cardList, card) {
      final index = cardList.indexOf(card);

      if (index == 0) {
        return CardPosition.isFirst;
      } else if (index >= 1 && index <= 4) {
        return CardPosition.isMiddle;
      } else if (index == 5) {
        return CardPosition.isLast;
      } else {
        return CardPosition.isLast;
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
                children: cardsList
                    .map((e) => Column(
                          children: [
                            ProfileTabOptionCard(
                              cardProps: e,
                              cardPosition: defineCardPosition(cardsList, e),
                              onCardTap:
                                  cardFunctionsList[cardsList.indexOf(e)],
                              cardHeight: containerHeight / 6 - 1,
                            ),
                            if (cardsList.last != e) const Divider(height: 1)
                          ],
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
