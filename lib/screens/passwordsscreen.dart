import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valuet_space_app/helpers/helpers.dart';
import 'package:valuet_space_app/provider/passwords_provider.dart';
import 'package:valuet_space_app/screens/add_password_screen.dart';
import 'package:valuet_space_app/screens/update_password.dart';
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
        backgroundColor: Colors.white,
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
                  icon: const Icon(Icons.info_outline),
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
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: [
                              Colors.blue.shade400,
                              Colors.blue.shade200,
                            ])),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                FlipCardWidget(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                UpdatePasswordScreen(
                                                    password:
                                                        value.passwords[index]),
                                          ));
                                    },
                                    fronttext: value.passwords[index].title,
                                    backtext: 'Password :' +
                                        value.passwords[index].password),
                                GestureDetector(
                                    onTap: () async {
                                      await delete(value.passwords[index].id);
                                    },
                                    child: const Icon(
                                      Icons.cancel,
                                      size: 30,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 20),
                              child: GestureDetector(
                                onTap: () async {
                                  String _url = value.passwords[index].website;

                                  await canLaunch('https://' + '$_url')
                                      ? await launch('https://' + '$_url')
                                      : throw 'Could not launch ';
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Open App',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                        )),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                });
          } else {
            return Center(
                child: Column(
              children: [
                SizedBox(height: 40),
                Image.asset('images/nodata.png'),
                const SizedBox(
                  height: 30,
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
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addPassword_screen');
                    },
                    child: const Text(
                      'Create',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 50),
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
