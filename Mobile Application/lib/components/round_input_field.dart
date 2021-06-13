import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_pedals/components/text_field_container.dart';
import 'package:green_pedals/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final FormFieldValidator<String> validator;
  final FormFieldValidator<String> builder;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    @required this.hintText,
    @required this.icon,
    @required this.onChanged,
    @required this.validator,
    this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        enabled: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 5, right: 0, top: 5, bottom: 0),
          errorStyle: kValidateTextStyle,
          //contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          //errorStyle: kValidateTextStyle,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          //contentPadding: EdgeInsets.only(top: 1),
          hintStyle: TextStyle(
            color: kPrimaryColor,
          ),
          //border: InputBorder.none,
        ),
      ),
    );
  }
}
