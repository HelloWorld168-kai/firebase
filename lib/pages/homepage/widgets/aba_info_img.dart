import 'package:cli_firebase/pages/homepage/widgets/banner_scroll.dart';
import 'package:cli_firebase/pages/utils/themes_color.dart';
import 'package:flutter/material.dart';

class AbaInfoImg extends StatelessWidget {
  const AbaInfoImg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 20,
      ),
      child: Container(
        width: 400,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.primary,
        ),
        child: ClipRRect(
          // Clip the image with rounded corners
          borderRadius: BorderRadius.circular(15),
          child: Banner_Scroll(),
        ),
      ),
    );
  }
}
