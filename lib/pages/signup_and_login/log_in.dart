import 'package:cli_firebase/controllers/aba_service_controller.dart';
import 'package:cli_firebase/pages/homepage/aba_home_screen.dart';
import 'package:cli_firebase/pages/signup_and_login/expanded_section.dart';
import 'package:cli_firebase/pages/signup_and_login/login_and_singup/log_in/login_social_media.dart';
import 'package:cli_firebase/pages/signup_and_login/sign_up.dart';
import 'package:cli_firebase/pages/typography/typography_english.dart';
import 'package:cli_firebase/pages/utils/themes_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  final ControllerAba controller;
  const LogIn({
    super.key,
    required this.controller,
  });

  @override
  State<LogIn> createState() => _SignAndLogInState();
}

class _SignAndLogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isPasswordHidden = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF023048),
      appBar: AppBar(
        backgroundColor: const Color(0xFF023048),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              children: [
                Text(
                  "Welcome Back!",
                  style: typographies.page(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "You are where you find the best you are looking for!",
                  style: typographies.paragraph(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
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
                      _isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white70,
                    ),
                    onPressed: () => setState(
                      () => _isPasswordHidden = !_isPasswordHidden,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
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
                              vertical: 8,
                            ),
                            child: Text(
                              "Sign Up",
                              style: typographies.display(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                SizedBox(height: 15),
                Text(
                  "Forgot Password?",
                  style: typographies.title(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: typographies.paragraph(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(
                              controller: widget.controller,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.secondary,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                          ),
                          child: Text(
                            "Sign Up",
                            style: typographies.title(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ExpandedSection(),
                SizedBox(height: 20),
                Text(
                  "Sign up with Social Networks",
                  style: typographies.paragraph(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                LoginSocialMedia(),
              ],
            ),
          ),
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
        border: Border.all(
          color: Colors.white,
        ),
        color: AppColors.secondary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          style: const TextStyle(color: Colors.white),
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

  Future<void> Clear() async {
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
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
          SnackBar(
            content: Text(
              e.message ?? "Sign up failed",
            ),
          ),
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
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
