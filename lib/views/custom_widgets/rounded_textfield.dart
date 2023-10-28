import 'package:flutter/material.dart';

class CustomRoundedTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Function onChanged;

  CustomRoundedTextField(
      {required this.labelText,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.suffixIcon,
      required this.onChanged
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => {},
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(50.0), // Adjust the radius as needed
          borderSide: BorderSide(color: Colors.grey, width: 0.3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(color: Colors.grey, width: 0.3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(color: Colors.grey, width: 0.3),
        ),
      ),
    );
  }
}

// How to use the CustomRoundedTextField:


