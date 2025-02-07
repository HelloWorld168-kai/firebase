import 'package:flutter/material.dart';

class AbaController extends StatefulWidget {
  const AbaController({super.key});

  @override
  State<AbaController> createState() => _AbaControllerState();
}

class _AbaControllerState extends State<AbaController> {
  @override
  Widget build(BuildContext context) {
    bool isHidden = true;
    return Scaffold(
      backgroundColor: Color(0xFF015F85),
      appBar: AppBar(
        backgroundColor: Color(0xFF015F85),
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
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                "assets/images/unnamed.jpg",
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hello, Kai-7!",
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "View Profile",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[300],
                                            ),
                                          ),
                                          SizedBox(width: 3),
                                          Image.asset(
                                            "assets/icons/right-arrow.png",
                                            width: 12,
                                            height: 10,
                                            fit: BoxFit.cover,
                                            color: Colors.grey[300],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 400,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xFF385C6C),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.1), // Shadow color
                            spreadRadius: 2, // How much the shadow spreads
                            blurRadius: 10, // Blur radius for a soft shadow
                            offset:
                                Offset(0, 5), // Moves shadow slightly downwar
                          ),
                        ]),
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
                            height: 180,
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
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                        width: 60,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Color(0xFF5BDAE0),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 2.5,
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Default",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Daily Expense",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
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
                  SizedBox(height: 30),
                  Center(
                    child: Container(
                      width: 400,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey[500],
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
                              width: 380,
                              height: 280,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
