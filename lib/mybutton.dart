import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  const Mybutton({Key? key, required this.Buttontext, this.ontap})
      : super(key: key);
  final String Buttontext;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            Buttontext,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
