import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../component/button.dart';
import '../component/contrast.dart';

class ThemThietBiScreen extends StatefulWidget {
  String MaPH;
  ThemThietBiScreen({required this.MaPH, Key? key}) : super(key: key);

  @override
  State<ThemThietBiScreen> createState() => _ThemThietBiScreen();
}

class _ThemThietBiScreen extends State<ThemThietBiScreen> {
  TextEditingController tenTB = TextEditingController();
  TextEditingController tenNhanHieu = TextEditingController();
  TextEditingController soLuong = TextEditingController();

  Future themTB() async {
    var url = "http://192.168.1.6:8012/php_connect/themthietbi.php";
    http.post(Uri.parse(url), body: {
      "TenTB": tenTB.text,
      "TenNhanHieu": tenNhanHieu.text,
      "SoLuong": soLuong.text,
      "MaPH": widget.MaPH,
    });
    EasyLoading.showSuccess(
      'Thêm Thành Công !',
      duration: const Duration(milliseconds: 1300),
      maskType: EasyLoadingMaskType.black,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: tenTB,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                prefixIcon: const Icon(
                  FontAwesomeIcons.computer,
                  size: 26,
                ),
                hintText: 'Nhập vào tên thiết bị...',
                hintStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: tenNhanHieu,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                prefixIcon: const Icon(
                  FontAwesomeIcons.brandsFontAwesome,
                  size: 26,
                ),
                hintText: 'Nhập vào Tên Nhãn Hiệu...',
                hintStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: soLuong,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                prefixIcon: const Icon(
                  FontAwesomeIcons.cubesStacked,
                  size: 26,
                ),
                hintText: 'Nhập vào số lượng thiết bị...',
                hintStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 20,
          ),
          RoundeButton(
            onPressed: themTB,
            color: Colors.blue,
            title: 'THÊM THIẾT BỊ',
          )
        ],
      ),
    );
  }
}
