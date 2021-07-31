import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  var onPressed;
  String buttonText;
  MaterialStateProperty<Color>? backgroundColor;
  Color? textColor;
  FontWeight? fontWeight;

  CustomButton(
      {Key? key,
      this.backgroundColor,
      this.textColor,
      required this.onPressed,
      this.fontWeight,
      required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: backgroundColor,
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: textColor,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
