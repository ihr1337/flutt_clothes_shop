import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutt_clothes_shop/common/widgets/bottombar.dart';
import 'package:flutt_clothes_shop/common/widgets/loader.dart';
import 'package:flutt_clothes_shop/providers/bottombar_provider.dart';

class TabBase extends StatelessWidget {
  const TabBase({super.key});

  @override
  Widget build(BuildContext context) {
    final tabIndex = context.watch<BottomBarProvider>().index;

    return CommonLoader(
      child: Scaffold(
        bottomNavigationBar: const CommonBottomNavigationBar(),
        body: context.watch<BottomBarProvider>().tabList[tabIndex].tabPage,
      ),
    );
  }
}
