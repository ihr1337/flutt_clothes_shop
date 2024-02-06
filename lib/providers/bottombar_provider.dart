import 'package:flutt_clothes_shop/common/models/tabs_model.dart';
import 'package:flutter/material.dart';

class BottomBarProvider with ChangeNotifier {
  int _index = 0;

  List<TabsModel> tabList = [
    TabsModel.home,
    TabsModel.discover,
    TabsModel.myOrders,
    TabsModel.profile,
  ];

  int get index => _index;

  void setIndex(int index) {
    _index = index;
    notifyListeners();
  }
}
