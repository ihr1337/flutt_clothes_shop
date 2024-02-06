import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';
import 'package:flutt_clothes_shop/providers/bottombar_provider.dart';

class CommonBottomNavigationBar extends StatelessWidget {
  const CommonBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.lightGray2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.black,
          unselectedItemColor: AppColors.lightGray3,
          iconSize: 30,
          items: context
              .watch<BottomBarProvider>()
              .tabList
              .map(
                (e) => BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.only(top: 15),
                    child: e.tabIcon,
                  ),
                  label: '',
                ),
              )
              .toList(),
          currentIndex: context.watch<BottomBarProvider>().index,
          onTap: (int index) {
            context.read<BottomBarProvider>().setIndex(index);
          },
        ),
      ),
    );
  }
}
