import 'dart:io';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function onPressed;
  String text;

  CustomButton({
    this.onPressed,
    this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            25,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
