import 'dart:convert';
import 'package:app_quanlythietbi/loaithietbi/sualtb.dart';
import 'package:app_quanlythietbi/loaithietbi/themloaithietbi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../bctinhtrang/thembaocaott.dart';
import '../screens/login.dart';

class DLLoaiThietBiScreen extends StatefulWidget {
  final List listltb;
  final int indexltb;
  const DLLoaiThietBiScreen(
      {Key? key, required this.listltb, required this.indexltb})
      : super(key: key);

  @override
  State<DLLoaiThietBiScreen> createState() => _DLLoaiThietBiScreenState();
}

class _DLLoaiThietBiScreenState extends State<DLLoaiThietBiScreen> {
  Future getData() async {
    var url = "http://192.168.1.6:8012/php_connect/dlloaithietbi.php";
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
        title: const Text('DANH SÁCH LOẠI THIẾT BỊ'),
        actions: [
          levelUser == 1
              ? IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThemLTBScreen(
                        maTB: widget.listltb[widget.indexltb]['MaTB'],
                      ),
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
                        width: MediaQuery.of(context).size.width * 0.33,
                        child: const Text(
                          'Tên LTB',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: double.infinity,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: const Text(
                          ('Ngày Lắp'),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // Container(
                      //   alignment: Alignment.centerLeft,
                      //   height: double.infinity,
                      //   width: MediaQuery.of(context).size.width * 0.3,
                      //   child: Text(
                      //     ('Ngày Lắp'),
                      //     style: TextStyle(
                      //       fontSize: 22,
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.w600,
                      //     ),
                      //   ),
                      // )
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
                            List listloaithietbi = snapshot.data;
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ThemBaoCaoTTScreen(
                                      maLTB: listloaithietbi[index]['MaLTB'],
                                    ),
                                  ),
                                );
                              },
                              child:
                                  listloaithietbi[index]['MaTB'] ==
                                          widget.listltb[widget.indexltb]
                                              ['MaTB']
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.grey.shade400,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  height: double.infinity,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.25,
                                                  child: Text(
                                                    listloaithietbi[index]
                                                        ['TenLTB'],
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
                                                      0.4,
                                                  child: Text(
                                                    listloaithietbi[index]
                                                        ['NgayLap'],
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
                                                      0.25,
                                                  child: levelUser == 1
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () =>
                                                                      Navigator
                                                                          .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (context) => SuaLoaiThietBiScreen(
                                                                          listltb:
                                                                              listloaithietbi,
                                                                          indexltb:
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
                                                                                  setState(
                                                                                    () {
                                                                                      var url = "http://192.168.1.6:8012/php_connect/xoaloaithietbi.php";
                                                                                      http.post(
                                                                                        Uri.parse(url),
                                                                                        body: {
                                                                                          "MaLTB": listloaithietbi[index]['MaLTB'],
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                  EasyLoading.showSuccess(
                                                                                    'Xóa thành công !',
                                                                                    duration: const Duration(milliseconds: 1300),
                                                                                    maskType: EasyLoadingMaskType.black,
                                                                                  );
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: const Text('Đồng ý'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        });
                                                                  },
                                                                  child: const CircleAvatar(
                                                                      backgroundColor: Colors.blueGrey,
                                                                      radius: 20,
                                                                      child: Icon(
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
                                                              listloaithietbi[
                                                                      index]
                                                                  ['SoLuong'],
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          20),
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
