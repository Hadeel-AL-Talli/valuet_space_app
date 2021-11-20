import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valuet_space_app/helpers/helpers.dart';
import 'package:valuet_space_app/provider/passwords_provider.dart';
import 'package:valuet_space_app/widgets/flip_card.dart';

class PasswordsScreen extends StatefulWidget {
  const PasswordsScreen({Key? key}) : super(key: key);

  @override
  _PasswordsScreenState createState() => _PasswordsScreenState();
}

class _PasswordsScreenState extends State<PasswordsScreen> with Helpers {
  @override
  void initState() {
    super.initState();
    Provider.of<PasswordsProvider>(context, listen: false).read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xF8F9FB),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Text(
              'Passwords',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/about_screen');
                  },
                  icon: Icon(Icons.info_outline),
                  color: Colors.black),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/addPassword_screen');
                  },
                  icon: Icon(Icons.add),
                  color: Colors.black),
            ]),
        body: Consumer<PasswordsProvider>(
            builder: (BuildContext context, PasswordsProvider value, child) {
          if (value.passwords.isNotEmpty) {
            return ListView.builder(
                itemCount: value.passwords.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [
                          FlipCardWidget(
                              fronttext: value.passwords[index].title,
                              backtext: 'Password :' +
                                  value.passwords[index].password),
                          GestureDetector(
                              onTap: () async {
                                await delete(value.passwords[index].id);
                              },
                              child: Icon(
                                Icons.cancel,
                                size: 30,
                                color: Colors.black45,
                              )),
                        ],
                      )
                    ],
                  );
                });
          } else {
            return Center(
                child: Column(
              children: [
                SizedBox(height: 40),
                Image.asset('images/nopasswords.png'),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'No Passwords',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'You don\'t have any passwords yet',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addPassword_screen');
                    },
                    child: Text(
                      'Create',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(0, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))))
              ],
            ));
          }
        }));
  }

  Future<void> delete(int id) async {
    bool deleted =
        await Provider.of<PasswordsProvider>(context, listen: false).delete(id);
    String message = deleted ? 'Deleted successfully' : 'Delete failed';
    showSnackBar(context: context, message: message, error: !deleted);
  }
}
