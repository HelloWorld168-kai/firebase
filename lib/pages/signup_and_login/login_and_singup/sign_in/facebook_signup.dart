import 'package:cli_firebase/controllers/aba_service_controller.dart';
import 'package:cli_firebase/pages/homepage/aba_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignup extends StatelessWidget {
  const FacebookSignup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
      child: Container(
        width: 90,
        height: 90,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Color(0xFFEBEBEB),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      "assets/images/Facebook-Logosu.png",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
}
