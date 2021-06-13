import 'package:flutter/material.dart';
import 'package:green_pedals/components/round_button.dart';
import 'package:green_pedals/components/round_input_field.dart';
import 'package:green_pedals/components/round_password_field.dart';
import 'package:green_pedals/constants.dart';
import 'package:green_pedals/services/auth.dart';

class UserSignUp extends StatefulWidget {
  final Function toggleView;
  UserSignUp({this.toggleView});
  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //textfield state
  String id = '';
  String name = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back2.png"),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        height: size.height,
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0, bottom: 20),
                      child: kGreenLogo,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        'SIGN UP',
                        style: kPageTitleTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    RoundedInputField(
                      hintText: 'Student ID',
                      icon: Icons.quick_contacts_mail_sharp,
                      onChanged: (value) {
                        setState(() {
                          id = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty == true || value.length < 8) {
                          return 'Enter a correct Student ID';
                        } else {
                          return null;
                        }
                      },
                    ),
                    RoundedInputField(
                      hintText: 'Name',
                      icon: Icons.account_circle,
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      validator: (value) {
                        if (value.length < 6 == true) {
                          return 'Enter your first and last name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    RoundedInputField(
                      hintText: 'Email Address',
                      icon: Icons.mail,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty == true) {
                          return 'Enter a correct Email Address';
                        } else {
                          return null;
                        }
                      },
                    ),
                    RoundedPasswordField(
                      hintText: 'Password',
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      validator: (value) {
                        if (value.length < 6 == true) {
                          return 'Enter a correct Password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    RoundButton(
                        text: 'Sign Up',
                        height: 56.0,
                        width: size.width,
                        textColor: Colors.white,
                        backgroundColor: kPrimaryColor,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            dynamic result =
                                await _auth.signUpwithemail(email, password);
                            if (result == null) {
                              setState(() =>
                                  error = 'Please Enter a valid Email Address');
                            } else {
                              //return HomePage();
                            }
                          }
                        }),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Text(
                      error,
                      style: kValidateTextStyle,
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    TextButton(
                      onPressed: widget.toggleView,
                      child: Text(
                        'Already have an Account? Sign In',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      // GestureDetector(
                      //   onTap: this.widget.toggleView(),
                      //   child: Text(
                      //     'Sign In',
                      //     style: TextStyle(
                      //       color: kPrimaryColor,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
