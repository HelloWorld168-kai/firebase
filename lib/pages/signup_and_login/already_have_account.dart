import 'package:cli_firebase/controllers/aba_service_controller.dart';
import 'package:cli_firebase/pages/signup_and_login/log_in.dart';
import 'package:cli_firebase/pages/typography/typography_english.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final ControllerAba controller;
  const AlreadyHaveAccount({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogIn(
                        controller: ControllerAba(),
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
    );
  }
}
