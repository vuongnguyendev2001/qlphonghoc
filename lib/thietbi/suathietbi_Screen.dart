import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../component/button.dart';
import '../component/contrast.dart';

class suathietbi_Screen extends StatefulWidget {
  final List list;
  final int index;

  const suathietbi_Screen({Key? key, required this.list, required this.index})
      : super(key: key);

  @override
  State<suathietbi_Screen> createState() => _suathietbi_ScreenState();
}

class _suathietbi_ScreenState extends State<suathietbi_Screen> {
  TextEditingController TenTB = TextEditingController();
  TextEditingController TenNhanHieu = TextEditingController();
  TextEditingController SoLuong = TextEditingController();

  void updateData() async {
    var url = "http://192.168.1.6:8012/php_connect/suathietbi.php";
    var response = await http.post(Uri.parse(url), body: {
      'MaTB': widget.list[widget.index]['MaTB'],
      "TenTB": TenTB.text,
      "TenNhanHieu": TenNhanHieu.text,
      "SoLuong": SoLuong.text,
      'MaPH': widget.list[widget.index]['MaPH'],
    });
    EasyLoading.showSuccess(
      'Sửa thành công !',
      duration: Duration(milliseconds: 1300),
      maskType: EasyLoadingMaskType.black,
    );
  }

  void initState() {
    TenTB.text = widget.list[widget.index]['TenTB'];
    print(widget.list[widget.index]['MaPH']);
    TenNhanHieu.text = widget.list[widget.index]['TenNhanHieu'];
    SoLuong.text = widget.list[widget.index]['SoLuong'];
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
            controller: TenTB,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                labelText: 'Tên Thiết Bị',
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
            controller: TenNhanHieu,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                labelText: 'Tên Nhãn Hiệu',
                prefixIcon: Icon(
                  FontAwesomeIcons.building,
                  size: 26,
                ),
                hintText: 'Nhập vào nhãn hiệu muốn chỉnh sửa',
                hintStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: SoLuong,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                labelText: 'Số Lượng',
                prefixIcon: Icon(
                  FontAwesomeIcons.building,
                  size: 26,
                ),
                hintText: 'Nhập vào số lượng muốn chỉnh sửa',
                hintStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 30,
          ),
          RoundeButton(
            onPressed: () {
              setState(() {
                updateData();
              });
              Navigator.pop(context);
            },
            title: 'CHỈNH SỬA THÔNG TIN',
            color: Colors.lightBlue.shade700,
          )
        ],
      ),
    );
    ;
  }
}
