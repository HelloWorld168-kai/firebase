import 'package:cli_firebase/controller/aba_service_controller.dart';
import 'package:cli_firebase/page/utils/themes_color.dart';
import 'package:cli_firebase/page/homepage/aba_info_img.dart';
import 'package:cli_firebase/page/homepage/brand_services_section.dart';
import 'package:cli_firebase/page/homepage/aba_center_widget.dart';
import 'package:cli_firebase/page/homepage/aba_information.dart';
import 'package:cli_firebase/page/homepage/user_profile.dart';
import 'package:cli_firebase/page/homepage/receive_send_section.dart';
import 'package:cli_firebase/page/homepage/see_all_button.dart';
import 'package:cli_firebase/page/homepage/services_section.dart';
import 'package:cli_firebase/page/homepage/default_widget.dart';
import 'package:flutter/material.dart';

class AbaUi extends StatefulWidget {
  const AbaUi({
    super.key,
    required this.controller,
  });
  final ControllerAba controller;

  @override
  State<AbaUi> createState() => _AbaControllerState();
}

class _AbaControllerState extends State<AbaUi> {
  final textCtrl = TextEditingController();
  void Function()? onTap;
  void Function(String)? onSubmitted;

  final controller = ControllerAba();
  @override
  Widget build(BuildContext context) {
    final filteredList = controller.aba
        .where(
          (item) => item.id >= 12 && item.id <= 16,
        )
        .toList();
    bool isHidden = true;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.network(
              "https://cdn-icons-png.flaticon.com/128/1370/1370907.png",
              color: AppColors.third,
              height: 25,
              fit: BoxFit.contain,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.network(
              "https://cdn-icons-png.flaticon.com/128/3602/3602145.png",
              color: AppColors.third,
              height: 25,
              fit: BoxFit.contain,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.network(
              "https://api.nuget.org/v3-flatcontainer/kh.org.nbc.bakongkhqr/1.0.0.9/icon",
              // color: AppColors.third,
              height: 30,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    profile(),
                    SizedBox(height: 20),
                    Container(
                      width: 400,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xFF012032),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.1), // Shadow color
                            spreadRadius: 2, // How much the shadow spreads
                            blurRadius: 10, // Blur radius for a soft shadow
                            offset:
                                Offset(0, 5), // Moves shadow slightly downwar
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              right: 12,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Container(
                              width: 390,
                              height: 160,
                              decoration: BoxDecoration(
                                color: AppColors.dark,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 15,
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  isHidden
                                                      ? "*****"
                                                      // ignore: dead_code
                                                      : "\$0.00000",
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.third,
                                                  ),
                                                ),
                                                SizedBox(width: 15),
                                                Container(
                                                  width: 30,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.black12,
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(
                                                        () {
                                                          isHidden =
                                                              !isHidden; // Toggle state
                                                        },
                                                      );
                                                    },
                                                    child: Image.asset(
                                                      isHidden
                                                          ? "assets/icons/view.png"
                                                          // ignore: dead_code
                                                          : "assets/icons/hide.png", // Change icon
                                                      width: 10,
                                                      color: Color(0xFF385C6C),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Default(),
                                  SizedBox(height: 10),
                                  RecieveAndSend(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    center(controller: controller),
                  ],
                ),
              ),
              // SizedBox(height: 5),
              Information(controller: controller),
              SizedBox(height: 10),
              aba_information_img(),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  services(controller: controller),
                  SizedBox(width: 110),
                  SeeAll(controller: controller),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              brand_services(
                filteredList: filteredList,
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
