import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final TextEditingController? controller;
  const MyTextField(
      {super.key, this.hintText = '', this.icon, this.controller});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 18,
      child: TextField(
        controller: controller,
        scrollPadding: EdgeInsets.zero,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 18),
          prefixIcon: Icon(icon, size: 18),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
