import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'About',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.w700),
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          height: 500,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                  'The First Project   in eLancer training Developed by Hadeel Al-Talli , supervised by Eng.Moemen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22)),
              SizedBox(height: 20),
              Text('Skills that used in this app',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 22)),
              SizedBox(
                height: 20,
              ),
              Text(
                ' Database SQLite \n add fonts and images to app \n make the code reusable \n use provider state managment \n launch and on boarding screens \n Use url launcher to openApp   ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              )
            ],
          ),
        ));
  }
}
