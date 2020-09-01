import 'package:flutter/material.dart';
import 'package:flutter_task/constants/constant.dart';
import 'package:flutter_task/services/networking.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({this.mobileNo});
  final String mobileNo;
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String mobileNumber;
  TextEditingController controller;
  String otp;

  @override
  void initState() {
    super.initState();
    mobileNumber = widget.mobileNo;
    controller = TextEditingController(text: widget.mobileNo);
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
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'SELF-QUARANTINE',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          onChanged: (data) {
                            mobileNumber = data;
                          },
                          controller: controller,
                          decoration: InputDecoration(
                            hintText: 'Mobile No.',
                            suffixIcon: InkWell(
                              child: Icon(Icons.phone_iphone),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35.0,
                        ),
                        Text(
                          'Enter OTP',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'Enter your 5-digit OTP',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        K_H_space_ten,
                        Container(
                          margin: EdgeInsets.only(
                            left: 40,
                            right: 40,
                          ),
                          child: TextField(
                            onChanged: (data) {
                              otp = data;
                            },
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              letterSpacing: 10,
                              fontSize: 25,
                            ),
                            maxLength: 5,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        K_H_space_twenty,
                        FlatButton(
                          child: Text(
                            'Didn\'t get a code? Resent code',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                          onPressed: () async {
                            var response =
                                await ApiHelper().resentOTP(mobileNumber);
                            print('register button pressed');
                          },
                        ),
                        K_H_space_twenty,
                        GestureDetector(
                          onTap: () async {
                            var response =
                                await ApiHelper().verifyUser(mobileNumber, otp);
                            if (response.statusCode == 200) {
                              Navigator.pop(context);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/selected.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 50.0,
                              ),
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
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
