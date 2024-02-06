import 'package:flutter/material.dart';

import 'package:flutt_clothes_shop/modules/main_tabs/discover/discover_page.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/home/home_page.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/my_orders/my_orders_page.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/profile/pages/profile_tab.dart';

enum TabsModel {
  home(
    tabIcon: Icon(Icons.home),
    tabPage: HomePage(),
  ),
  discover(
    tabIcon: Icon(Icons.search),
    tabPage: DiscoverPage(),
  ),
  myOrders(
    tabIcon: Icon(Icons.shopping_bag),
    tabPage: MyOrdersPage(),
  ),
  profile(
    tabIcon: Icon(Icons.person),
    tabPage: ProfileTab(),
  );

  final Icon tabIcon;
  final Widget tabPage;

  const TabsModel({
    required this.tabIcon,
    required this.tabPage,
  });
}
