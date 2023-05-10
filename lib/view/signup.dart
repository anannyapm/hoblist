import 'package:assignment/dbfunction/dbfunction.dart';
import 'package:assignment/models/user.dart';
import 'package:assignment/view/screenhome.dart';
import 'package:assignment/view/widgets/dropdownwidget.dart';
import 'package:assignment/view/widgets/textfieldwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

String professionValue = "";

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //textediting controllers
  final _nameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    TextFieldWidget(
                        hint: 'Name',
                        label: 'Name',
                        textController: _nameController),
                    TextFieldWidget(
                      hint: 'Password',
                      label: 'Password',
                      textController: _passwordController,
                      typeValue: TextInputType.visiblePassword,
                    ),
                    TextFieldWidget(
                      hint: 'Email',
                      label: 'Email',
                      textController: _emailController,
                      typeValue: TextInputType.emailAddress,
                    ),
                    TextFieldWidget(
                      hint: 'Phone Number',
                      label: 'Phone Number',
                      textController: _phoneController,
                      typeValue: TextInputType.number,
                    ),
                    
                    const DropDownWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            addUser(context);
                          } else {
                            print('Empty fields found');
                          }
                        },
                        child: const Text('Sign Up'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addUser(BuildContext context) async {
    final _name = _nameController.text.trim();
    final _password = _passwordController.text.trim();
    final _email = _emailController.text.trim();
    final _phone = _phoneController.text.trim();
    final _profession = professionValue;

    if (_name.isEmpty ||
        _password.isEmpty ||
        _email.isEmpty ||
        _phone.isEmpty ||
        _profession == "") {
      return;
    } else {
      //reset fields
      _nameController.text = '';
      _passwordController.text = '';
      _emailController.text = '';
      _phoneController.text = '';
    }

    final userObject = UserModel(
        name: _name,
        password: _password,
        email: _email,
        phonenumber: _phone,
        profession: professionValue);
    debugPrint(userObject.toString());

    UserModel output=await addUserToDB(userObject);
    final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setString(SAVE_KEY_NAME, output.email);

      //replacing login screen as we dont want to got to backpage when back is pressed
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
  }
}
