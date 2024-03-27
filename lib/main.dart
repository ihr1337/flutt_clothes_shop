import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';
import 'package:flutt_clothes_shop/firebase_options.dart';
import 'package:flutt_clothes_shop/providers/bottombar_provider.dart';
import 'package:flutt_clothes_shop/providers/loader_provider.dart';
import 'package:flutt_clothes_shop/providers/profile_provider.dart';
import 'package:flutt_clothes_shop/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoaderProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BottomBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(),
        ),
      ],
      child: const FluttClothesShopApp(),
    ),
  );
}

class FluttClothesShopApp extends StatelessWidget {
  const FluttClothesShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FluttShop',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: AppColors.white,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.black,
          selectionColor: AppColors.black.withOpacity(0.2),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.routerConfig,
      builder: FToastBuilder(),
    );
  }
}
