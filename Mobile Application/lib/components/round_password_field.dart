import 'package:flutter/material.dart';
import 'package:green_pedals/components/text_field_container.dart';
import 'package:green_pedals/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final FormFieldValidator<String> builder;
  final String hintText;
  const RoundedPasswordField({
    Key key,
    @required this.hintText,
    @required this.onChanged,
    @required this.validator,
    this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          //contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          errorStyle: kValidateTextStyle,
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
          //border: InputBorder.none,
        ),
      ),
    );
  }
}
