// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Mytextfiled.dart';
import 'mybutton.dart';
import 'package:moments/services/Auth/Auth_service.dart';

class Loginpage extends StatefulWidget {
  final void Function()? onTap;
  const Loginpage({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool _isLoading = false; // Track loading state

  void _signin() async {
    final authService = Provider.of<Authserive>(context, listen: false);
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    try {
      await authService.signinwithemailandpassword(
        emailcontroller.text,
        passwordcontroller.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() {
        _isLoading = false; // Hide loading indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.message,
                size: 35,
                color: Colors.black,
              ),
              Text(
                "Moments",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 40),
              Mytextfield(
                controller: emailcontroller,
                hinttext: 'Email',
                obscuretext: false,
              ),
              const SizedBox(height: 20),
              Mytextfield(
                controller: passwordcontroller,
                hinttext: 'Password',
                obscuretext: true,
              ),
              const SizedBox(height: 40),
              _isLoading // Check if loading
                  ? CircularProgressIndicator() // Show loading indicator
                  : Mybutton(
                      Buttontext: 'Sign In',
                      ontap: _signin,
                    ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a Member?"),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
