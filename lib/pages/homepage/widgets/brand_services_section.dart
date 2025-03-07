import 'package:cli_firebase/controllers/aba_service_controller.dart';
import 'package:cli_firebase/model/aba_model.dart';
import 'package:cli_firebase/pages/components/container.dart';
import 'package:cli_firebase/pages/components/styles.dart';
import 'package:flutter/material.dart';

class brand_services extends StatelessWidget {
  final ControllerAba controller;
  const brand_services({
    super.key,
    required this.filteredList,
    required this.controller,
  });

  final List<AbaModel> filteredList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Container(
        width: 400,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFF012032),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filteredList.length,
          itemBuilder: (context, index) {
            String imageUrl = filteredList[index].image;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  CustomContainer(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: imageUrl.isNotEmpty
                              ? (imageUrl.startsWith("http")
                                  ? Image.network(
                                      imageUrl,
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Icon(
                                          Icons.broken_image,
                                          size: 100,
                                          color: Colors.grey,
                                        );
                                      },
                                    )
                                  : Image.asset(
                                      imageUrl,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Icon(
                                          Icons.broken_image,
                                          size: 100,
                                          color: Colors.grey,
                                        );
                                      },
                                    ))
                              : Icon(
                                  Icons.image_not_supported,
                                  size: 100,
                                  color: Colors.grey,
                                ),
                        ),
                        SizedBox(height: 10),
                        AppText(
                          filteredList[index].name,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
