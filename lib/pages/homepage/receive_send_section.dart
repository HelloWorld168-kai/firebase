import 'package:cli_firebase/pages/typography/typography_khmer.dart';
import 'package:cli_firebase/pages/utils/themes_color.dart';
import 'package:flutter/material.dart';

class ReceiveSendSection extends StatelessWidget {
  const ReceiveSendSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/recieve.png",
                    width: 30,
                    height: 40,
                    color: Color(0xFF51B9A3),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "ទទួលលុយចូល",
                    style: khtypographies.paragraph(
                      fontWeight: FontWeight.bold,
                      color: AppColors.third,
                    ),
                  ),
                  SizedBox(width: 25),
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: Image.asset(
                      "assets/icons/send.png",
                      width: 40,
                      height: 30,
                      color: Colors.red,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "ផ្ញើលុយចេញ",
                    style: khtypographies.paragraph(
                      fontWeight: FontWeight.bold,
                      color: AppColors.third,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
