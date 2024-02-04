import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:flutt_clothes_shop/common/buttons/custom_round_button.dart';
import 'package:flutt_clothes_shop/common/functionality/toast_type_def.dart';
import 'package:flutt_clothes_shop/common/ui_consts/app_text_styles.dart';
import 'package:flutt_clothes_shop/common/ui_consts/ui_constants.dart';
import 'package:flutt_clothes_shop/common/widgets/appbar.dart';
import 'package:flutt_clothes_shop/common/widgets/loader.dart';
import 'package:flutt_clothes_shop/common/widgets/toast.dart';
import 'package:flutt_clothes_shop/pages/forgot_password/widgets/reset_password_email_sent.dart';
import 'package:flutt_clothes_shop/providers/loader_provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  final String? emailInitValue;

  const ForgotPasswordPage({super.key, this.emailInitValue});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  late FToast fToast;

  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  Future<void> _sendPasswordResetEmail(String email) async {
    try {
      if (mounted) context.read<LoaderProvider>().enableLoader();

      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      if (mounted) {
        showModalBottomSheet(
            showDragHandle: true,
            context: context,
            builder: (context) => const ResetPasswordEmailSent());
      }
    } on FirebaseAuthException catch (e) {
      return fToast.showToast(
        child: CommonToast(
          toastText: e.message.toString(),
          toastType: ToastTypeDef.defineToastType(e),
        ),
        gravity: ToastGravity.TOP,
        toastDuration: const Duration(seconds: 2),
        isDismissable: true,
      );
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
              top: context.canPop() ? 50 : 100,
              bottom: 350,
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Forgot password?',
                    style: AppTextStyles.blackBold24,
                  ),
                ),
                const SizedBox(height: 25),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter email associated with your account and we’ll send and email with intructions to reset your password',
                    style: AppTextStyles.black14w400,
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
                        decoration: UiConstants.inputDecoration.copyWith(
                          hintText: 'enter your email here',
                          hintStyle: AppTextStyles.black12
                              .copyWith(fontWeight: FontWeight.w400),
                          prefixIcon: const Icon(
                            Icons.mail_outline_sharp,
                            size: 17,
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const Spacer(),
                CustomRoundButton(
                    text: 'Next',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _sendPasswordResetEmail(
                            _formKey.currentState!.fields['email']?.value);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
