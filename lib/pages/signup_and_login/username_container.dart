import 'package:flutter/material.dart';

class username_container extends StatelessWidget {
  const username_container({
    super.key,
    required TextEditingController userController,
  }) : _userController = userController;

  final TextEditingController _userController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFF015F85),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: _userController,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white),
                icon: Image.asset(
                  "assets/icons/id-card.png",
                  width: 25,
                  height: 20,
                  color: Colors.white,
                  fit: BoxFit.cover,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your name";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
