import 'package:flutter/material.dart';

class DefaultWidget extends StatefulWidget {
  const DefaultWidget({
    super.key,
  });

  @override
  State<DefaultWidget> createState() => _DefaultState();
}

class _DefaultState extends State<DefaultWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            width: 60,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFF5BDAE0),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2.5,
                    vertical: 2.5,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "គណនីគោល",
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10),
        Text(
          "Savings",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}
