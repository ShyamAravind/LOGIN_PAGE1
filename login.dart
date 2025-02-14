import 'package:flutter/material.dart';
import 'package:mobile_ui/feed.dart';

import 'Signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  Widget customTextFormField({
    required String labelText,
    bool isPassword = false,
    TextEditingController? controller,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword ? _obscureText : false,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xFFBDBDBD)),
        filled: true,
        fillColor: const Color(0xFFF6F6F6),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Color(0xFFE8E8E8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Color(0xFFE8E8E8),
          ),
        ),
        suffixIcon: isPassword ? suffixIcon : null,
      ),
      style: const TextStyle(color: Color(0xFFBDBDBD)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth * 0.1;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          children: [
            const SizedBox(height: 30),
            PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
                leading: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    );
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      color: Color(0xFF5DB075),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            customTextFormField(labelText: 'Email'),
            const SizedBox(height: 15.0),
            customTextFormField(
              labelText: 'Password',
              isPassword: true,
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Text(
                      _obscureText ? 'Show' : 'Hide',
                      style: const TextStyle(
                        color: Color(0xFF5DB075),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(height: 20),
            FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: 0.8,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5DB075),
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Forgot your Password ?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color(0xFF5DB075),
              ),
            )
          ],
        ),
      ),
    );
  }
}
