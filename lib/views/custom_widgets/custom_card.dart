import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget image;
  const CustomCard({
    super.key,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(25.0), // Adjust the radius as needed
        ),
        elevation: 5,
        color: Colors.white,
        child: SizedBox(
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width / 4,
            child: image),
      ),
    );
  }
}