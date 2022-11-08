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
  DateTime? ngayLap = DateTime.now();
  Future themLTB() async {
    var url = "http://192.168.1.6:8012/php_connect/themloaithietbi.php";
    await http.post(Uri.parse(url), body: {
      "tenLTB": tenLTB.text,
      "ngayLap": ngayLap,
      "maTB": widget.maTB,
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
          GestureDetector(
            onTap: () async {
              DateTime? _ngayLap = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
              );
              setState(() {
                ngayLap = _ngayLap;
                print(_ngayLap);
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
                      '${ngayLap!.day}/${ngayLap!.month}/${ngayLap!.year}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(
                    FontAwesomeIcons.calendarDays,
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            ),
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
