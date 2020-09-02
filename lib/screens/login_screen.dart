import 'package:flutter/material.dart';
import 'package:flutter_task/components/action_button.dart';
import 'package:flutter_task/components/alert_dialog.dart';
import 'package:flutter_task/components/reusable_textfield.dart';
import 'package:flutter_task/constants/constant.dart';
import 'package:flutter_task/screens/otp_screen.dart';
import 'package:flutter_task/services/network_status.dart';
import 'package:flutter_task/services/networking.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String mobileNumber;
  void getMobileNumber(_mobileNo) {
    mobileNumber = _mobileNo;
    print(mobileNumber);
  }

  void userLogin() async {
    bool status = await getStatus();
    if (!status) {
      showAlert('No internet, please try again', context);
      return;
    }
    if (mobileNumber.length > 5) {
      var response = await ApiHelper().postMobileNumber(mobileNumber);
      print(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(mobileNo: mobileNumber),
          ),
        );
      }
    } else {
      showAlert("please enter valid mobile No.", context);
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
                          hint: 'Mobile No.',
                          icon: Icons.phone_iphone,
                          onChange: getMobileNumber,
                          keyboardType: TextInputType.number,
                        ),
                        K_H_space_thirtyfive,
                        ActionButton(
                          text: "Log In",
                          onPress: userLogin,
                        ),
                        K_H_space_twenty,
                        FlatButton(
                          child: Text(
                            'Don\'t have an account? Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                          onPressed: () {
                            print('register button pressed');
                            Navigator.pushNamed(context, '/registration');
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
