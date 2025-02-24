import 'package:flutter/material.dart';

class aba_information_img extends StatelessWidget {
  const aba_information_img({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            fit: BoxFit.cover, // Adjust the fit to cover the entire area
          ),
        ),
      ),
    );
  }
}
