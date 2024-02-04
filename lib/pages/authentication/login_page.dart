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
import 'package:flutt_clothes_shop/pages/authentication/util/auth.dart';
import 'package:flutt_clothes_shop/providers/loader_provider.dart';

class LoginPage extends StatefulWidget {
  final String? emailInitValue;
  const LoginPage({super.key, this.emailInitValue});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  late bool obscurePassword;
  late FToast fToast;

  @override
  void initState() {
    obscurePassword = true;
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  void _obscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  //TODO refactor this
  Future<void> _signIn(String email, String password) async {
    try {
      context.read<LoaderProvider>().enableLoader();

      Auth.signInWithEmailAndPassword(email, password);
    } on FirebaseAuthException catch (e) {
      ToastClass.showToast(e);
      rethrow;
    } finally {
      if (mounted) context.read<LoaderProvider>().disableLoader();
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      if (mounted) context.read<LoaderProvider>().enableLoader();

      await Auth.authenticateWithGoogle();

      if (mounted) context.go('/home');
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
          resizeToAvoidBottomInset: false,
          appBar: context.canPop() ? const CommonAppBar() : null,
          body: Padding(
            padding: UiConstants.authPagePadding.copyWith(
              top: context.canPop() ? 0 : 100,
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Log into',
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
                              onPressed: () => _obscurePassword(),
                              icon: obscurePassword
                                  ? const Icon(Icons.remove_red_eye)
                                  : const Icon(Icons.visibility_off),
                            )),
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
                    onPressed: () => context.push('/forgot_password_email_step',
                        extra: [_formKey.currentState?.fields['email']?.value]),
                  ),
                ),
                const SizedBox(height: 20),
                CustomRoundButton(
                  text: 'LOG IN',
                  onTap: () async {
                    _formKey.currentState?.validate();
                    if (!_formKey.currentState!.isValid) return;

                    await _signIn(
                      _formKey.currentState?.fields['email']?.value,
                      _formKey.currentState?.fields['password']?.value,
                    );
                    if (mounted) context.go('/home');
                  },
                ),
                const SizedBox(height: 30),
                const Text(
                  'or log in with',
                  style: AppTextStyles.gray12,
                ),
                const SizedBox(height: 30),
                CircularSocialMediaButton(
                  onTap: _signInWithGoogle,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: AppTextStyles.black14w400,
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      style: UiConstants.textButtonStyle,
                      child: Text(
                        'Sign up',
                        style: AppTextStyles.black14w400.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () => context.go(
                        '/sign_up',
                        extra: [_formKey.currentState?.fields['email']?.value],
                      ),
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
