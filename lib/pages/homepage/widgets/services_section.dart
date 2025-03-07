import 'package:cli_firebase/controllers/aba_service_controller.dart';
import 'package:cli_firebase/pages/typography/typography_khmer.dart';
import 'package:cli_firebase/pages/utils/themes_color.dart';
import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  final ControllerAba controller;
  const ServicesSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final filteredList = controller.aba
        .where(
          (item) => item.id == 18,
        )
        .toList();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          filteredList.length,
          (index) {
            return Text(
              filteredList[index].name,
              style: khtypographies.display(
                fontWeight: FontWeight.bold,
                color: AppColors.third,
              ),
            );
          },
        ),
      ),
    );
  }
}
