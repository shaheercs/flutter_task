import 'package:flutter/material.dart';
import 'package:flutter_task/constants/constant.dart';
import 'package:flutter_task/services/networking.dart';

enum Document { emirates_id, passport }

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String name;
  String mobileNo;
  String emiratesID = "";
  String passportNo = "";
  Document selectedDocument = Document.emirates_id;
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
                        TextField(
                          onChanged: (data) {
                            name = data;
                          },
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            suffixIcon: InkWell(
                              child: Icon(Icons.perm_identity),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextField(
                          onChanged: (data) {
                            mobileNo = data;
                          },
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
                        K_H_space_twenty,
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('images/selection_bg.png'),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedDocument =
                                                Document.emirates_id;
                                            passportNo = "";
                                          });
                                        },
                                        child: Container(
                                          decoration: selectedDocument ==
                                                  Document.emirates_id
                                              ? K_selection
                                              : null,
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              'Emirates ID',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedDocument =
                                                Document.passport;
                                            emiratesID = "";
                                          });
                                        },
                                        child: Container(
                                          decoration: selectedDocument ==
                                                  Document.passport
                                              ? K_selection
                                              : null,
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              'Passport No.',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Passport No.',
                            suffixIcon: InkWell(
                              child: Icon(Icons.description),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        K_H_space_thirtyfive,
                        GestureDetector(
                          onTap: () async {
                            var response = await ApiHelper().registerUser(
                                name, emiratesID, passportNo, mobileNo);
                            print(response.body);
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
                                'Register',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
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
