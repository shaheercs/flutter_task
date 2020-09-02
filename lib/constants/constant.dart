import 'package:flutter/material.dart';

enum Document { emirates_id, passport }
const base_url = 'http://appdev.cerebrum.ae/covidapi/quarantine';
const K_selection = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('images/selected.png'),
    fit: BoxFit.contain,
  ),
);

const K_H_space_twenty = SizedBox(
  height: 20.0,
);
const K_H_space_thirtyfive = SizedBox(
  height: 35.0,
);
const K_H_space_ten = SizedBox(
  height: 10.0,
);
const K_H_space_five = SizedBox(
  height: 5.0,
);
