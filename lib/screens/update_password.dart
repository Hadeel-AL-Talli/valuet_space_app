import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valuet_space_app/helpers/helpers.dart';
import 'package:valuet_space_app/models/passwordmodel.dart';
import 'package:valuet_space_app/provider/passwords_provider.dart';
import 'package:valuet_space_app/widgets/text_field.dart';

class UpdatePasswordScreen extends StatefulWidget {
  UpdatePasswordScreen({Key? key, required this.password}) : super(key: key);
  Passwords password;

  @override
  _UpdatePasswordScreenState createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen>
    with Helpers {
  late TextEditingController _titleTextController;
  late TextEditingController _loginAccountTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _websiteTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleTextController = TextEditingController(text: widget.password.title);
    _loginAccountTextController =
        TextEditingController(text: widget.password.loginAccount);
    _passwordTextController = TextEditingController(text: widget.password.password);
    _websiteTextController = TextEditingController(text: widget.password.website);
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
          'Update Password',
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
                  await performUpdate();
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

  Future<void> performUpdate() async {
    if (checkData()) {
      await update();
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

  Future<void> update() async {
    bool updated = await Provider.of<PasswordsProvider>(context, listen: false)
        .update(password);
    String message = updated ? 'Updated successfully' : 'Update failed';
    showSnackBar(context: context, message: message, error: !updated);
    if (updated) Navigator.pop(context);
  }

  Passwords get password {
    Passwords c = widget.password;
    c.title = _titleTextController.text;
    c.loginAccount = _loginAccountTextController.text;
    c.password = _passwordTextController.text;
    c.website = _websiteTextController.text;

    return c;
  }
}
