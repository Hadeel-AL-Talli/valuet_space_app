import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valuet_space_app/helpers/helpers.dart';
import 'package:valuet_space_app/models/passwordmodel.dart';
import 'package:valuet_space_app/provider/passwords_provider.dart';
import 'package:valuet_space_app/widgets/text_field.dart';

class AddPasswordScreen extends StatefulWidget {
  AddPasswordScreen({Key? key}) : super(key: key);

  @override
  _AddPasswordScreenState createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends State<AddPasswordScreen> with Helpers {
  late TextEditingController _titleTextController;
  late TextEditingController _loginAccountTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _websiteTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleTextController = TextEditingController();
    _loginAccountTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _websiteTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleTextController.dispose();
    _loginAccountTextController.dispose();
    _passwordTextController.dispose();
    _websiteTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black)),
        title: const Text(
          'New Password',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: 22,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          height: 500,
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              const Text(
                'Title',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextFeild(_titleTextController, 'title'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Login Account',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextFeild(_loginAccountTextController, 'LoginAccount'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Password',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextFeild(_passwordTextController, 'Password'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Website',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextFeild(_websiteTextController, 'Website'),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  await performCreate();
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> performCreate() async {
    if (checkData()) {
      await create();
    }
  }

  bool checkData() {
    if (_titleTextController.text.isNotEmpty &&
        _loginAccountTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty &&
        _websiteTextController.text.isNotEmpty) {
      return true;
    }
    //SNACKBAR
    showSnackBar(
        context: context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> create() async {
    bool created = await Provider.of<PasswordsProvider>(context, listen: false)
        .create(password);
    if (created) clear();
    String message = created ? 'Created successfully' : 'Create failed';
    showSnackBar(context: context, message: message, error: !created);
  }

  Passwords get password {
    Passwords c = Passwords();
    c.title = _titleTextController.text;
    c.loginAccount = _loginAccountTextController.text;
    c.password = _passwordTextController.text;
    c.website = _websiteTextController.text;

    return c;
  }

  void clear() {
    _titleTextController.text = '';
    _loginAccountTextController.text = '';
    _passwordTextController.text = '';
    _websiteTextController.text = '';
  }
}
