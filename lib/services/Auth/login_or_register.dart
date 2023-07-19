import 'package:moments/Loginpage.dart';
import 'package:flutter/material.dart';
import 'package:moments/Registration.dart';

class Loginorregister extends StatefulWidget {
  const Loginorregister({Key? key}) : super(key: key);

  @override
  State<Loginorregister> createState() => _LoginorregisterState();
}

class _LoginorregisterState extends State<Loginorregister> {
  bool showlogin = true;

  void togglepages() {
    setState(() {
      showlogin = !showlogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showlogin) {
      return Loginpage(
        onTap: togglepages,
      );
    } else {
      return RegisteraionPage(
        onTap: togglepages,
      );
    }
  }
}
