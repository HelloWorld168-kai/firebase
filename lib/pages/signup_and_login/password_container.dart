import 'package:flutter/material.dart';

class password_container extends StatelessWidget {
  const password_container({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _passwordController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.white),
          icon: Image.asset(
            "assets/icons/padlock.png",
            width: 20,
            height: 20,
            color: Colors.white,
            fit: BoxFit.cover,
          ),
        ),
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter your password";
          }
          if (value.length < 6) {
            return "Password must be at least 6 characters long";
          }
          return null;
        },
      ),
    );
  }
}
