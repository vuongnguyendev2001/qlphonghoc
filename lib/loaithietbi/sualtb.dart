import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../component/button.dart';
import '../component/contrast.dart';

class SuaLoaiThietBiScreen extends StatefulWidget {
  final List listltb;
  final int indexltb;

  const SuaLoaiThietBiScreen(
      {Key? key, required this.listltb, required this.indexltb})
      : super(key: key);

  @override
  State<SuaLoaiThietBiScreen> createState() => _SuaLoaiThietBiScreenState();
}

class _SuaLoaiThietBiScreenState extends State<SuaLoaiThietBiScreen> {
  TextEditingController tenLTB = TextEditingController();
  TextEditingController ngayLap = TextEditingController();

  void updateData() async {
    var url = "http://192.168.2.91:8012/php_connect/sualoaithietbi.php";
    await http.post(Uri.parse(url), body: {
      'MaLTB': widget.listltb[widget.indexltb]['MaLTB'],
      "TenLTB": tenLTB.text,
      "NgayLap": ngayLap.text,
      'MaTB': widget.listltb[widget.indexltb]['MaTB'],
    });
    EasyLoading.showSuccess(
      'Sửa thành công !',
      duration: const Duration(milliseconds: 1300),
      maskType: EasyLoadingMaskType.black,
    );
  }

  @override
  void initState() {
    tenLTB.text = widget.listltb[widget.indexltb]['TenLTB'];
    print(widget.listltb[widget.indexltb]['MaPH']);
    ngayLap.text = widget.listltb[widget.indexltb]['NgayLap'];
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
            controller: tenLTB,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                labelText: 'Tên Loại Thiết Bị',
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
            controller: ngayLap,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                labelText: 'Ngày Lắp',
                prefixIcon: const Icon(
                  FontAwesomeIcons.building,
                  size: 26,
                ),
                hintText: 'Nhập vào ngày lắp muốn chỉnh sửa',
                hintStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(
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
  }
}
