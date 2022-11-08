import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../component/button.dart';
import '../component/contrast.dart';

class ThemBaoCaoTTScreen extends StatefulWidget {
  final String maLTB;
  const ThemBaoCaoTTScreen({Key? key, required this.maLTB}) : super(key: key);

  @override
  State<ThemBaoCaoTTScreen> createState() => _ThemBaoCaoTTScreenState();
}

class _ThemBaoCaoTTScreenState extends State<ThemBaoCaoTTScreen> {
  TextEditingController noiDungBC = TextEditingController();
  TextEditingController ngayBC = TextEditingController();
  Future thembaocao() async {
    var url = "http://192.168.1.6:8012/php_connect/thembaocao.php";
    await http.post(Uri.parse(url), body: {
      "NoiDungBC": noiDungBC.text,
      "NgayBC": ngayBC.text,
      "MaLTB": widget.maLTB,
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
    print(widget.maLTB);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: noiDungBC,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                prefixIcon: const Icon(
                  FontAwesomeIcons.computer,
                  size: 26,
                ),
                hintText: 'Nhập vào nội dung báo cáo...',
                hintStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: ngayBC,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                prefixIcon: const Icon(
                  FontAwesomeIcons.brandsFontAwesome,
                  size: 26,
                ),
                hintText: 'Nhập ngày báo cáo.',
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
            onPressed: thembaocao,
            color: Colors.blue,
            title: 'THÊM BÁO CÁO',
          )
        ],
      ),
    );
  }
}
