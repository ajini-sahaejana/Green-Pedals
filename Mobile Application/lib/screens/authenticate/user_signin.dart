import 'package:flutter/material.dart';
import 'package:green_pedals/components/round_button.dart';
import 'package:green_pedals/components/round_input_field.dart';
import 'package:green_pedals/components/round_password_field.dart';
import 'package:green_pedals/constants.dart';
import 'package:green_pedals/services/auth.dart';

class UserSignIn extends StatefulWidget {
  final Function toggleView;
  UserSignIn({this.toggleView});
  @override
  _UserSignInState createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //textfield state
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
                        'SIGN IN',
                        style: kPageTitleTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.21,
                    ),
                    RoundedInputField(
                      hintText: 'Email Address',
                      icon: Icons.email,
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
                      text: 'Sign In',
                      height: 56.0,
                      width: size.width,
                      textColor: Colors.white,
                      backgroundColor: kPrimaryColor,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result =
                              await _auth.signInwithemail(email, password);
                          if (result == null) {
                            setState(() {
                              error =
                                  'We counld not find a matching account. Please Try Again';
                            });
                            // setState(() => error =
                            //     'We were not able to find your accountPlease Try Again');
                          } else {
                            //return HomePage();
                          }
                        }
                        // print(email);
                        // print(password);
                        // dynamic result = await _auth.signInAnon();
                        // if (result == null) {
                        //   print('Error Signing In');
                        // } else {
                        //   print('Signed In');
                        //   print(result.uid);
                        // }
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => HomePage(),
                        //   ),
                        // );
                      },
                    ),
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
                        'Don\'t have an Account? Sign Up',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      // GestureDetector(
                      //   onTap: this.widget.toggleView(),
                      //   child: Text(
                      //     'Sign Up',
                      //     style: TextStyle(
                      //       color: kPrimaryColor,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       'Don\'t have an Account? ',
                    //       style: TextStyle(color: kPrimaryColor),
                    //     ),
                    //     GestureDetector(
                    //       onTap: widget.toggleView(),
                    //       child: Text(
                    //         'Sign Up',
                    //         style: TextStyle(
                    //           color: kPrimaryColor,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // AlreadyHaveAnAccountCheck(
                    //   signin: true,
                    //   press: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) {
                    //           return UserSignUp();
                    //         },
                    //       ),
                    //     );
                    //   },
                    // ),
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
