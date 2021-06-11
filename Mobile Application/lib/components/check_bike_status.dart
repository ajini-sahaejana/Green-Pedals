// import 'package:flutter/material.dart';
// import 'package:green_pedals/components/round_button.dart';
// import 'package:green_pedals/constants.dart';
//
// class CheckBikeStatus extends StatelessWidget {
//   final bool status;
//   final Function press;
//   const CheckBikeStatus({
//     Key key,
//     @required this.status,
//     @required this.press,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         GestureDetector(
//           onTap: press,
//           child: RoundButton(
//             text: status ? 'Rent A Bike' : 'Return A Bike',
//             height: 120.0,
//             width: size.width,
//             textColor: Colors.white,
//             backgroundColor: kPrimaryColor,
//             onPressed: press,
//           ),
//         ),
//       ],
//     );
//   }
// }
