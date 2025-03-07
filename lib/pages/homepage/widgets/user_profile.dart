import 'package:cli_firebase/pages/typography/typography_english.dart';
import 'package:cli_firebase/pages/typography/typography_khmer.dart';
import 'package:cli_firebase/pages/typography/typographyy_khmer_muol.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  "assets/images/unnamed.jpg",
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "សួស្ដី",
                              style: typographiesKH.display(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Chankoma!",
                              style: typographies.display(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "មើលប្រូហ្វាល",
                              style: khtypographies.label(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500],
                              ),
                            ),
                            SizedBox(width: 3),
                            Image.asset(
                              "assets/icons/right-arrow.png",
                              width: 12,
                              height: 10,
                              fit: BoxFit.cover,
                              color: Colors.grey[500],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
