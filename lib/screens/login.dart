import 'dart:convert';

import 'package:app_quanlythietbi/home/home.dart';
import 'package:app_quanlythietbi/home/listRoom_Screen.dart';
import 'package:app_quanlythietbi/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:wc_form_validators/wc_form_validators.dart';

import '../component/button.dart';
import '../component/contrast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

late String Role;
late String iduser;

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  Future login() async {
    var url = "http://172.20.10.2:8012/php_connect/login.php";
    var response = await http.post(Uri.parse(url), body: {
      "username": username.text,
      "password": password.text,
    });
    var user = json.decode(response.body);
    print(user);
    if (user != '0') {
      setState(() {
        Role = user;
      });
      EasyLoading.showSuccess(
        "Đăng nhập thành công !",
        duration: const Duration(milliseconds: 1300),
        maskType: EasyLoadingMaskType.black,
      );
      print(Role);
      // ignore: use_build_context_synchronously
      Role == 'admin'
          ? Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()))
          : Navigator.push(context,
              MaterialPageRoute(builder: (context) => ListRoomScreen()));
      getID();
    } else {
      EasyLoading.showError("Sai tài khoản hoặc mật khẩu");
    }
  }

  Future getID() async {
    var url = "http://172.20.10.2:8012/php_connect/getiduser.php";
    var response = await http.post(Uri.parse(url), body: {
      "username": username.text,
      "password": password.text,
    });
    var user = json.decode(response.body);
    print(user);
    print(user);
    if (user != '') {
      setState(() {
        iduser = user;
      });
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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('lib/asset/images/ctu_Logo.png'),
              )),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "HỆ THỐNG QUẢN LÝ THIẾT BỊ PHÒNG HỌC",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 0.6,
                  color: Colors.black,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 50.0,
            ),
            TextFormField(
              controller: username,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.start,
              decoration: kTextFieldDecoration.copyWith(
                  prefixIcon: const Icon(
                    FontAwesomeIcons.envelope,
                    size: 26,
                  ),
                  hintText: 'Tài khoản',
                  hintStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500)),
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
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              decoration: kTextFieldDecoration.copyWith(
                prefixIcon: const Icon(
                  FontAwesomeIcons.lock,
                  size: 26,
                ),
                hintText: 'Mật khẩu',
                hintStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const SizedBox(
              height: 20,
            ),
            RoundeButton(
              title: 'ĐĂNG NHẬP',
              color: Colors.blueAccent.shade700,
              onPressed: () {
                login();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            RoundeButton(
              title: 'ĐĂNG KÍ',
              color: Colors.blueGrey,
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen())),
            ),
            const SizedBox(
              height: 10,
            ),
            RoundeButton(
              title: 'KHÁCH',
              color: Colors.grey.shade700,
              onPressed: () {
                setState(() {
                  Role = 'Khách';
                  iduser = '0';
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListRoomScreen(),
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
