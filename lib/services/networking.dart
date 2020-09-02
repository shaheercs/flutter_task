import 'dart:convert';
import 'package:flutter_task/constants/constant.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  /// when refer the flutter task pdf i couldn't understand the overall concept, example to verify the otp
  /// no body property is found in the pdf so i have hard coded to get overall functionality.

  Future<http.Response> postMobileNumber(String _mobileNo) async {
    var response = await http.post(
      base_url + '/login',
      headers: <String, String>{'content-type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        "mobilenumber": _mobileNo,
        "languageid": 1033,
        "mobileapplicationid": 69,
        "mobileostype": 1,
        "autologin": false
      }),
    );
    return response;
  }

  Future<http.Response> registerUser(String name, String emiratesID,
      String passportNo, String mobileNo) async {
    var response = await http.post(
      base_url + '/login',
      headers: <String, String>{'content-type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        "name": name,
        "emiratesid": emiratesID,
        "passportnumber": passportNo,
        "mobilenumber": mobileNo,
        "emailid": "demo@aa.ae",
        "dateofbirth": 1586775847000,
        "languageid": 1033,
        "mobileapplicationid": 69,
        "mobileostype": 1
      }),
    );
    return response;
  }

  Future<http.Response> verifyUser(String mobileNumber, String otp) async {
    if (otp.length == 5) {
      var response = await http.post(
        base_url + '/updateusersmsverified',
        headers: <String, String>{'content-type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          "languageid": 1033,
          "mobilenumber": mobileNumber,
          "mobileapplicationid": 69,
          "regionuid": "5e96e38885871511baebd7a3",
          "tenantuid": "5e94733af30c55d22c9b23bc",
          "assetid": "4b1b11f3-92de-4a62-aaaa-272da7829535",
          "useruid": "5e96ee08ef803s7f4b5e7684"
        }),
      );
      return response;
    }
  }

  Future<http.Response> resentOTP(String mobileNumber) async {
    var response = await http.post(
      base_url + '/resendsmsforuser',
      headers: <String, String>{'content-type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        "mobilenumber": mobileNumber,
        "languageid": 1033,
        "mobileapplicationid": 69,
        "regionuid": "5e96e38885871511baebd7a3",
        "businessunituid": "5e945b58f30c55d22c9a7051",
        "tenantuid": "5e94733af30c55d22c9b23bc",
        "assetid": "4b1b11f3-92de-4a62-aaaa-272da7829535",
        "useruid": "5e96ee08ef803s7f4b5e7684"
      }),
    );
    print(response.statusCode);
  }
}
