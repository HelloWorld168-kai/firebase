import 'package:cli_firebase/pages/typography/typography_english.dart';
import 'package:flutter/material.dart';

class ExpandedSection extends StatelessWidget {
  const ExpandedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            "OR",
            style: typographies.paragraph(
              color: Colors.white,
              fontWeight: FontWeight.bold,
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
    );
  }
}
