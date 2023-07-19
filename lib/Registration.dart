import 'package:moments/services/Auth/Auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Mytextfiled.dart';
import 'mybutton.dart';

class RegisteraionPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisteraionPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<RegisteraionPage> createState() => _RegisteraionPageState();
}

class _RegisteraionPageState extends State<RegisteraionPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  bool _isLoading = false; // Track loading state

  void _signup() async {
    if (passwordcontroller.text != confirmpasswordcontroller.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords don't match")),
      );
      return;
    }

    final authService = Provider.of<Authserive>(context, listen: false);

    setState(() {
      _isLoading = true; // Show loading indicator
    });

    try {
      await authService.signupwithemailandpassword(
        emailcontroller.text,
        passwordcontroller.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                const Icon(
                  Icons.message,
                  size: 35,
                  color: Colors.black,
                ),
                const Text(
                  "Moments",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 40),
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
                const SizedBox(height: 20),
                Mytextfield(
                  controller: confirmpasswordcontroller,
                  hinttext: 'Confirm Password',
                  obscuretext: true,
                ),
                const SizedBox(height: 40),
                _isLoading // Check if loading
                    ? CircularProgressIndicator() // Show loading indicator
                    : Mybutton(
                        Buttontext: 'Sign Up',
                        ontap: _signup,
                      ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already a User?"),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login Now",
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
      ),
    );
  }
}
