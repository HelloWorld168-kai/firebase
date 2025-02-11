import 'package:cached_network_image/cached_network_image.dart';
import 'package:cli_firebase/controller/aba_controller.dart';
import 'package:cli_firebase/page/dontknow.dart';
import 'package:cli_firebase/page/profile.dart';
import 'package:cli_firebase/page/promotion.dart';
import 'package:cli_firebase/page/signup_and_login/log_in.dart';
import 'package:cli_firebase/page/whatever.dart';
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
          (item) => item.id >= 12 && item.id <= 19,
        )
        .toList();
    bool isHidden = true;
    return Scaffold(
      backgroundColor: Color(0xFF023048),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => LogIn(controller: controller),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
        backgroundColor: Color(0xFF023048),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/icons/messenger.png",
              width: 40,
              height: 25,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/icons/bell.png",
              width: 40,
              height: 28,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/icons/qr-code.png",
              width: 40,
              height: 25,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                            left: 12,
                            right: 12,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Container(
                            width: 390,
                            height: 160,
                            decoration: BoxDecoration(
                              color: Colors.white,
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
                                whatever(),
                                SizedBox(height: 10),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                "assets/icons/recieve.png",
                                                width: 30,
                                                height: 40,
                                                color: Color(0xFF51B9A3),
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                "Recieve Money",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              SizedBox(
                                                width: 25,
                                                height: 25,
                                                child: Image.asset(
                                                  "assets/icons/send.png",
                                                  width: 40,
                                                  height: 30,
                                                  color: Colors.red,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                "Send Money",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: 400,
                      height: 320,
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
                      child: DontKnow(controller: controller),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ដំណឹង & ប្រម៉ូសិន",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  // Clip the image with rounded corners
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "https://www.ababank.com/fileadmin/user_upload/Main_Banner/ABA-basic-banking-new_24.jpg",
                    width: 350,
                    height: 100,
                    fit:
                        BoxFit.cover, // Adjust the fit to cover the entire area
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "រកមើលសេវាកម្ម",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "រកមើលសេវាកម្ម",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                        color: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        width: 100,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          // color: Colors.black,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "https://media.licdn.com/dms/image/v2/C4E0BAQEphx-wyPi-KQ/company-logo_200_200/company-logo_200_200/0/1630636560487?e=2147483647&v=beta&t=yYrQ4qbEwxYIth-FzZE3_zUcSthDeJA2CjIOXz_hYog",
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 10),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
