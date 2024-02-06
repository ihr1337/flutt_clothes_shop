import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum AuthProviderEnum {
  email,
  google,
}

class Auth {
  static signInWithEmailAndPassword(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static signUpWithEmailAndPassword(
    String? name,
    String? email,
    String? password,
  ) async {
    final auth = FirebaseAuth.instance;

    await auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    await auth.currentUser?.updateDisplayName(name);

    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static authenticateWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
