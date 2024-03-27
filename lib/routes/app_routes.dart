import 'package:go_router/go_router.dart';

import 'package:flutt_clothes_shop/modules/_introduction/getting_started_page.dart';
import 'package:flutt_clothes_shop/modules/_introduction/intro_page.dart';
import 'package:flutt_clothes_shop/modules/auth/authentication/login_page.dart';
import 'package:flutt_clothes_shop/modules/auth/authentication/sign_up_page.dart';
import 'package:flutt_clothes_shop/modules/auth/forgot_password/forgot_password_page.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/_tab_base/tab_base.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/discover/discover_page.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/home/home_page.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/my_orders/my_orders_page.dart';
import 'package:flutt_clothes_shop/routes/profile_routes.dart';

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
        path: '/tab_base',
        builder: (context, state) => const TabBase(),
        routes: [
          //TODO: move routes into separate page when they are ready to
          GoRoute(
            path: 'home',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: 'discover',
            builder: (context, state) => const DiscoverPage(),
          ),
          GoRoute(
            path: 'my_orders',
            builder: (context, state) => const MyOrdersPage(),
          ),
          ProfileRoutes.route,
        ],
      ),
    ],
  );
}
