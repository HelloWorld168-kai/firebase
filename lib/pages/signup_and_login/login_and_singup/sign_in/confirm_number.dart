// import 'package:cli_firebase/controllers/aba_service_controller.dart';
// import 'package:cli_firebase/pages/components/styles.dart';
// import 'package:cli_firebase/pages/signup_and_login/social_media/otp_number.dart';
// import 'package:cli_firebase/pages/typography/typography_english.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ConfirmNumber extends StatefulWidget {
//   const ConfirmNumber({
//     super.key,
//     required this.controller,
//   });

//   final ControllerAba controller;

//   @override
//   State<ConfirmNumber> createState() => _PhoneNumberState();
// }

// class _PhoneNumberState extends State<ConfirmNumber> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController phoneController = TextEditingController();
//   bool isLoading = false; // Initially false

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: Icon(Icons.arrow_back, color: AppColors.primary),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: 300,
//                 height: 250,
//                 child: Image.network(
//                   "https://img.freepik.com/premium-vector/mobile-otp-secure-verification-method-mobile-phone-hand-onetime-password-secure-transaction-security-one-time-password-verification-mobile-app-smartphone-screen-2step-verification_735449-279.jpg?semt=ais_hybrid",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(height: 50),
//               Text(
//                 "Enter your Phone Number",
//                 style: typographies.display(
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.primary,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 "We will send you 4-digit verification code",
//                 style: typographies.paragraph(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey[600],
//                 ),
//               ),
//               SizedBox(height: 30),
//               Container(
//                 width: 350,
//                 height: 55,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(7.5),
//                   border: Border.all(color: AppColors.primary),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextField(
//                           controller: phoneController,
//                           keyboardType: TextInputType.phone,
//                           decoration: InputDecoration(
//                             labelText: "Enter your phone number",
//                             labelStyle: typographies.title(
//                               color: AppColors.primary,
//                             ),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               isLoading
//                   ? CircularProgressIndicator()
//                   : ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.primary,
//                       ),
//                       onPressed: () async {
//                         () async {
//                           if (phoneController.text.isEmpty ||
//                               !phoneController.text.startsWith('+')) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                   content: Text(
//                                       "Please enter a valid phone number with country code (+855...)")),
//                             );
//                             return;
//                           }

//                           setState(() {
//                             isLoading = true;
//                           });

//                           print(
//                             "Phone number entered: ${phoneController.text}",
//                           );

//                           try {
//                             await FirebaseAuth.instance.verifyPhoneNumber(
//                               phoneNumber: phoneController.text,
//                               verificationCompleted: (phoneAuthCredential) {
//                                 setState(() {
//                                   isLoading = false;
//                                 });
//                               },
//                               verificationFailed:
//                                   (FirebaseAuthException error) {
//                                 setState(() {
//                                   isLoading = false;
//                                 });
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                       content: Text(
//                                           "Verification failed: ${error.message}")),
//                                 );
//                                 print("Error: ${error.message}");
//                               },
//                               codeSent: (verificationId, forceResendingToken) {
//                                 setState(() {
//                                   isLoading = false;
//                                 });
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => OtpNumber(
//                                       verificationId: verificationId,
//                                     ),
//                                   ),
//                                 );
//                               },
//                               codeAutoRetrievalTimeout: (verificationId) {
//                                 setState(() {
//                                   isLoading = false;
//                                 });
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                       content: Text(
//                                           "Code retrieval timeout, please try again.")),
//                                 );
//                               },
//                             );
//                           } catch (e) {
//                             setState(() {
//                               isLoading = false;
//                             });
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(content: Text("Error: $e")),
//                             );
//                             print("Error: $e");
//                           }
//                         };
//                       },
//                       child: Text(
//                         "Send Code",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
