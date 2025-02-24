import 'package:cli_firebase/controller/aba_service_controller.dart';
import 'package:cli_firebase/page/homepage/aba_home_screen.dart';
import 'package:cli_firebase/page/signup_and_login/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  final ControllerAba controller;
  const LogIn({super.key, required this.controller});

  @override
  State<LogIn> createState() => _SignAndLogInState();
}

class _SignAndLogInState extends State<LogIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordHidden = true;

  Future<void> _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AbaUi(controller: ControllerAba()),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String message = "Login failed! Please check your credentials.";
      if (e.code == 'user-not-found') {
        message = "No user found with this email.";
      } else if (e.code == 'wrong-password') {
        message = "Incorrect password. Try again!";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }

  void _clearFields() {
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF023048),
      appBar: AppBar(
        backgroundColor: const Color(0xFF023048),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Welcome Back!",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text(
              "You are where you find the best you are looking for!",
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            _buildInputField(
              controller: _emailController,
              labelText: "Username or Email",
              iconPath: "assets/icons/user.png",
            ),
            const SizedBox(height: 20),
            _buildInputField(
              controller: _passwordController,
              labelText: "Password",
              iconPath: "assets/icons/padlock.png",
              obscureText: _isPasswordHidden,
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white70,
                ),
                onPressed: () =>
                    setState(() => _isPasswordHidden = !_isPasswordHidden),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(350, 60),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                elevation: 0,
              ),
              onPressed: () {
                _login();
                _clearFields();
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AbaUi(
                        controller: ControllerAba(),
                      ),
                    ),
                  );
                },
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF015F85)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text("Forgot Password?",
                style: TextStyle(fontSize: 16, color: Colors.white)),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?",
                    style: TextStyle(fontSize: 14, color: Colors.white)),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildDividerWithText("OR"),
            const SizedBox(height: 20),
            const Text("Sign up with Social Networks",
                style: TextStyle(fontSize: 16, color: Colors.white)),
            const SizedBox(height: 20),
            _buildSocialIcons(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String labelText,
    required String iconPath,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Container(
      width: 350,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.white),
            icon: Image.asset(iconPath,
                width: 20, height: 20, fit: BoxFit.cover, color: Colors.white),
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }

  Widget _buildDividerWithText(String text) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.white, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(text,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        const Expanded(child: Divider(color: Colors.white, thickness: 1)),
      ],
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset("assets/images/Facebook-Logosu.png", width: 40),
        Image.asset(
            "assets/images/png-clipart-google-logo-google-logo-google-search-icon-google-text-logo-thumbnail.png",
            width: 40),
        Image.asset("assets/images/X_icon_2.svg.png", width: 40),
      ],
    );
  }
}
