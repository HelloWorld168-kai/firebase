import 'package:cli_firebase/page/utils/themes_color.dart';
import 'package:flutter/material.dart';

class RecieveAndSend extends StatelessWidget {
  const RecieveAndSend({
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
                    "Recieve Money",
                    style: TextStyle(
                      fontSize: 15,
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
                    "Send Money",
                    style: TextStyle(
                      fontSize: 15,
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
