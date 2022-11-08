import 'dart:convert';

import 'package:app_quanlythietbi/home/home.dart';
import 'package:app_quanlythietbi/screens/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:wc_form_validators/wc_form_validators.dart';

import '../component/button.dart';
import '../component/contrast.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);
  static const String id = 'login';

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

late int levelUser;

class _Login_ScreenState extends State<Login_Screen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  Future login() async {
    var url = "http://192.168.1.6:8012/php_connect/login.php";
    var response = await http.post(Uri.parse(url), body: {
      "username": username.text,
      "password": password.text,
    });
    var user = json.decode(response.body);
    print(user);
    if (user != '0') {
      setState(() {
        levelUser = int.parse(user);
      });
      EasyLoading.showSuccess(
        "Đăng nhập thành công !",
        duration: Duration(milliseconds: 1300),
        maskType: EasyLoadingMaskType.black,
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const home_Screen()));
    } else {
      EasyLoading.showError("Sai tài khoản hoặc mật khẩu");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 170,
              width: 170,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('lib/asset/images/ctu_Logo.png'),
              )),
            ),
            SizedBox(
              height: 30,
            ),
            const Text(
              "HỆ THỐNG QUẢN LÝ VÀ ĐÁNH GIÁ PHÒNG HỌC",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 0.6,
                  color: Colors.black,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 50.0,
            ),
            TextFormField(
              controller: username,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
              keyboardType: TextInputType.emailAddress,
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
              validator: Validators.compose([
                Validators.required('Mật khẩu phải có chữ In Hoa, Số'),
                Validators.patternString(
                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                    'Invalid Password')
              ]),
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
            SizedBox(
              height: 20,
            ),
            RoundeButton(
              title: 'ĐĂNG NHẬP',
              color: Colors.blueAccent.shade700,
              onPressed: () {
                login();
              },
            ),
            SizedBox(
              height: 10,
            ),
            RoundeButton(
              title: 'ĐĂNG KÍ',
              color: Colors.blueGrey,
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Register_Screen())),
            ),
            SizedBox(
              height: 10,
            ),
            RoundeButton(
              title: 'KHÁCH',
              color: Colors.grey.shade700,
              onPressed: () {
                setState(() {
                  levelUser = 4;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => home_Screen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
