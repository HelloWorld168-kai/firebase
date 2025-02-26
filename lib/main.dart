import 'package:cli_firebase/controller/aba_service_controller.dart';
import 'package:cli_firebase/page/homepage/aba_home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetStarted(
      controllerAba: ControllerAba(),
    ),
  );
}

class GetStarted extends StatefulWidget {
  final ControllerAba controllerAba;
  const GetStarted({
    super.key,
    required this.controllerAba,
  });

  @override
  State<GetStarted> createState() => _GetStarted();
}

class _GetStarted extends State<GetStarted> {
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
      home: AbaUi(
        controller: ControllerAba(),
      ),
    );
  }
}
