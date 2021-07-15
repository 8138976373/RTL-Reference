import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final TextInputType keyBoardType;
  final TextEditingController textEditingController;
  const CommonTextField({
    Key? key,
    this.hintText,
    required this.keyBoardType,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
        ),
        keyboardType: keyBoardType,
      ),
    );
  }
}