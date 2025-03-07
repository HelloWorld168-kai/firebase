import 'package:cached_network_image/cached_network_image.dart';
import 'package:cli_firebase/controllers/aba_service_controller.dart';
import 'package:cli_firebase/pages/utils/themes_color.dart';
import 'package:cli_firebase/pages/typography/typography_khmer.dart';
import 'package:flutter/material.dart';

class VerticalScroll extends StatelessWidget {
  final ControllerAba controller;
  const VerticalScroll({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final filteredList = controller.aba
        .where(
          (item) => item.id >= 7 && item.id <= 10,
        )
        .toList();
    return SizedBox(
      height: 55,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.dark,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    width: 30,
                    height: 30,
                    color: AppColors.secondary,
                    fit: BoxFit.cover,
                    imageUrl: filteredList[index].image,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    filteredList[index].name,
                    style: khtypographies.paragraph(
                      fontWeight: FontWeight.w500,
                      color: AppColors.third,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
