import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import 'package:flutt_clothes_shop/common/widgets/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.canPop() ? const CommonAppBar() : null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(FirebaseAuth.instance.currentUser?.displayName.toString() ??
                'No name'),
            const SizedBox(
              height: 10,
            ),
            Text(FirebaseAuth.instance.currentUser!.email.toString()),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if (context.mounted) context.go('/login');
              },
              child: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
