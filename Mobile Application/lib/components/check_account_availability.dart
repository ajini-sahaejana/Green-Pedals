// import 'package:flutter/material.dart';
// import 'package:green_pedals/constants.dart';
//
// class AlreadyHaveAnAccountCheck extends StatelessWidget {
//   final bool signin;
//   final Function press;
//   const AlreadyHaveAnAccountCheck({
//     Key key,
//     @required this.signin,
//     @required this.press,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           signin ? 'Don\'t have an Account? ' : 'Already have an Account? ',
//           style: TextStyle(color: kPrimaryColor),
//         ),
//         GestureDetector(
//           onTap: press,
//           child: Text(
//             signin ? 'Sign Up' : 'Sign In',
//             style: TextStyle(
//               color: kPrimaryColor,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
