import 'package:cli_firebase/controllers/aba_service_controller.dart';
import 'package:cli_firebase/pages/signup_and_login/log_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("Firebase successfully initialized!");
  final ControllerAba controller = ControllerAba();
  await Firebase.initializeApp();
  runApp(
    GetStarted(
      controller: controller,
    ),
  );
}

class GetStarted extends StatefulWidget {
  final ControllerAba controller;

  const GetStarted({
    super.key,
    required this.controller,
  });

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: LogIn(
        controller: widget.controller,
      ),
    );
  }
}
