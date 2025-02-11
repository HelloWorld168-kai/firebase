import 'package:cached_network_image/cached_network_image.dart';
import 'package:cli_firebase/controller/aba_controller.dart';
import 'package:cli_firebase/page/details_page.dart';
import 'package:cli_firebase/page/vertical_scroll.dart';
import 'package:flutter/material.dart';

class DontKnow extends StatelessWidget {
  const DontKnow({
    super.key,
    required this.controller,
  });

  final ControllerAba controller;

  @override
  Widget build(BuildContext context) {
    final filteredList = controller.aba
        .where(
          (item) => item.id >= 1 && item.id <= 6,
        )
        .toList();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              GridView.builder(
                itemCount: filteredList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 100,
                  mainAxisSpacing: 7.5,
                  crossAxisSpacing: 7.5,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          width: 30,
                          height: 30,
                          color: const Color(0xFF067394),
                          fit: BoxFit.cover,
                          imageUrl: controller.aba[index].image,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          controller.aba[index].name,
                          maxLines: 1,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(color: Colors.grey[500], thickness: 1),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Vertical_Scroll(
                    controller: controller), // Correct class name
              ),
            ],
          ),
        ),
      ],
    );
  }
}
