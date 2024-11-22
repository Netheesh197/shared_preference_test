import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextFormfield extends StatelessWidget {
  String labelText;
  IconData? icon;
  TextEditingController controller;
   
   CustomTextFormfield({
    super.key,
    required this.labelText,this.icon, required this.controller

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        
        suffixIcon: Icon(icon),
        labelText: labelText,
        border: OutlineInputBorder()
      ),
    );
  }
}