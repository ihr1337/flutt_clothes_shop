import 'package:go_router/go_router.dart';

import 'package:flutt_clothes_shop/pages/_intro/getting_started_page.dart';
import 'package:flutt_clothes_shop/pages/_intro/intro_page.dart';
import 'package:flutt_clothes_shop/pages/authentication/login_page.dart';
import 'package:flutt_clothes_shop/pages/authentication/sign_up_page.dart';
import 'package:flutt_clothes_shop/pages/forgot_password/forgot_password_page.dart';
import 'package:flutt_clothes_shop/pages/home/home_page.dart';

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
        builder: (context, state) {
          final emailInitValue = state.extra as List<dynamic>?;
          return LoginPage(emailInitValue: emailInitValue?[0]);
        },
      ),
      GoRoute(
        path: '/sign_up',
        builder: (context, state) {
          final emailInitValue = state.extra as List<dynamic>?;
          return SignUpPage(emailInitValue: emailInitValue?[0]);
        },
      ),
      GoRoute(
        path: '/forgot_password_email_step',
        builder: (context, state) {
          final emailInitValue = state.extra as List<dynamic>?;
          return ForgotPasswordPage(emailInitValue: emailInitValue?[0]);
        },
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
