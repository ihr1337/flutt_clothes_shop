import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:flutt_clothes_shop/common/buttons/circular_social_media_button.dart';
import 'package:flutt_clothes_shop/common/buttons/custom_round_button.dart';
import 'package:flutt_clothes_shop/common/ui_consts/app_text_styles.dart';
import 'package:flutt_clothes_shop/common/ui_consts/ui_constants.dart';
import 'package:flutt_clothes_shop/common/widgets/appbar.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: false,
        resizeToAvoidBottomInset: true,
        appBar: const CommonAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: UiConstants.authPagePadding,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Create',
                    style: AppTextStyles.black24,
                  ),
                ),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'your account',
                    style: AppTextStyles.black24,
                  ),
                ),
                const SizedBox(height: 50),
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: 'name',
                        cursorWidth: 1,
                        decoration: UiConstants.inputDecoration
                            .copyWith(hintText: 'Name'),
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderTextField(
                        name: 'email',
                        cursorWidth: 1,
                        keyboardType: TextInputType.emailAddress,
                        decoration: UiConstants.inputDecoration
                            .copyWith(hintText: 'Email Address'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderTextField(
                        name: 'password',
                        cursorWidth: 1,
                        obscureText: true,
                        decoration: UiConstants.inputDecoration
                            .copyWith(hintText: 'Password'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(6),
                        ]),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderTextField(
                        name: 'confirm_password',
                        cursorWidth: 1,
                        obscureText: true,
                        decoration: UiConstants.inputDecoration
                            .copyWith(hintText: 'Confirm Password'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.match('password'),
                        ]),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomRoundButton(
                  text: 'SIGN UP',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print('Validated');
                    }
                    print('unvalidated');
                  },
                ),
                const SizedBox(height: 30),
                const Text(
                  'or sign up with',
                  style: AppTextStyles.gray12,
                ),
                const SizedBox(height: 30),
                CircularSocialMediaButton(
                  onTap: () {
                    //TODO: Sign up with google
                    print('Sign up with google');
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: AppTextStyles.black14,
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      style: UiConstants.textButtonStyle,
                      child: Text(
                        'Log in',
                        style: AppTextStyles.black14.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () => context.go('/login'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
