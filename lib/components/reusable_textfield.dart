import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function onChange;
  final TextInputType keyboardType;
  ReusableTextField(
      {@required this.hint,
      @required this.icon,
      @required this.onChange,
      this.keyboardType});
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: InkWell(
          child: Icon(icon),
        ),
        hintStyle: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
