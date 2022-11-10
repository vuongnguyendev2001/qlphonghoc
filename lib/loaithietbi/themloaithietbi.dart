import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../component/button.dart';
import '../component/contrast.dart';

class ThemLTBScreen extends StatefulWidget {
  final String maTB;
  const ThemLTBScreen({Key? key, required this.maTB}) : super(key: key);

  @override
  State<ThemLTBScreen> createState() => _ThemLTBScreenState();
}

class _ThemLTBScreenState extends State<ThemLTBScreen> {
  TextEditingController tenLTB = TextEditingController();
  TextEditingController NgayLap = TextEditingController();
  Future themLTB() async {
    var url = "http://172.20.10.2:8012/php_connect/themloaithietbi.php";
    await http.post(Uri.parse(url), body: {
      "TenLTB": tenLTB.text,
      "NgayLap": NgayLap.text,
      "MaTB": widget.maTB,
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
    print(widget.maTB);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: tenLTB,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                prefixIcon: const Icon(
                  FontAwesomeIcons.computer,
                  size: 26,
                ),
                hintText: 'Nhập vào tên loại thiết bị...',
                hintStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: NgayLap,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                prefixIcon: const Icon(
                  FontAwesomeIcons.computer,
                  size: 26,
                ),
                hintText: 'Nhập vào ngày lắp (VD: 20/2/2022)',
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
            onPressed: themLTB,
            color: Colors.blue,
            title: 'THÊM LOẠI THIẾT BỊ',
          )
        ],
      ),
    );
  }
}
