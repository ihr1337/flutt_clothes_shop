import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';
import 'package:flutt_clothes_shop/common/widgets/appbar.dart';
import 'package:flutt_clothes_shop/common/widgets/loader.dart';
import 'package:flutt_clothes_shop/common/widgets/toast.dart';
import 'package:flutt_clothes_shop/providers/loader_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String? photoUrl = FirebaseAuth.instance.currentUser!.photoURL;

  Future<void> updateProfilePicture() async {
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
        setState(() {});
        if (context.mounted) context.read<LoaderProvider>().disableLoader();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonLoader(
      child: Scaffold(
        appBar: const CommonAppBar(title: 'Profile Settings'),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: AppColors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        fit: BoxFit.fill,
                        FirebaseAuth.instance.currentUser?.photoURL! ?? '',
                        height: 110,
                        width: 110,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -10,
                    bottom: -10,
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.gray,
                      ),
                      child: Material(
                        color: AppColors.gray,
                        shape: const CircleBorder(),
                        child: Ink(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: updateProfilePicture,
                            icon: const Icon(
                              Icons.camera_alt_outlined,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
