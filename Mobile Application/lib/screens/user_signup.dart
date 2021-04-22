import 'package:flutter/material.dart';
import 'package:green_pedals/components/check_account_availability.dart';
import 'package:green_pedals/components/round_button.dart';
import 'package:green_pedals/components/round_input_field.dart';
import 'package:green_pedals/components/round_password_field.dart';
import 'package:green_pedals/constants.dart';
import 'package:green_pedals/screens/user_signin.dart';

class UserSignUp extends StatelessWidget {
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
                      onChanged: (value) {}),
                  RoundedInputField(
                      hintText: 'Name',
                      icon: Icons.account_circle,
                      onChanged: (value) {}),
                  RoundedInputField(
                      hintText: 'Email Address',
                      icon: Icons.mail,
                      onChanged: (value) {}),
                  RoundedPasswordField(
                    hintText: 'Password',
                    onChanged: (value) {},
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
                    onPressed: () {
                      //setState(() {});
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  AlreadyHaveAnAccountCheck(
                    signin: false,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return UserSignIn();
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
