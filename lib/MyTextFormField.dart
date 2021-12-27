import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  // final Function validator;
   String? Function(String?)? validator;
  late  Function(String?) onSaved;
   bool isPassword;
   bool isEmail;
  MyTextFormField({Key? key, 
    required this.hintText,
    required this.validator,
     required this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        // onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}
