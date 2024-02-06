import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:flutt_clothes_shop/common/buttons/circular_social_media_button.dart';
import 'package:flutt_clothes_shop/common/buttons/custom_round_button.dart';
import 'package:flutt_clothes_shop/common/ui_consts/app_text_styles.dart';
import 'package:flutt_clothes_shop/common/ui_consts/ui_constants.dart';
import 'package:flutt_clothes_shop/common/widgets/appbar.dart';
import 'package:flutt_clothes_shop/common/widgets/loader.dart';
import 'package:flutt_clothes_shop/common/widgets/toast.dart';
import 'package:flutt_clothes_shop/modules/auth/authentication/util/auth.dart';
import 'package:flutt_clothes_shop/providers/loader_provider.dart';

class SignUpPage extends StatefulWidget {
  final String? emailInitValue;

  const SignUpPage({super.key, this.emailInitValue});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  late bool obscurePassword;
  late bool obscureConfirmPassword;
  late FToast fToast;

  @override
  void initState() {
    obscurePassword = true;
    obscureConfirmPassword = true;
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  void _obscurePassword({bool isField1 = false}) {
    setState(() {
      isField1
          ? obscurePassword = !obscurePassword
          : obscureConfirmPassword = !obscureConfirmPassword;
    });
  }

  Future<void> _signUp({
    String? name,
    String? email,
    String? password,
    authProvider = AuthProviderEnum.email,
  }) async {
    try {
      context.read<LoaderProvider>().enableLoader();
      switch (authProvider) {
        case AuthProviderEnum.email:
          {
            await Auth.signUpWithEmailAndPassword(name, email, password);
            break;
          }
        case AuthProviderEnum.google:
          {
            await Auth.authenticateWithGoogle();
            break;
          }
      }

      if (mounted) context.go('/tab_base');
    } on FirebaseAuthException catch (e) {
      ToastClass.showToast(e);
    } finally {
      if (mounted) context.read<LoaderProvider>().disableLoader();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CommonLoader(
        child: Scaffold(
          extendBodyBehindAppBar: false,
          resizeToAvoidBottomInset: true,
          appBar: context.canPop() ? const CommonAppBar() : null,
          body: SingleChildScrollView(
            child: Padding(
              padding: UiConstants.authPagePadding.copyWith(
                top: context.canPop() ? 0 : 100,
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Create',
                      style: AppTextStyles.blackBold24,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'your account',
                      style: AppTextStyles.blackBold24,
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
                          initialValue: widget.emailInitValue ?? '',
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
                          obscureText: obscurePassword,
                          decoration: UiConstants.inputDecoration.copyWith(
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () => _obscurePassword(isField1: true),
                              icon: obscurePassword
                                  ? const Icon(Icons.remove_red_eye)
                                  : const Icon(Icons.visibility_off),
                            ),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(6),
                          ]),
                        ),
                        const SizedBox(height: 20),
                        FormBuilderTextField(
                          name: 'confirm_password',
                          cursorWidth: 1,
                          obscureText: obscureConfirmPassword,
                          decoration: UiConstants.inputDecoration.copyWith(
                            hintText: 'Confirm Password',
                            suffixIcon: IconButton(
                              onPressed: () => _obscurePassword(),
                              icon: obscureConfirmPassword
                                  ? const Icon(Icons.remove_red_eye)
                                  : const Icon(Icons.visibility_off),
                            ),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.match(
                              _formKey.currentState?.fields['password']
                                      ?.value ??
                                  '',
                              errorText: 'Passwords do not match',
                            ),
                          ]),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomRoundButton(
                    text: 'SIGN UP',
                    onTap: () async {
                      _formKey.currentState!.validate();
                      if (!_formKey.currentState!.isValid) return;

                      await _signUp(
                        name: _formKey.currentState?.fields['name']?.value,
                        email: _formKey.currentState?.fields['email']?.value,
                        password:
                            _formKey.currentState?.fields['password']?.value,
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'or sign up with',
                    style: AppTextStyles.gray12,
                  ),
                  const SizedBox(height: 30),
                  CircularSocialMediaButton(
                      onTap: () =>
                          _signUp(authProvider: AuthProviderEnum.google)),
                  const SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: AppTextStyles.black14w400,
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        style: UiConstants.textButtonStyle,
                        child: Text(
                          'Log in',
                          style: AppTextStyles.black14w400.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: () => context.go(
                          '/login',
                          extra: [
                            _formKey.currentState?.fields['email']?.value
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
