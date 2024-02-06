import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';
import 'package:flutter/material.dart';

class ProfilePageOptionModel {
  static List<ProfilePageOptionModel> cardsInfoList = <ProfilePageOptionModel>[
    const ProfilePageOptionModel(
      icon: Icon(
        Icons.location_on,
        color: AppColors.lightGray3,
      ),
      title: 'Address',
    ),
    const ProfilePageOptionModel(
      icon: Icon(
        Icons.payment,
        color: AppColors.lightGray3,
      ),
      title: 'Payment method',
    ),
    const ProfilePageOptionModel(
      icon: Icon(
        Icons.confirmation_num,
        color: AppColors.lightGray3,
      ),
      title: 'Vouchers',
    ),
    const ProfilePageOptionModel(
      icon: Icon(
        Icons.favorite,
        color: AppColors.lightGray3,
      ),
      title: 'My Wishlist',
    ),
    const ProfilePageOptionModel(
      icon: Icon(
        Icons.star,
        color: AppColors.lightGray3,
      ),
      title: 'Rate this app',
    ),
    const ProfilePageOptionModel(
      icon: Icon(
        Icons.logout_outlined,
        color: AppColors.lightGray3,
      ),
      title: 'Log out',
    ),
  ];

  final Icon icon;
  final String title;

  const ProfilePageOptionModel({
    required this.icon,
    required this.title,
  });
}
