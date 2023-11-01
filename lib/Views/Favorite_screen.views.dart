// ignore_for_file: must_be_immutable, prefer_const_constructors, unnecessary_import, use_key_in_widget_constructors


import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:refactored_project/Views/home_screen_views.dart';
import 'package:refactored_project/Views/profile_views.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refactored_project/Controller/searchbar_controller.dart';

class CoffeeScreen extends StatelessWidget{
  const CoffeeScreen({super.key});

  @override
  Widget build(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
  child: SingleChildScrollView(
    child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        _greetings(),
        const SizedBox(
          height: 16,
        ),
        SearchBarController(),
        const SizedBox(
          height: 16,
        ),
        _logo(),
        const SizedBox(
          height: 16,
        ),
        _logo2(),
        const SizedBox(
          height: 16,
        ),
        _logo3(),
        const SizedBox(
          height: 16,
        )
      ],
    ),
  ),
),

    );
  }

    

AspectRatio _logo() {
    return AspectRatio(aspectRatio: 336 / 184,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), 
        color: const Color(0xFFE0F7FA),
        ),
      child: Stack(children: [
        Image.asset("assets/Images/lion_latte.jpg", 
        width: double.maxFinite, 
        height: double.maxFinite,
        fit: BoxFit.cover,),
        Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFF372E1D),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Today's Hits!",
                      style: GoogleFonts.tiltNeon(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
      ]),
        ),
      ]),
        ),
      );
  }

  AspectRatio _logo2() {
    return AspectRatio(aspectRatio: 336 / 184,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), 
        color: const Color(0xFFE0F7FA),
        ),
      child: Stack(children: [
        Image.asset("assets/Images/lavender_latte.jpg", 
        width: double.maxFinite, 
        height: double.maxFinite,
        fit: BoxFit.cover,),
         Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFF372E1D),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Today's Hits!",
                      style: GoogleFonts.tiltNeon(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
      ]),
        ),
      ]
      )
    ));
  }

AspectRatio _logo3() {
  return AspectRatio(
    aspectRatio: 336 / 184,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xFFE0F7FA),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          children: [
            Image.asset(
              "assets/Images/matchadalgona.jpg",
              width: double.maxFinite,
              height: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFF372E1D),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Today's Hits!",
                      style: GoogleFonts.tiltNeon(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


  Padding _greetings() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Just dropped last week', style: GoogleFonts.tiltNeon(
              fontSize: 20, 
              fontWeight: FontWeight.w800),
            ),
          ],
        ),
      );
  }
  
}

class BottomNavBar extends StatelessWidget {

  var menus = [
     FeatherIcons.heart,
    FeatherIcons.book,
    FeatherIcons.home,
    FeatherIcons.shoppingBag,
    Icons.person,
  ];
  var selectedMenu = FeatherIcons.heart;

  BottomNavBar({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Color(0xFF372E1D),
      type: BottomNavigationBarType.fixed,
      items: menus
          .map((e) =>
              BottomNavigationBarItem(icon: Icon(e), label: e.toString()))
          .toList(),
      currentIndex: menus.indexOf(selectedMenu),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: const Color(0xFFBFBFBF),
      onTap: (index) {
        if (menus[index] == FeatherIcons.home) {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        } 
        else if (menus[index] == Icons.person) {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => Profile(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        }
      },
    );
  }
}


  
  