import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../component/button.dart';
import '../component/contrast.dart';

class sualoaithietbi_Screen extends StatefulWidget {
  final List listltb;
  final int indexltb;

  const sualoaithietbi_Screen(
      {Key? key, required this.listltb, required this.indexltb})
      : super(key: key);

  @override
  State<sualoaithietbi_Screen> createState() => _sualoaithietbi_ScreenState();
}

class _sualoaithietbi_ScreenState extends State<sualoaithietbi_Screen> {
  TextEditingController TenLTB = TextEditingController();
  TextEditingController NgayLap = TextEditingController();

  void updateData() async {
    var url = "http://192.168.1.6:8012/php_connect/sualoaithietbi.php";
    var response = await http.post(Uri.parse(url), body: {
      'MaLTB': widget.listltb[widget.indexltb]['MaLTB'],
      "TenLTB": TenLTB.text,
      "NgayLap": NgayLap.text,
      'MaTB': widget.listltb[widget.indexltb]['MaTB'],
    });
    EasyLoading.showSuccess(
      'Sửa thành công !',
      duration: Duration(milliseconds: 1300),
      maskType: EasyLoadingMaskType.black,
    );
  }

  void initState() {
    TenLTB.text = widget.listltb[widget.indexltb]['TenLTB'];
    print(widget.listltb[widget.indexltb]['MaPH']);
    NgayLap.text = widget.listltb[widget.indexltb]['NgayLap'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: TenLTB,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                labelText: 'Tên Loại Thiết Bị',
                prefixIcon: Icon(
                  FontAwesomeIcons.building,
                  size: 26,
                ),
                hintText: 'Nhập vào tên muốn chỉnh sửa',
                hintStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: NgayLap,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                labelText: 'Ngày Lắp',
                prefixIcon: Icon(
                  FontAwesomeIcons.building,
                  size: 26,
                ),
                hintText: 'Nhập vào ngày lắp muốn chỉnh sửa',
                hintStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 20,
          ),
          RoundeButton(
            onPressed: () {
              setState(() {
                updateData();
              });
              Navigator.pop(context);
            },
            title: 'CHỈNH SỬA LOẠI THIẾT BỊ',
            color: Colors.lightBlue.shade700,
          )
        ],
      ),
    );
    ;
  }
}
