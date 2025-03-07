import 'package:flutter/material.dart';

class email_container extends StatelessWidget {
  const email_container({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _emailController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Email',
          labelStyle: TextStyle(color: Colors.white),
          icon: Image.asset(
            "assets/icons/arroba.png",
            width: 20,
            height: 20,
            color: Colors.white,
            fit: BoxFit.cover,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter your email";
          }
          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return "Please enter a valid email address";
          }
          return null;
        },
      ),
    );
  }
}
