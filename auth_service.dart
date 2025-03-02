import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ['email', 'https://www.googleapis.com/auth/calendar'],
);

Future<GoogleSignInAccount?> signIn() async {
  try {
    return await _googleSignIn.signIn();
  } catch (error) {
    print("Sign-in error: $error");
    return null;
  }
}
