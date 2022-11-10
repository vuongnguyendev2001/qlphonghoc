import 'package:app_quanlythietbi/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../component/button.dart';
import '../component/contrast.dart';
import 'dlbctt.dart';

class ThemBaoCaoTTScreen extends StatefulWidget {
  final String maLTB;
  final String TenLTB;
  final String MaTB;
  final String TenThietBi;
  final String TenPH;
  final String MaPH;
  const ThemBaoCaoTTScreen(
      {Key? key,
      required this.maLTB,
      required this.TenLTB,
      required this.TenThietBi,
      required this.TenPH,
      required this.MaTB,
      required this.MaPH})
      : super(key: key);

  @override
  State<ThemBaoCaoTTScreen> createState() => _ThemBaoCaoTTScreenState();
}

class _ThemBaoCaoTTScreenState extends State<ThemBaoCaoTTScreen> {
  TextEditingController noiDungBC = TextEditingController();

  Future thembaocao() async {
    var url = "http://172.20.10.2:8012/php_connect/thembaocao.php";
    await http.post(Uri.parse(url), body: {
      "NoiDungBC": noiDungBC.text,
      "MaLTB": widget.maLTB,
      "id": iduser,
    });
    EasyLoading.showSuccess(
      'Thêm Thành Công !',
      duration: const Duration(milliseconds: 1300),
      maskType: EasyLoadingMaskType.black,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DLBCTinhTrangScreen(
          MaLoaiThietBi: widget.maLTB,
          TenLTB: widget.TenLTB,
          TenThietBi: widget.TenThietBi,
          TenPH: widget.TenPH,
          MaTB: widget.MaTB,
          MaPH: widget.MaPH,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          // GestureDetector(
          //   onTap: () async {
          //     DateTime? dateTime = await showDatePicker(
          //       context: context,
          //       initialDate: DateTime.now(),
          //       firstDate: DateTime(2020),
          //       lastDate: DateTime(2023),
          //     );
          //     setState(() {
          //       _dateTime = dateTime!;
          //     });
          //   },
          //   child: Container(
          //     width: MediaQuery.of(context).size.width * 0.6,
          //     height: MediaQuery.of(context).size.width * 0.12,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       color: Colors.grey.shade400,
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.only(left: 1),
          //           child: Text(
          //             '${_dateTime!.day}/${_dateTime!.month}/${_dateTime!.year} '
          //             '${_dateTime!.hour} ${_dateTime!.minute}',
          //             style: TextStyle(
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         SizedBox(
          //           width: 15,
          //         ),
          //         Icon(
          //           FontAwesomeIcons.calendarDays,
          //           color: Colors.blueGrey,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
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
