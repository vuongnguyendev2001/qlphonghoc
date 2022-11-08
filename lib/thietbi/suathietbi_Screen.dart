import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../component/button.dart';
import '../component/contrast.dart';

class SuaThietBiScreen extends StatefulWidget {
  final List list;
  final int index;

  const SuaThietBiScreen({Key? key, required this.list, required this.index})
      : super(key: key);

  @override
  State<SuaThietBiScreen> createState() => _SuaThietBiScreenState();
}

class _SuaThietBiScreenState extends State<SuaThietBiScreen> {
  TextEditingController tenTB = TextEditingController();
  TextEditingController tenNhanHieu = TextEditingController();
  TextEditingController soLuong = TextEditingController();

  void updateData() async {
    var url = "http://192.168.1.6:8012/php_connect/suathietbi.php";
    await http.post(Uri.parse(url), body: {
      'MaTB': widget.list[widget.index]['MaTB'],
      "TenTB": tenTB.text,
      "TenNhanHieu": tenNhanHieu.text,
      "SoLuong": soLuong.text,
      'MaPH': widget.list[widget.index]['MaPH'],
    });
    EasyLoading.showSuccess(
      'Sửa thành công !',
      duration: const Duration(milliseconds: 1300),
      maskType: EasyLoadingMaskType.black,
    );
  }

  @override
  void initState() {
    tenTB.text = widget.list[widget.index]['TenTB'];
    print(widget.list[widget.index]['MaPH']);
    tenNhanHieu.text = widget.list[widget.index]['TenNhanHieu'];
    soLuong.text = widget.list[widget.index]['SoLuong'];
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
            controller: tenTB,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                labelText: 'Tên Thiết Bị',
                prefixIcon: const Icon(
                  FontAwesomeIcons.building,
                  size: 26,
                ),
                hintText: 'Nhập vào tên muốn chỉnh sửa',
                hintStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: tenNhanHieu,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                labelText: 'Tên Nhãn Hiệu',
                prefixIcon: const Icon(
                  FontAwesomeIcons.building,
                  size: 26,
                ),
                hintText: 'Nhập vào nhãn hiệu muốn chỉnh sửa',
                hintStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: soLuong,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                labelText: 'Số Lượng',
                prefixIcon: const Icon(
                  FontAwesomeIcons.building,
                  size: 26,
                ),
                hintText: 'Nhập vào số lượng muốn chỉnh sửa',
                hintStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(
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
