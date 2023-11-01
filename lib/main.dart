import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:refactored_project/Views/splash_screen_views.dart';


void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Coffee Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black), 
        useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false, 
        home: const SplashScreen()
    );
  }
}

// Future main() async {
//   await DotEnv().load(fileName: '.env.project');
//   runApp(NYTBooksApp());
// }

// class NYTBooksApp extends StatelessWidget {
//   @override 
//   Widget build(BuildContext context) {
//     final appTitle = "NYT Books";

//     return MaterialApp(
//       title: appTitle, 
//       theme: new ThemeData(
//         primaryColor: Colors.white,
//       ),
      
//       home: SplashScreen()
//     );
//   }
// }