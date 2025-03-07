import 'package:cached_network_image/cached_network_image.dart';
import 'package:cli_firebase/controllers/aba_service_controller.dart';
import 'package:cli_firebase/pages/typography/typography_khmer.dart';
import 'package:cli_firebase/pages/utils/themes_color.dart';
import 'package:cli_firebase/pages/homepage/widgets/details_page.dart';
import 'package:cli_firebase/pages/homepage/vertical_scroll.dart';
import 'package:flutter/material.dart';

class AbaCenterWidget extends StatelessWidget {
  const AbaCenterWidget({
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: 400,
          height: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color(0xFF012032),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Shadow color
                spreadRadius: 2, // How much the shadow spreads
                blurRadius: 10, // Blur radius for a soft shadow
                offset: Offset(0, 5), // Moves shadow slightly downwar
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 12.5,
                ),
                child: Column(
                  children: [
                    GridView.builder(
                      itemCount: filteredList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                color: AppColors.secondary,
                                fit: BoxFit.cover,
                                imageUrl: controller.aba[index].image,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              SizedBox(height: 5),
                              Text(
                                filteredList[index].name,
                                style: khtypographies.label(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.third,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: AppColors.third,
                      thickness: 1,
                    ),
                    VerticalScroll(
                      controller: controller,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
