import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:valuet_space_app/screens/launch_screen.dart';
import 'package:valuet_space_app/screens/on_boarding_screen.dart';
import 'package:valuet_space_app/screens/passwordsscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: '/launch_screen',
      routes:{
        '/launch_screen':(context) => LaunchScreen(),
       '/on_boarding_screen':(context)=> OnBoardingScreen(),
        '/passwords_sreen' : (context) => PasswordsScreen(),
      // '/addPassword_screen': (context) => AddPasswordScreen(),
      //'about_screen' : (context) => AboutScreen(),


      },
      localizationsDelegates: [
       GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
     
      

      
    );
  }
}