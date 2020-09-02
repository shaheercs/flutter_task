import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  final String text;
  final Function onClick;
  final BoxDecoration boxDecoration;
  ToggleButton(
      {@required this.text, @required this.onClick, this.boxDecoration});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          decoration: boxDecoration,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
