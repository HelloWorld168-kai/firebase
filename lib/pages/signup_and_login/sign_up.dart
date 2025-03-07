import 'package:cli_firebase/controllers/aba_service_controller.dart';
import 'package:cli_firebase/pages/components/styles.dart';
import 'package:cli_firebase/pages/homepage/aba_home_screen.dart';
import 'package:cli_firebase/pages/signup_and_login/social_media/Phone_Number.dart';
import 'package:cli_firebase/pages/signup_and_login/social_media/facebook_signup.dart';
import 'package:cli_firebase/pages/signup_and_login/social_media/Googgle_signup.dart';
import 'package:cli_firebase/pages/signup_and_login/social_media/x_signup.dart';
import 'package:cli_firebase/pages/typography/typography_english.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    super.key,
    required this.controller,
  });

  final ControllerAba controller;

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _userController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  bool _isLoading = false;
  Future<void> Clear() async {
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF023048),
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: typographies.display(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF023048),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => AbaHomeScreen(
                  controller: widget.controller,
                ),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF023048),
              Color(0xFF012130),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Create your account",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  _buildInputField(
                      controller: _userController,
                      labelText: "Username",
                      iconPath: "assets/icons/id-card.png"),
                  SizedBox(height: 30),
                  _buildInputField(
                      controller: _emailController,
                      labelText: "Email",
                      iconPath: "assets/icons/profile.png"),
                  SizedBox(height: 30),
                  _buildInputField(
                      controller: _passwordController,
                      labelText: "Koma",
                      iconPath: "assets/icons/arroba.png"),
                  SizedBox(height: 30),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: _signUp,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondary,
                            minimumSize: const Size(double.infinity, 40),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 55,
                                vertical: 7.5,
                              ),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text(
                              "Already have an account?",
                              style: typographies.paragraph(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 30),
                            InkWell(
                              onTap: () {
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AbaHomeScreen(
                                      controller: controller,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                "Log In",
                                style: typographies.paragraph(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Or Sign Up With",
                          style: typographies.title(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 280,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 1,
                        top: 1,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PhoneNumber(
                                    controller: ControllerAba(),
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.call),
                            iconSize: 20,
                            color: Colors.grey[700],
                          ),
                          Text(
                            "Sign In With Phone Number",
                            style: typographies.paragraph(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      facebook_signup(),
                      GooggleSignup(),
                      x_signup(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Account created successfully!")),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AbaHomeScreen(
              controller: widget.controller,
            ),
          ),
        );
        Clear();
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "Sign up failed")),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
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
        border: Border.all(
          color: Colors.white,
        ),
        color: Color(0xFF015F85),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Colors.white,
            ),
            icon: Image.asset(
              iconPath,
              width: 20,
              height: 20,
              fit: BoxFit.cover,
              color: Colors.white,
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
