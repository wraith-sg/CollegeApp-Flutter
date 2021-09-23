import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Googlesignin {
  static final GoogleSignIn _signIn = GoogleSignIn();
  static bool _isSigning;
  Googlesignin() {
    _isSigning = false;
  }
  static bool get isSigning => _isSigning;
  set isSignin(bool signing) {
    _isSigning = signing;
  }

  static Future login() async {
    final user = await _signIn.signIn();
    if (user != null) {
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      _isSigning = true;
    } else {
      _isSigning = false;
      return;
    }
  }

  static void logout() async {
    await _signIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}