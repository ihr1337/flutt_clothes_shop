import 'package:firebase_auth/firebase_auth.dart';

class ToastTypeDef {
  final FirebaseAuthException exception;

  ToastTypeDef({required this.exception});

  static ToastType defineToastType(FirebaseAuthException exception) {
    switch (exception.code) {
      case 'email-already-in-use':
        return ToastType.error;
      case 'invalid-email':
        return ToastType.error;
      case 'weak-password':
        return ToastType.error;
      case 'user-not-found':
        return ToastType.error;
      case 'wrong-password':
        return ToastType.error;
      case 'auth/invalid-email':
        return ToastType.error;
      case 'auth/user-not-found':
        return ToastType.error;
      default:
        return ToastType.error;
    }
  }
}

enum ToastType {
  success,
  error,
  info,
}
