import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart'; // Import EmailValidator

import '../widget/custom_text.dart';
import '../widget/round_button.dart';
import 'login.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final nameTextController = TextEditingController(); // Name controller
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    nameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  void signUp() async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: emailTextController.text.trim(),
          password: passwordTextController.text.trim(),
        );

        // Send email verification
        if (userCredential.user != null) {
          await userCredential.user!.updateDisplayName(nameTextController.text.trim());
          await userCredential.user!.sendEmailVerification();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Verification email sent. Please check your inbox.")),
          );
        }

        // Navigate to Login screen after signup
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign-up failed: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F9),
      appBar: AppBar(
        backgroundColor:Color(0xFFF3F4F9)
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: 'Create an account',
              fontWeight: FontWeight.w800,
              fontsize: 20,
              itemcolor: Colors.black,
            ),
            SizedBox(height: 10),
            CustomText(
              text: 'Welcome! Please enter your details.',
              fontWeight: FontWeight.w700,
              fontsize: 15,
              itemcolor: Color(0XFFC9C9CA),
            ),
            SizedBox(height: 15),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: "Name",
                      fontWeight: FontWeight.bold,
                      fontsize: 18,
                      itemcolor: Colors.black87),
                  // Name TextFormField
                  TextFormField(
                    controller: nameTextController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      prefixIcon: Icon(Icons.person_2_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12), // Circular border with radius 15
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12), // Circular border when focused
                        borderSide: BorderSide(
                          color: Colors.blue, // Border color when focused
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  // Email TextFormField
                  CustomText(
                      text: "Email",
                      fontWeight: FontWeight.bold,
                      fontsize: 18,
                      itemcolor: Colors.black87),
                  TextFormField(
                    controller: emailTextController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12), // Circular border with radius 15
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12), // Circular border when focused
                        borderSide: BorderSide(
                          color: Colors.blue, // Border color when focused
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!EmailValidator.validate(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  CustomText(
                      text: "Password",
                      fontWeight: FontWeight.bold,
                      fontsize: 18,
                      itemcolor: Colors.black87),
                  // Password TextFormField
                  TextFormField(
                    controller: passwordTextController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12), // Circular border with radius 15
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12), // Circular border when focused
                        borderSide: BorderSide(
                          color: Colors.blue, // Border color when focused
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            RoundButton(
              title: "Sign Up",
              ontab: signUp,
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Already have an account?',
                  fontWeight: FontWeight.w700,
                  fontsize: 15,
                  itemcolor: Color(0XFFC9C9CA),
                ),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },child: Text('Log in,',style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.w700
                ),))
              ],
            ),
             
          ],
        ),
      ),
    );
  }
}
