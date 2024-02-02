import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutt_clothes_shop/app_routes.dart';
import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  runApp(
    const FluttClothesShopApp(),
  );
}

class FluttClothesShopApp extends StatelessWidget {
  const FluttClothesShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FluttShop',
      theme: ThemeData(
        fontFamily: 'Product Sans',
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.black,
          selectionColor: AppColors.black.withOpacity(0.2),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.routerConfig,
    );
  }
}
