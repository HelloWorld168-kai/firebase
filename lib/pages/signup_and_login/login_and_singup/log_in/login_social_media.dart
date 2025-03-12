import 'package:cli_firebase/controllers/aba_service_controller.dart';
import 'package:cli_firebase/pages/homepage/aba_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginSocialMedia extends StatelessWidget {
  const LoginSocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 100,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () async {
              try {
                UserCredential userCredential = await signInWithFacebook();

                if (userCredential.user != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AbaHomeScreen(
                        controller: ControllerAba(),
                      ),
                    ),
                  );
                } else {
                  print("Facebook login failed.");
                }
              } catch (e) {
                print("Error during Facebook login: $e");
              }
            },
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Image.asset(
                "assets/images/Facebook-Logosu.png",
                height: 100,
              ),
            ),
          ),
          SizedBox(width: 25),
          InkWell(
            onTap: () async {
              await signInWithGoogle();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AbaHomeScreen(
                    controller: ControllerAba(),
                  ),
                ),
              );
            },
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Image.asset(
                "assets/images/png-clipart-google-logo-google-logo-google-search-icon-google-text-logo-thumbnail.png",
                height: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(
      '${loginResult.accessToken!.tokenString}',
    );

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        print("Google sign-in canceled.");
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      print("Signed in as: ${userCredential.user?.displayName}");
    } catch (e) {
      print("Error signing in with Google: $e");
    }
  }
}
