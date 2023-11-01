// ignore_for_file: must_be_immutable, prefer_const_constructors, unnecessary_import, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:refactored_project/Views/home_screen_views.dart';
import 'package:refactored_project/Views/welcome_views.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var FocusNodeEmail = FocusNode();
  var FocusNodePassword = FocusNode();
  bool isFocusedEmail = false;
  bool isFocusedPassword = false;

  @override
  void initState() {
    FocusNodeEmail.addListener(() {
      setState(() {
        isFocusedEmail = FocusNodeEmail.hasFocus;
      });
    });
    FocusNodePassword.addListener(() {
      setState(() {
        isFocusedPassword = FocusNodePassword.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                    );
                  },
                  icon: Icon(Icons.arrow_back_rounded),
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Let\'s Sign You In',
                    style:
                        GoogleFonts.tiltNeon(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Welcome Back',
                    style:
                        GoogleFonts.tiltNeon(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'We\'ve Been Looking For You',
                    style:
                        GoogleFonts.tiltNeon(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 60),
              const Text(
                'Email',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              TextField(
                style: GoogleFonts.tiltNeon(fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: 'Your Email',
                ),
                focusNode: FocusNodeEmail,
              ),
              SizedBox(height: 10),
              const Text(
                'Password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              TextField(
                style: GoogleFonts.tiltNeon(fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.visibility_off_outlined,
                    color: Colors.grey,
                  ),
                  hintText: 'Your Password',
                ),
                focusNode: FocusNodePassword,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF372E1D),
                  onPrimary: Color.fromARGB(255, 255, 255, 255),
                  elevation: 0,
                  textStyle: GoogleFonts.tiltNeon(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Center(
                  child: Text('Let\'s Start Brewing'),
                ),
              ),
              SizedBox(height: 20),
              // Animasi Rive di bawah tombol
              Container(
                width: double.infinity,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/Images/cat_coffe.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
