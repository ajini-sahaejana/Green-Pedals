import 'package:flutter/material.dart';
import 'package:green_pedals/components/text_field_container.dart';
import 'package:green_pedals/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  const RoundedPasswordField({
    Key key,
    @required this.hintText,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          contentPadding: EdgeInsets.only(top: 15),
          hintStyle: TextStyle(
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
