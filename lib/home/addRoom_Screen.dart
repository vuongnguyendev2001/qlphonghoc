import 'dart:convert';
import 'package:app_quanlythietbi/home/listRoom_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import '../component/button.dart';
import '../component/contrast.dart';

class AddRoomScreen extends StatefulWidget {
  const AddRoomScreen({Key? key}) : super(key: key);

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  final TextEditingController tenPH = TextEditingController();
  TextEditingController tang = TextEditingController();
  Future themPH() async {
    var url = "http://192.168.1.6:8012/php_connect/quanliphonghoc.php";
    var response = await http
        .post(Uri.parse(url), body: {"TenPH": tenPH.text, "Tang": tang.text});
    var add = json.decode(response.body);
    print(add);
    if (add == "Success") {
      EasyLoading.showSuccess(
        'Thêm Thành Công !',
        duration: const Duration(milliseconds: 1300),
        maskType: EasyLoadingMaskType.black,
      );
    } else {
      EasyLoading.showError(
        'Thêm Thất bại',
        duration: const Duration(milliseconds: 1300),
        maskType: EasyLoadingMaskType.black,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: tenPH,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
              keyboardType: TextInputType.text,
              textAlign: TextAlign.start,
              decoration: kTextFieldDecoration.copyWith(
                  prefixIcon: const Icon(
                    FontAwesomeIcons.envelope,
                    size: 26,
                  ),
                  hintText: 'Nhập vào tên phòng học',
                  hintStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: tang,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
              keyboardType: TextInputType.text,
              textAlign: TextAlign.start,
              decoration: kTextFieldDecoration.copyWith(
                  prefixIcon: const Icon(
                    FontAwesomeIcons.envelope,
                    size: 26,
                  ),
                  hintText: 'Nhập vào số tầng (VD: 1,2,3,...)',
                  hintStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundeButton(
              title: 'THÊM PHÒNG HỌC',
              color: Colors.lightBlue.shade700,
              onPressed: () {
                setState(() {
                  themPH();
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ListRoomScreen(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
