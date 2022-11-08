import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../component/button.dart';
import '../component/contrast.dart';

class themthietbi_Screen extends StatefulWidget {
  String MaPH;
  themthietbi_Screen({required this.MaPH, Key? key}) : super(key: key);

  @override
  State<themthietbi_Screen> createState() => _thietbi_ScreenState();
}

class _thietbi_ScreenState extends State<themthietbi_Screen> {
  TextEditingController TenTB = TextEditingController();
  TextEditingController TenNhanHieu = TextEditingController();
  TextEditingController SoLuong = TextEditingController();

  Future themTB() async {
    var url = "http://192.168.1.6:8012/php_connect/themthietbi.php";
    http.post(Uri.parse(url), body: {
      "TenTB": TenTB.text,
      "TenNhanHieu": TenNhanHieu.text,
      "SoLuong": SoLuong.text,
      "MaPH": widget.MaPH,
    });
    EasyLoading.showSuccess(
      'Thêm Thành Công !',
      duration: Duration(milliseconds: 1300),
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
            controller: TenTB,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                prefixIcon: Icon(
                  FontAwesomeIcons.computer,
                  size: 26,
                ),
                hintText: 'Nhập vào tên thiết bị...',
                hintStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: TenNhanHieu,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                prefixIcon: Icon(
                  FontAwesomeIcons.brandsFontAwesome,
                  size: 26,
                ),
                hintText: 'Nhập vào Tên Nhãn Hiệu...',
                hintStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: SoLuong,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                prefixIcon: Icon(
                  FontAwesomeIcons.cubesStacked,
                  size: 26,
                ),
                hintText: 'Nhập vào số lượng thiết bị...',
                hintStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
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
