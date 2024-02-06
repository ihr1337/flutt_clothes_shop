import 'package:flutt_clothes_shop/modules/main_tabs/profile/pages/edit_profile_page.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/profile/pages/profile_tab.dart';
import 'package:go_router/go_router.dart';

class ProfileRoutes {
  static final route = GoRoute(
    path: 'profile',
    builder: (context, state) => const ProfileTab(),
    routes: [
      GoRoute(
        path: 'edit_user_info',
        builder: (context, state) => const EditProfilePage(),
      )
    ],
  );
}
