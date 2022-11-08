import 'dart:convert';

import 'package:app_quanlythietbi/loaithietbi/dlloaithietbi.dart';
import 'package:app_quanlythietbi/screens/login.dart';
import 'package:app_quanlythietbi/thietbi/suathietbi_Screen.dart';
import 'package:app_quanlythietbi/thietbi/themthietbi_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class ThietBiScreen extends StatefulWidget {
  final String maPH;
  const ThietBiScreen({Key? key, required this.maPH}) : super(key: key);

  @override
  State<ThietBiScreen> createState() => _ThietBiScreenState();
}

class _ThietBiScreenState extends State<ThietBiScreen> {
  Future getData() async {
    var url = "http://192.168.1.6:8012/php_connect/dlthietbi.php";
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.only(right: 6.0, top: 6, bottom: 6, left: 8),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.blueGrey,
              child: Icon(FontAwesomeIcons.arrowLeft),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text('DANH SÁCH THIẾT BỊ'),
        actions: [
          levelUser == 1
              ? IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ThemThietBiScreen(MaPH: widget.maPH),
                    ),
                  ),
                  icon: const Icon(FontAwesomeIcons.add),
                )
              : const SizedBox(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(0),
                  width: double.infinity,
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        height: double.infinity,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: const Text(
                          'Tên TB',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: double.infinity,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: const Text(
                          ('Nhãn Hiệu'),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: double.infinity,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: const Text(
                          ('Số lượng'),
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
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
                            List listthietbi = snapshot.data;
                            return GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DLLoaiThietBiScreen(
                                          listltb: listthietbi,
                                          indexltb: index,
                                        )),
                              ),
                              child: listthietbi[index]['MaPH'] == widget.maPH
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.shade400,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              alignment: Alignment.centerLeft,
                                              height: double.infinity,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              child: Text(
                                                listthietbi[index]['TenTB'],
                                                style: const TextStyle(
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              height: double.infinity,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              child: Text(
                                                listthietbi[index]
                                                    ['TenNhanHieu'],
                                                style: const TextStyle(
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: double.infinity,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              child: levelUser == 1
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          listthietbi[index]
                                                              ['SoLuong'],
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 20),
                                                        ),
                                                        Row(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () =>
                                                                  Navigator
                                                                      .push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      SuaThietBiScreen(
                                                                          list:
                                                                              listthietbi,
                                                                          index:
                                                                              index),
                                                                ),
                                                              ),
                                                              child:
                                                                  const CircleAvatar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .blueGrey,
                                                                radius: 20,
                                                                child: Icon(
                                                                    FontAwesomeIcons
                                                                        .pen,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 7,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
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
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                            child:
                                                                                const Text('Hủy'),
                                                                          ),
                                                                          MaterialButton(
                                                                            onPressed:
                                                                                () {
                                                                              setState(
                                                                                () {
                                                                                  var url = "http://192.168.1.6:8012/php_connect/xoathietbi.php";
                                                                                  http.post(
                                                                                    Uri.parse(url),
                                                                                    body: {
                                                                                      "MaTB": listthietbi[index]['MaTB'],
                                                                                    },
                                                                                  );
                                                                                },
                                                                              );
                                                                              EasyLoading.showSuccess(
                                                                                'Xóa phòng thành công',
                                                                                duration: const Duration(milliseconds: 1300),
                                                                                maskType: EasyLoadingMaskType.black,
                                                                              );
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                const Text('Đồng ý'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    });
                                                              },
                                                              child:
                                                                  const CircleAvatar(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .blueGrey,
                                                                      radius:
                                                                          20,
                                                                      child:
                                                                          Icon(
                                                                        FontAwesomeIcons
                                                                            .trash,
                                                                        color: Colors
                                                                            .white,
                                                                      )),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  : Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text(
                                                          listthietbi[index]
                                                              ['SoLuong'],
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 20),
                                                        ),
                                                        const Icon(
                                                            FontAwesomeIcons
                                                                .rightToBracket),
                                                      ],
                                                    ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
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
