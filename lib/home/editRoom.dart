import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../component/button.dart';
import '../component/contrast.dart';
import 'listRoom_Screen.dart';

class editRoom extends StatefulWidget {
  const editRoom(
      {Key? key, required this.listthietbi, required this.indexthietbi})
      : super(key: key);
  final List listthietbi;
  final int indexthietbi;
  @override
  State<editRoom> createState() => _editRoomState();
}

class _editRoomState extends State<editRoom> {
  TextEditingController TenPH = TextEditingController();
  TextEditingController Tang = TextEditingController();

  @override
  void updateData() async {
    var url = "http://192.168.1.6:8012/php_connect/suaphong.php";
    var response = await http.post(Uri.parse(url), body: {
      'MaPH': widget.listthietbi[widget.indexthietbi]['MaPH'],
      "TenPH": TenPH.text,
      "Tang": Tang.text,
    });
    EasyLoading.showSuccess(
      'Sửa thành công !',
      duration: Duration(milliseconds: 1300),
      maskType: EasyLoadingMaskType.black,
    );
  }

  void initState() {
    TenPH.text = widget.listthietbi[widget.indexthietbi]['TenPH'];
    print(widget.listthietbi[widget.indexthietbi]['MaPH']);
    Tang.text = widget.listthietbi[widget.indexthietbi]['Tang'];
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
            controller: TenPH,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                labelText: 'Tên Phòng Học',
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
            controller: Tang,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            decoration: kTextFieldDecoration.copyWith(
                labelText: 'Tầng',
                prefixIcon: Icon(
                  FontAwesomeIcons.building,
                  size: 26,
                ),
                hintText: 'Nhập vào tầng muốn chỉnh sửa',
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => listRoom_Screen(),
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
