import 'package:flutter/material.dart';
import 'package:green_pedals/components/check_account_availability.dart';
import 'package:green_pedals/components/round_button.dart';
import 'package:green_pedals/components/round_input_field.dart';
import 'package:green_pedals/components/round_password_field.dart';
import 'package:green_pedals/constants.dart';
import 'package:green_pedals/screens/homepage.dart';
import 'package:green_pedals/screens/user_signup.dart';

class UserSignIn extends StatefulWidget {
  @override
  _UserSignInState createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
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
                      'SIGN IN',
                      style: kPageTitleTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.21,
                  ),
                  RoundedInputField(
                      hintText: 'Student ID',
                      icon: Icons.person,
                      onChanged: (value) {}),
                  RoundedPasswordField(
                    hintText: 'Password',
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  RoundButton(
                    text: 'Sign In',
                    height: 56.0,
                    width: size.width,
                    textColor: Colors.white,
                    backgroundColor: kPrimaryColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  AlreadyHaveAnAccountCheck(
                    signin: true,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return UserSignUp();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
