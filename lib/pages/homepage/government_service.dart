import 'package:cli_firebase/controllers/aba_service_controller.dart';
import 'package:cli_firebase/model/aba_model.dart';
import 'package:cli_firebase/pages/typography/typography_khmer.dart';
import 'package:cli_firebase/pages/utils/themes_color.dart';
import 'package:flutter/material.dart';

class GovernmentService extends StatelessWidget {
  const GovernmentService({
    super.key,
    required this.controller,
    required List<AbaModel> filteredList,
  });

  final ControllerAba controller;

  @override
  Widget build(BuildContext context) {
    final filteredList = controller.aba
        .where(
          (item) => item.id == 20,
        )
        .toList();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 180),
          child: Column(
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
        ),
      ],
    );
  }
}
