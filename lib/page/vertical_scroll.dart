import 'package:cached_network_image/cached_network_image.dart';
import 'package:cli_firebase/controller/aba_controller.dart';
import 'package:flutter/material.dart';

class Vertical_Scroll extends StatelessWidget {
  final ControllerAba controller;
  const Vertical_Scroll({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final filteredList = controller.aba
        .where(
          (item) => item.id >= 7 && item.id <= 10,
        )
        .toList();
    return SizedBox(
      height: 40, // Fixed height for horizontal scrolling
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              width: 160,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    width: 30,
                    height: 30,
                    color: const Color(0xFF067394),
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
                    maxLines: 1,
                    style: const TextStyle(color: Colors.white),
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
