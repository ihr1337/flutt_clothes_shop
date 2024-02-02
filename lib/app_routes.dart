import 'package:flutt_clothes_shop/pages/intro_to_authentication/auth_pages/sign_up_page.dart';
import 'package:go_router/go_router.dart';

import 'package:flutt_clothes_shop/pages/intro_to_authentication/auth_pages/login_page.dart';
import 'package:flutt_clothes_shop/pages/intro_to_authentication/getting_started_page.dart';
import 'package:flutt_clothes_shop/pages/intro_to_authentication/intro_page.dart';

class Routes {
  static final routerConfig = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const GettingStartedPage(),
      ),
      GoRoute(
        path: '/intro',
        builder: (context, state) => const IntroPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/sign_up',
        builder: (context, state) => const SignUpPage(),
      ),
    ],
  );
}
