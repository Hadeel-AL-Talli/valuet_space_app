import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordsScreen extends StatefulWidget {
  const PasswordsScreen({ Key? key }) : super(key: key);

  @override
  _PasswordsScreenState createState() => _PasswordsScreenState();
}

class _PasswordsScreenState extends State<PasswordsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text('Passwords', style:TextStyle(color: Colors.black , fontFamily: 'Poppins')),
      ),
      body: null,

      
    );
  }
}