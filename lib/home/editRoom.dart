import 'package:app_quanlythietbi/home/listRoom_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import '../component/button.dart';
import '../component/contrast.dart';

class EditRoom extends StatefulWidget {
  const EditRoom(
      {Key? key, required this.listthietbi, required this.indexthietbi})
      : super(key: key);
  final List listthietbi;
  final int indexthietbi;
  @override
  State<EditRoom> createState() => _EditRoomState();
}

class _EditRoomState extends State<EditRoom> {
  TextEditingController tenPH = TextEditingController();
  TextEditingController tang = TextEditingController();

  void updateData() async {
    var url = "http://192.168.1.6:8012/php_connect/suaphong.php";
    await http.post(Uri.parse(url), body: {
      'MaPH': widget.listthietbi[widget.indexthietbi]['MaPH'],
      "TenPH": tenPH.text,
      "tTang": tang.text,
    });
    EasyLoading.showSuccess(
      'Sửa thành công !',
      duration: const Duration(milliseconds: 1300),
      maskType: EasyLoadingMaskType.black,
    );
  }

  @override
  void initState() {
    tenPH.text = widget.listthietbi[widget.indexthietbi]['TenPH'];
    print(widget.listthietbi[widget.indexthietbi]['MaPH']);
    tang.text = widget.listthietbi[widget.indexthietbi]['Tang'];
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
            controller: tenPH,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                labelText: 'Tên Phòng Học',
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
            controller: tang,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                labelText: 'Tầng',
                prefixIcon: const Icon(
                  FontAwesomeIcons.building,
                  size: 26,
                ),
                hintText: 'Nhập vào tầng muốn chỉnh sửa',
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListRoomScreen(),
                  ));
            },
            title: 'CHỈNH SỬA THÔNG TIN',
            color: Colors.lightBlue.shade700,
          )
        ],
      ),
    );
  }
}
