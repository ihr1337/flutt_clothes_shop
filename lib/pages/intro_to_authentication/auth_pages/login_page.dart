import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:flutt_clothes_shop/common/buttons/circular_social_media_button.dart';
import 'package:flutt_clothes_shop/common/buttons/custom_round_button.dart';
import 'package:flutt_clothes_shop/common/ui_consts/app_text_styles.dart';
import 'package:flutt_clothes_shop/common/ui_consts/ui_constants.dart';
import 'package:flutt_clothes_shop/common/widgets/appbar.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CommonAppBar(),
        body: Padding(
          padding: UiConstants.authPagePadding,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Log into',
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
                      decoration: UiConstants.inputDecoration
                          .copyWith(hintText: 'Password'),
                      validator: FormBuilderValidators.required(),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: UiConstants.textButtonStyle,
                  child: const Text(
                    'Forgot password?',
                    style: AppTextStyles.black12,
                  ),
                  onPressed: () => print('Forgot password'),
                ),
              ),
              const SizedBox(height: 20),
              CustomRoundButton(
                text: 'LOG IN',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    print('Validated');
                  }
                  print('unvalidated');
                },
              ),
              const SizedBox(height: 30),
              const Text(
                'or log in with',
                style: AppTextStyles.gray12,
              ),
              const SizedBox(height: 30),
              CircularSocialMediaButton(
                onTap: () {},
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: AppTextStyles.black14,
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    style: UiConstants.textButtonStyle,
                    child: Text(
                      'Sign up',
                      style: AppTextStyles.black14.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () => context.go('/sign_up'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
