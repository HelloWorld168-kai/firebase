import 'package:flutter/material.dart';

class sign_up_button extends StatelessWidget {
  const sign_up_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
