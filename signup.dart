import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_ui/feed.dart';
import 'package:mobile_ui/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;
  bool _isChecked = false;

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  icon: const Icon(Icons.clear, color: Color(0xFFBDBDBD)),
                ),
                elevation: 0,
                title: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFF5DB075),
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              customTextFormField(labelText: 'Name'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              customTextFormField(labelText: 'Email'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              customTextFormField(
                labelText: 'Password',
                isPassword: true,
                suffixIcon: GestureDetector(
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
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CheckboxListTile(
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                },
                title: const Text(
                  'I would like to receive your newsletter and other promotional information.',
                  style: TextStyle(color: Colors.black),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: const Color(0xFF5DB075),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FeedPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5DB075),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.8, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const Text(
                'Forgot your Password?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF5DB075),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
