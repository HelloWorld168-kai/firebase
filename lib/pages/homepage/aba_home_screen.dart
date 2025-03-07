import 'package:cli_firebase/controllers/aba_service_controller.dart';
import 'package:cli_firebase/pages/homepage/govern_container.dart';
import 'package:cli_firebase/pages/homepage/government_service.dart';
import 'package:cli_firebase/pages/homepage/oftern_scroll.dart';
import 'package:cli_firebase/pages/typography/typography_khmer.dart';
import 'package:cli_firebase/pages/utils/themes_color.dart';
import 'package:cli_firebase/pages/homepage/widgets/aba_info_img.dart';
import 'package:cli_firebase/pages/homepage/widgets/brand_services_section.dart';
import 'package:cli_firebase/pages/homepage/widgets/aba_center_widget.dart';
import 'package:cli_firebase/pages/homepage/widgets/aba_information.dart';
import 'package:cli_firebase/pages/homepage/widgets/user_profile.dart';
import 'package:cli_firebase/pages/homepage/receive_send_section.dart';
import 'package:cli_firebase/pages/homepage/see_all_button.dart';
import 'package:cli_firebase/pages/homepage/widgets/services_section.dart';
import 'package:cli_firebase/pages/homepage/widgets/default_widget.dart';
import 'package:flutter/material.dart';

class AbaHomeScreen extends StatefulWidget {
  const AbaHomeScreen({
    super.key,
    required this.controller,
  });
  final ControllerAba controller;

  @override
  State<AbaHomeScreen> createState() => _AbaControllerState();
}

class _AbaControllerState extends State<AbaHomeScreen> {
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/unnamed.jpg'),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.network(
              "https://cdn-icons-png.flaticon.com/128/1370/1370907.png",
              color: AppColors.third,
              height: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.network(
              "https://cdn-icons-png.flaticon.com/128/3602/3602145.png",
              color: AppColors.third,
              height: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.network(
              "https://api.nuget.org/v3-flatcontainer/kh.org.nbc.bakongkhqr/1.0.0.9/icon",
              height: 30,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF023048),
              Color(0xFF012130),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    UserProfile(),
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
                                        child: Row(
                                          children: [
                                            Text(
                                              "\$8.00",
                                              style: TextStyle(
                                                fontSize: 28,
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
                                                    BorderRadius.circular(10),
                                                color: Colors.black12,
                                              ),
                                              child: Image.asset(
                                                "assets/icons/view.png",
                                                width: 10,
                                                color: Color(0xFF385C6C),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  DefaultWidget(),
                                  SizedBox(height: 10),
                                  ReceiveSendSection(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    AbaCenterWidget(controller: controller),
                  ],
                ),
              ),
              // SizedBox(height: 5),
              Information(controller: controller),
              SizedBox(height: 10),
              AbaInfoImg(),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ServicesSection(controller: controller),
                  SizedBox(width: 60),
                  SeeAllButton(controller: controller),
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
              SizedBox(height: 30),
              GovernmentService(
                filteredList: filteredList,
                controller: controller,
              ),
              SizedBox(height: 20),
              GovernContainer(),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(right: 210),
                child: Text(
                  "ការទូទាត់ញឹកញាក់",
                  style: khtypographies.display(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              OfternScroll(),
              SizedBox(height: 20),
              Container(
                width: 130,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 12.5, top: 7.5),
                  child: Text(
                    "កែអេក្រង់ដើម",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
