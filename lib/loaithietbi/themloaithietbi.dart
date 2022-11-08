import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../component/button.dart';
import '../component/contrast.dart';

class themLTB_Screen extends StatefulWidget {
  final String MaTB;
  const themLTB_Screen({Key? key, required this.MaTB}) : super(key: key);

  @override
  State<themLTB_Screen> createState() => _themLTB_ScreenState();
}

class _themLTB_ScreenState extends State<themLTB_Screen> {
  TextEditingController TenLTB = TextEditingController();
  DateTime? NgayLap = DateTime.now();
  Future themLTB() async {
    var url = "http://192.168.1.6:8012/php_connect/themloaithietbi.php";
    http.post(Uri.parse(url), body: {
      "TenLTB": TenLTB.text,
      "NgayLap": NgayLap,
      "MaTB": widget.MaTB,
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
    print(widget.MaTB);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: TenLTB,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                prefixIcon: Icon(
                  FontAwesomeIcons.computer,
                  size: 26,
                ),
                hintText: 'Nhập vào tên loại thiết bị...',
                hintStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () async {
              DateTime? _NgayLap = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
              );
              setState(() {
                NgayLap = _NgayLap;
                print(_NgayLap);
              });
            },
            child: Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade400,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Text(
                      '${NgayLap!.day}/${NgayLap!.month}/${NgayLap!.year}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    FontAwesomeIcons.calendarDays,
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
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
