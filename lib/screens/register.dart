import 'dart:convert';

import 'package:app_quanlythietbi/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../component/button.dart';
import '../component/contrast.dart';

class Register_Screen extends StatefulWidget {
  const Register_Screen({Key? key}) : super(key: key);
  static const String id = 'register';

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  TextEditingController user = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  Future register() async {
    var url = "http://192.168.1.6:8012/php_connect/register.php";
    var response = await http.post(body: {
      "username": user.text,
      "fullname": name.text,
      "password": password.text
    }, Uri.parse(url));
    var data = json.decode(response.body);
    print(user.text);
    print(password.text);
    if (data == "Error") {
      EasyLoading.showError(
        "Tài khoản đã tồn tại !",
        duration: Duration(milliseconds: 1300),
        maskType: EasyLoadingMaskType.black,
      );
    } else {
      EasyLoading.showSuccess(
        "Đăng ký thành công !",
        duration: Duration(milliseconds: 1300),
        maskType: EasyLoadingMaskType.black,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login_Screen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Chào mừng bạn trở lại",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 34,
                color: Colors.black,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 50.0,
          ),
          TextFormField(
            controller: user,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                prefixIcon: Icon(
                  FontAwesomeIcons.envelope,
                  size: 26,
                ),
                hintText: 'Tài khoản',
                hintStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: name,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                prefixIcon: Icon(
                  FontAwesomeIcons.user,
                  size: 26,
                ),
                hintText: 'Họ và tên',
                hintStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            controller: password,
            obscureText: true,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            decoration: kTextFieldDecoration.copyWith(
              prefixIcon: Icon(
                FontAwesomeIcons.lock,
                size: 26,
              ),
              hintText: 'Mật khẩu',
              hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Checkbox(
              //     value: showSpinner,
              //     onChanged: (value) {
              //       setState(() {
              //         showSpinner = value;
              //         print(showSpinner);
              //       });
              //     }),
              // Text(
              //   'Lưu thông tin đăng nhập',
              //   style: TextStyle(
              //       fontSize: 19,
              //       color: Colors.black54,
              //       fontWeight: FontWeight.w500),
              // ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          RoundeButton(
            title: 'ĐĂNG KÝ',
            color: Colors.blueGrey,
            onPressed: register,
          )
        ],
      ),
    ));
  }
}
