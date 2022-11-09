import 'dart:convert';

import 'package:app_quanlythietbi/home/addRoom_Screen.dart';
import 'package:app_quanlythietbi/home/editRoom.dart';
import 'package:app_quanlythietbi/home/home.dart';
import 'package:app_quanlythietbi/screens/login.dart';
import 'package:app_quanlythietbi/thietbi/thietbi_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../component/contrast.dart';

class ListRoomScreen extends StatefulWidget {
  const ListRoomScreen({Key? key}) : super(key: key);

  @override
  State<ListRoomScreen> createState() => _ListRoomScreenState();
}

class _ListRoomScreenState extends State<ListRoomScreen> {
  Future getData() async {
    var Url = "http://192.168.2.91:8012/php_connect/timphong.php";
    var response1 = await http.post(Uri.parse(Url), body: {
      "TenPH": Tenphonghoc.text,
    });
    return json.decode(response1.body);
  }

  TextEditingController Tenphonghoc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(Role);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(57),
        child: AppBar(
          backgroundColor: Colors.lightBlue.shade700,
          centerTitle: true,
          leading: Role == 'admin'
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                    setState(() {
                      iduser = '';
                    });
                  },
                  child: const Padding(
                    padding:
                        EdgeInsets.only(right: 6.0, top: 6, bottom: 6, left: 8),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.blueGrey,
                      child: Icon(FontAwesomeIcons.arrowLeft),
                    ),
                  ),
                )
              : SizedBox(),
          title: const Text(
            'DS PHÒNG HỌC',
            style: TextStyle(fontSize: 23),
          ),
          actions: [
            Role == 'admin'
                ? IconButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddRoomScreen(),
                      ),
                    ),
                    icon: const Icon(FontAwesomeIcons.plus),
                  )
                : GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              // backgroundColor: Colors.grey.shade100,
                              // title: Text('Thông báo'),
                              content: Text(
                                'Bạn chắc chắn đăng xuất ?',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              actions: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Hủy'),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      Role = '';
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ),
                                    );
                                    EasyLoading.showSuccess(
                                      'Đăng xuất thành công !',
                                      duration:
                                          const Duration(milliseconds: 300),
                                      maskType: EasyLoadingMaskType.black,
                                    );
                                  },
                                  child: const Text('Đồng ý'),
                                ),
                              ],
                            );
                          });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 5),
                      alignment: Alignment.center,
                      height: 140,
                      width: 100,
                      child: Column(
                        children: [
                          Icon(FontAwesomeIcons.circleLeft),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Đăng xuất',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Stack(
              children: [
                TextFormField(
                  controller: Tenphonghoc,
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w400),
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.start,
                  decoration: kTextFieldDecoration.copyWith(
                      suffixIcon: IconButton(
                        padding: EdgeInsets.only(right: 30),
                        onPressed: () {
                          setState(() {
                            getData();
                          });
                        },
                        icon: Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 26,
                        ),
                      ),
                      hintText: 'Tìm tên phòng học...',
                      hintStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Tên Phòng',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Text(
                        ('Tầng'),
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            List list = snapshot.data;
                            return GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ThietBiScreen(
                                    MaPH: list[index]['MaPH'],
                                    tenPH: list[index]['TenPH'],
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.width * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade400,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: double.infinity,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        child: Text(
                                          list[index]['TenPH'],
                                          style: const TextStyle(fontSize: 22),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: double.infinity,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.31,
                                        child: Text(
                                          list[index]['Tang'],
                                          style: const TextStyle(fontSize: 22),
                                        ),
                                      ),
                                      Role == 'admin'
                                          ? Container(
                                              alignment: Alignment.center,
                                              height: double.infinity,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    EditRoom(
                                                              listthietbi: list,
                                                              indexthietbi:
                                                                  index,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      icon: const Icon(
                                                          FontAwesomeIcons
                                                              .pen)),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return CupertinoAlertDialog(
                                                                // backgroundColor: Colors.grey.shade100,
                                                                // title: Text('Thông báo'),
                                                                content:
                                                                    const Text(
                                                                  'Bạn chắc chắn xóa chứ?',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                                actions: [
                                                                  MaterialButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child: const Text(
                                                                        'Hủy'),
                                                                  ),
                                                                  MaterialButton(
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                        () {
                                                                          var url =
                                                                              "http://192.168.2.91:8012/php_connect/xoaphong.php";
                                                                          http.post(
                                                                            Uri.parse(url),
                                                                            body: {
                                                                              "MaPH": list[index]['MaPH'],
                                                                            },
                                                                          );
                                                                        },
                                                                      );
                                                                      EasyLoading
                                                                          .showSuccess(
                                                                        'Xóa phòng thành công',
                                                                        duration:
                                                                            const Duration(milliseconds: 300),
                                                                        maskType:
                                                                            EasyLoadingMaskType.black,
                                                                      );
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: const Text(
                                                                        'Đồng ý'),
                                                                  ),
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      icon: const Icon(
                                                          FontAwesomeIcons
                                                              .trash)),
                                                ],
                                              ),
                                            )
                                          : Container(
                                              alignment: Alignment.centerLeft,
                                              height: double.infinity,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.35,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    'Xem thiết bị',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.blueAccent
                                                            .shade700),
                                                  ),
                                                  const Icon(FontAwesomeIcons
                                                      .rightFromBracket),
                                                ],
                                              ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                      : SpinKitFadingCircle(
                          size: 65,
                          itemBuilder: (_, int index) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                color: index.isEven
                                    ? Colors.white70
                                    : Colors.blueGrey,
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
