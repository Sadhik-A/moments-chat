import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  const Mytextfield(
      {Key? key,
      required this.hinttext,
      required this.obscuretext,
      required this.controller})
      : super(key: key);
  final String hinttext;
  final bool obscuretext;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscuretext,
      decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          fillColor: Colors.white70,
          filled: true,
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.grey)),
    );
  }
}
