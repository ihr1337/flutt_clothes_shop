import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import 'package:flutt_clothes_shop/common/buttons/custom_round_button.dart';
import 'package:flutt_clothes_shop/common/widgets/appbar.dart';
import 'package:flutt_clothes_shop/common/widgets/loader.dart';
import 'package:flutt_clothes_shop/modules/main_tabs/profile/widgets/change_user_avatar_card.dart';
import 'package:flutt_clothes_shop/providers/profile_provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormBuilderState>();

  String? photoUrl = FirebaseAuth.instance.currentUser!.photoURL;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CommonLoader(
          child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CommonAppBar(title: 'Profile Settings'),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(35, 35, 35, 90),
          child: Column(
            children: [
              ChangeUserPhotoCard(
                onChangeAvatarTap: () async {
                  await Provider.of<ProfileProvider>(context, listen: false)
                      .updateProfilePicture(context);
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'userName',
                      initialValue:
                          FirebaseAuth.instance.currentUser?.displayName ?? '',
                      decoration: const InputDecoration(
                        labelText: 'User Name',
                      ),
                    ),
                    const SizedBox(height: 30),
                    FormBuilderTextField(
                      name: 'email',
                      keyboardType: TextInputType.emailAddress,
                      initialValue:
                          FirebaseAuth.instance.currentUser?.email ?? '',
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 30),
                    FormBuilderTextField(
                      name: 'phone',
                      initialValue:
                          FirebaseAuth.instance.currentUser?.phoneNumber ?? '',
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        hintText:
                            FirebaseAuth.instance.currentUser?.phoneNumber ==
                                    null
                                ? 'No phone number'
                                : null,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CustomRoundButton(
                text: 'Save changes',
                isActive: true,
                onTap: () async {
                  if (_formKey.currentState!.saveAndValidate()) {
                    await Provider.of<ProfileProvider>(context, listen: false)
                        .updateUserInfo(
                      context,
                      name: _formKey.currentState!.value['userName'],
                      email: _formKey.currentState!.value['email'],
                      phoneNumber: _formKey.currentState!.value['phone'],
                    );
                  }
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
