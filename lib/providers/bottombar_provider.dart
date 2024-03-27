import 'package:flutt_clothes_shop/common/enums/tabs_enum.dart';
import 'package:flutter/material.dart';

class BottomBarProvider with ChangeNotifier {
  int _index = 0;

  List<TabsEnum> tabList = [
    TabsEnum.home,
    TabsEnum.discover,
    TabsEnum.myOrders,
    TabsEnum.profile,
  ];

  int get index => _index;

  void setIndex(int index) {
    _index = index;
    notifyListeners();
  }
}
