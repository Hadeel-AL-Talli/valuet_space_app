import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:valuet_space_app/database/db_controller.dart';
import 'package:valuet_space_app/provider/passwords_provider.dart';
import 'package:valuet_space_app/screens/about_screen.dart';
import 'package:valuet_space_app/screens/add_password_screen.dart';
import 'package:valuet_space_app/screens/launch_screen.dart';
import 'package:valuet_space_app/screens/on_boarding.dart';
import 'package:valuet_space_app/screens/passwordsscreen.dart';
import 'package:valuet_space_app/screens/update_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbController().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PasswordsProvider>(
            create: (_) => PasswordsProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/launch_screen',
        routes: {
          '/launch_screen': (context) => LaunchScreen(),
          '/on_boarding_screen': (context) => OnBoarding(),
          '/passwords_sreen': (context) => PasswordsScreen(),
          '/addPassword_screen': (context) => AddPasswordScreen(),
         // '/updatepassword_screen':(context)=> UpdatePasswordScreen(),
          '/about_screen': (context) => AboutScreen(),
          '/on_boarding': (context) => OnBoarding(),


        },
        
      ),
    );
  }
}
