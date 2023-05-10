import 'dart:ui';

import 'package:assignment/dbfunction/dbfunction.dart';
import 'package:assignment/models/user.dart';
import 'package:assignment/view/screenhome.dart';
import 'package:assignment/view/signup.dart';
import 'package:assignment/view/widgets/textfieldwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFieldWidget(
                            hint: 'Name',
                            label: 'Name',
                            textController: _usernameController),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          hint: 'Password',
                          label: 'Password',
                          textController: _passwordController,
                          typeValue: TextInputType.visiblePassword,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              checkLogin(context);
                            } else {
                              print('Data Empty');
                            }
                          },
                          child: Text(
                            'Login',
                          ),
                        )
                      ],
                    ),
                  ),
                  
                      ElevatedButton(
                                        onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => SignUp()));
                                        },
                                        child: Text('Sign Up',
                                        ),
                                      )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //function to validate
  //build context passed for snackbar. it needs context from widget to be passed here.
  void checkLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    List<UserModel> users = userValueNotifier.value;
    for (var val in users) {
      if (val.name == _username && val.password == _password) {
        //go to home

        //setting value of savekeyname to true when credentials are correct.
        final _sharedPrefs = await SharedPreferences.getInstance();
        await _sharedPrefs.setBool(SAVE_KEY_NAME, true);

        //replacing login screen as we dont want to got to backpage when back is pressed
        Navigator.of(ctx).pushReplacement(
            MaterialPageRoute(builder: (ctx1) => ScreenHome()));
      } else {
        //popup on invalid data
        print('Invalid credentials');

        //since scaffold inside buildcontext we are calling from outside it, we are using scaffoldmessenger
        ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
            margin: EdgeInsets.all(10),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 5),
            backgroundColor: Colors.redAccent,
            content: Text('Invalid Username or Password')));
      }
    }
  }
}
