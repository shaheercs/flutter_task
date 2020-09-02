import 'dart:convert';
import 'package:flutter_task/components/alert_dialog.dart';
import 'package:flutter_task/components/toggle_button.dart';
import 'package:flutter_task/services/network_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/components/action_button.dart';
import 'package:flutter_task/components/reusable_textfield.dart';
import 'package:flutter_task/constants/constant.dart';
import 'package:flutter_task/services/networking.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String name = "";
  String mobileNo = "";
  String emiratesID = "";
  String passportNo = "";
  Document selectedDocument = Document.emirates_id;
  void getMobileNumber(_mobileNo) {
    mobileNo = _mobileNo;
    print(mobileNo);
  }

  void getName(data) {
    name = data;
  }

  void getValidProof(data) {
    if (selectedDocument == Document.passport) {
      passportNo = data;
    } else {
      emiratesID = data;
    }
  }

  void setAsPassport() {
    setState(() {
      selectedDocument = Document.passport;
      emiratesID = "";
    });
  }

  void setAsEmiratesID() {
    setState(() {
      selectedDocument = Document.emirates_id;
      passportNo = "";
    });
  }

  void registerAction() async {
    checkInternet();
    if (name.length < 3) {
      showAlert('please enter valid name', context);
    } else if (mobileNo.length < 5) {
      showAlert('please enter valid mobile number', context);
    } else if (emiratesID.length == 0 && passportNo.length == 0) {
      showAlert('please fill valid proof', context);
    } else {
      var response = await ApiHelper()
          .registerUser(name, emiratesID, passportNo, mobileNo);
      bool status = jsonDecode(response.body)['status'];
      print(status);
      if (status) {
        Navigator.pop(context);
      } else {
        showAlert('some thing went wrong, please try again', context);
      }
    }
  }

  void checkInternet() async {
    bool internetStatus = await getStatus();
    if (!internetStatus) {
      showAlert('No internet, please try again', context);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/login_bg.png'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF1B254F),
              ),
              margin: EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Image.asset('images/house_icon.png'),
                        K_H_space_twenty,
                        Text(
                          'SELF-QUARANTINE',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        K_H_space_twenty,
                        ReusableTextField(
                          hint: 'Full Name',
                          icon: Icons.perm_identity,
                          onChange: getName,
                        ),
                        ReusableTextField(
                          hint: 'Mobile No.',
                          icon: Icons.phone_iphone,
                          onChange: getMobileNumber,
                          keyboardType: TextInputType.number,
                        ),
                        K_H_space_twenty,
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('images/selection_bg.png'),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    ToggleButton(
                                      text: 'Emirates ID',
                                      onClick: setAsEmiratesID,
                                      boxDecoration: selectedDocument ==
                                              Document.emirates_id
                                          ? K_selection
                                          : null,
                                    ),
                                    ToggleButton(
                                      text: 'Passport No.',
                                      onClick: setAsPassport,
                                      boxDecoration:
                                          selectedDocument == Document.passport
                                              ? K_selection
                                              : null,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        K_H_space_five,
                        ReusableTextField(
                          hint: selectedDocument == Document.passport
                              ? 'Passport No.'
                              : 'Emirates ID',
                          icon: Icons.description,
                          onChange: getValidProof,
                        ),
                        K_H_space_thirtyfive,
                        ActionButton(
                          text: "Register",
                          onPress: registerAction,
                        ),
                        K_H_space_twenty,
                        FlatButton(
                          child: Text(
                            'Already have an account? Log In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
