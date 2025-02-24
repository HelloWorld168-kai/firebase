import 'package:cli_firebase/page/utils/themes_color.dart';
import 'package:cli_firebase/page/typography/typography_english.dart';
import 'package:flutter/material.dart';

class Default extends StatefulWidget {
  const Default({
    super.key,
  });

  @override
  State<Default> createState() => _DefaultState();
}

class _DefaultState extends State<Default> {
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
                    horizontal: 7.5,
                    vertical: 2.5,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Default",
                        style: typographies.label(
                          fontWeight: FontWeight.bold,
                          color: AppColors.third,
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
