import 'package:cli_firebase/controller/aba_service_controller.dart';
import 'package:cli_firebase/page/utils/themes_color.dart';
import 'package:cli_firebase/page/typography/typography_khmer.dart';
import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  final ControllerAba controller;

  const Information({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final filteredList = controller.aba.where((item) => item.id == 17).toList();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          filteredList.length,
          (index) {
            return Text(
              filteredList[index].name,
              style: typographies.display(
                fontWeight: FontWeight.w500,
                color: AppColors.third,
              ),
            );
          },
        ),
      ),
    );
  }
}
