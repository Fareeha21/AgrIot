import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  IconData icon;

  String hint;
  TextEditingController controller;
  String label;
  bool obscureText;

  CustomTextField({this.icon,this.hint,this.controller,this.label,this.obscureText=false,});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      obscureText: this.obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        
        prefixIcon: Icon(
          icon,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            25,
          ),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
