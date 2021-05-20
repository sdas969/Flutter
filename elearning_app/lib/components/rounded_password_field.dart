import 'package:flutter/material.dart';
import 'package:elearning_app/components/text_field_container.dart';
import 'package:elearning_app/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final TextEditingController controller;
  const RoundedPasswordField({Key? key, required this.controller})
      : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: widget.controller,
        keyboardType: TextInputType.visiblePassword,
        obscureText: _obscureText,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            splashRadius: 0.01,
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            color:
                _obscureText ? kPrimaryColor.withOpacity(0.5) : kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
