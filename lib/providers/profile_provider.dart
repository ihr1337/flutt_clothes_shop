import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutt_clothes_shop/common/widgets/toast.dart';
import 'package:flutt_clothes_shop/providers/loader_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileProvider extends ChangeNotifier {
  void logOut(BuildContext context) async {
    context.read<LoaderProvider>().enableLoader();
    await Future.delayed(const Duration(milliseconds: 500));
    await FirebaseAuth.instance.signOut();
    if (context.mounted) context.go('/login');
    if (context.mounted) context.read<LoaderProvider>().disableLoader();
  }

  Future<void> updateProfilePicture(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final ref = FirebaseStorage.instance.ref().child(
          'profile_pictures/${FirebaseAuth.instance.currentUser!.uid}/${pickedFile.name}');

      try {
        if (context.mounted) context.read<LoaderProvider>().enableLoader();

        await ref.putFile(File(pickedFile.path));

        final url = await ref.getDownloadURL();

        await FirebaseAuth.instance.currentUser!.updatePhotoURL(url);
      } on FirebaseException catch (e) {
        ToastClass.showToast(e);
      } finally {
        await FirebaseAuth.instance.currentUser?.reload();
        if (context.mounted) context.read<LoaderProvider>().disableLoader();
      }
    }
  }

  Future<void> updateUserInfo(
    BuildContext context, {
    required String name,
    required String email,
    required String phoneNumber,
  }) async {
    try {
      //TODO finish this flow
      if (context.mounted) context.read<LoaderProvider>().enableLoader();
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.verifyBeforeUpdateEmail(email);

      final phoneNumberCredential = PhoneAuthProvider.credential(
        verificationId: FirebaseAuth.instance.currentUser!.phoneNumber!,
        smsCode: phoneNumber,
      );

      await FirebaseAuth.instance.currentUser!
          .updatePhoneNumber(phoneNumberCredential);
      if (context.mounted) context.read<LoaderProvider>().disableLoader();
    } on FirebaseAuthException catch (e) {
      ToastClass.showToast(e);
    } catch (e) {
      ToastClass.showToast(e);
    }
  }
}
