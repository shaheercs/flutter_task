import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void showAlert(String data, BuildContext context) {
  Alert(
    context: context,
    title: "Oops",
    desc: data,
    style: AlertStyle(
      titleStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      descStyle: TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
    ),
  ).show();
}
