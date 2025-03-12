import 'package:cli_firebase/pages/signup_and_login/login_and_singup/sign_in/otp_number.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Phone_Authentication extends StatefulWidget {
  const Phone_Authentication({super.key});

  @override
  State<Phone_Authentication> createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<Phone_Authentication> {
  TextEditingController phoneController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        onPressed: () {
          myDialogBox(context);
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Image.network(
                "https://static.vecteezy.com/system/resources/thumbnails/010/829/986/small/phone-icon-in-trendy-flat-style-free-png.png",
                height: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            const Center(
              child: Text(
                "Sign in with Phone",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void myDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      const Text(
                        "Phone Authentication",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter phone number (e.g., +9771234567890)",
                      labelText: "Phone Number",
                    ),
                  ),
                  const SizedBox(height: 20),
                  isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });

                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: phoneController.text,
                              verificationCompleted:
                                  (PhoneAuthCredential credential) async {
                                await FirebaseAuth.instance
                                    .signInWithCredential(credential);
                                Navigator.pop(context);
                              },
                              verificationFailed: (FirebaseAuthException e) {
                                setState(() {
                                  isLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Verification failed: ${e.message}")),
                                );
                              },
                              codeSent: (verificationId, forceResendingToken) {
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OTPScreen(
                                      verificationId: verificationId,
                                    ),
                                  ),
                                );
                              },
                              codeAutoRetrievalTimeout: (verificationId) {},
                            );
                          },
                          child: const Text(
                            "Send Code",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          );
        });
  }
}
