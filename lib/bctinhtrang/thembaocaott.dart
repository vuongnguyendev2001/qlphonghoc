import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../component/button.dart';
import '../component/contrast.dart';

class thembaocaott_Screen extends StatefulWidget {
  final String MaLTB;
  const thembaocaott_Screen({Key? key, required this.MaLTB}) : super(key: key);

  @override
  State<thembaocaott_Screen> createState() => _thembaocaott_ScreenState();
}

class _thembaocaott_ScreenState extends State<thembaocaott_Screen> {
  TextEditingController NoiDungBC = TextEditingController();
  TextEditingController NgayBC = TextEditingController();
  Future thembaocao() async {
    var url = "http://192.168.1.6:8012/php_connect/thembaocao.php";
    http.post(Uri.parse(url), body: {
      "NoiDungBC": NoiDungBC.text,
      "NgayBC": NgayBC.text,
      "MaLTB": widget.MaLTB,
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
    print(widget.MaLTB);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: NoiDungBC,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                prefixIcon: Icon(
                  FontAwesomeIcons.computer,
                  size: 26,
                ),
                hintText: 'Nhập vào nội dung báo cáo...',
                hintStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: NgayBC,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                prefixIcon: Icon(
                  FontAwesomeIcons.brandsFontAwesome,
                  size: 26,
                ),
                hintText: 'Nhập ngày báo cáo.',
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
            onPressed: thembaocao,
            color: Colors.blue,
            title: 'THÊM BÁO CÁO',
          )
        ],
      ),
    );
  }
}
