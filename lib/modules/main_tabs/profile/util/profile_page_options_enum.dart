import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';
import 'package:flutter/material.dart';

enum ProfileTabOptions {
  address(
    icon: Icon(
      Icons.location_on,
      color: AppColors.lightGray3,
    ),
    title: 'Address',
  ),
  payment(
    icon: Icon(
      Icons.payment,
      color: AppColors.lightGray3,
    ),
    title: 'Payment method',
  ),
  vouchers(
    icon: Icon(
      Icons.confirmation_num,
      color: AppColors.lightGray3,
    ),
    title: 'Vouchers',
  ),
  wishlist(
    icon: Icon(
      Icons.favorite,
      color: AppColors.lightGray3,
    ),
    title: 'My Wishlist',
  ),
  rate(
    icon: Icon(
      Icons.star,
      color: AppColors.lightGray3,
    ),
    title: 'Rate this app',
  ),
  logOut(
    icon: Icon(
      Icons.logout_outlined,
      color: AppColors.lightGray3,
    ),
    title: 'Log out',
  );

  final Icon icon;
  final String title;

  const ProfileTabOptions({
    required this.icon,
    required this.title,
  });
}
