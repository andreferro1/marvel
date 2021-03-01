import 'package:flutter/material.dart';
import 'package:marvel_vrsoft/app/shared/constants/styles.dart';

class TextFieldLoginWidget extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const TextFieldLoginWidget(
      {Key key,
      @required this.hintText,
      this.obscureText = false,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
          color: THIRD_COLOR,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          hintText: hintText,
        ),
        cursorColor: Colors.white,
        obscureText: obscureText,
      ),
    );
  }
}
