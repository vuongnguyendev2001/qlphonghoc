import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class DLBAOCAOTT extends StatefulWidget {
  final String MaLoaiThietBi;
  final String TenThietBi;
  final String TenPH;
  final String TenLTBL;
  const DLBAOCAOTT(
      {Key? key,
      required this.MaLoaiThietBi,
      required this.TenThietBi,
      required this.TenPH,
      required this.TenLTBL})
      : super(key: key);

  @override
  State<DLBAOCAOTT> createState() => _DLBAOCAOTTState();
}

class _DLBAOCAOTTState extends State<DLBAOCAOTT> {
  Future getData() async {
    var url = "http://192.168.2.91:8012/php_connect/dltinhtrang.php";
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
          // Role == 'admin'
          //     ? IconButton(
          //         onPressed: () => Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => ThemBaoCaoTTScreen(
          //               maLTB: widget.MaLoaiThietBi,
          //             ),
          //           ),
          //         ),
          //         icon: const Icon(FontAwesomeIcons.add),
          //       )
          //     : const SizedBox(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Column(
          children: [
            Stack(
              children: [
                // Container(
                //   padding: const EdgeInsets.all(0),
                //   width: double.infinity,
                //   height: 35,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Container(
                //         padding: const EdgeInsets.only(left: 10),
                //         alignment: Alignment.centerLeft,
                //         height: double.infinity,
                //         width: MediaQuery.of(context).size.width * 0.33,
                //         child: const Text(
                //           'Tên LTB',
                //           style: TextStyle(
                //             fontSize: 22,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //       ),
                //       Container(
                //         alignment: Alignment.center,
                //         height: double.infinity,
                //         width: MediaQuery.of(context).size.width * 0.3,
                //         child: const Text(
                //           ('Ngày Lắp'),
                //           style: TextStyle(
                //             fontSize: 22,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //       ),
                //       // Container(
                //       //   alignment: Alignment.centerLeft,
                //       //   height: double.infinity,
                //       //   width: MediaQuery.of(context).size.width * 0.3,
                //       //   child: Text(
                //       //     ('Ngày Lắp'),
                //       //     style: TextStyle(
                //       //       fontSize: 22,
                //       //       color: Colors.black,
                //       //       fontWeight: FontWeight.w600,
                //       //     ),
                //       //   ),
                //       // )
                //     ],
                //   ),
                // ),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? ListView.builder(
                          reverse: false,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            List listbaocaott = snapshot.data;
                            return GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) {};
                                //   ),
                                // );
                              },
                              child: listbaocaott[index]['MaLTB'] ==
                                      widget.MaLoaiThietBi
                                  ? Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Material(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              bottomRight:
                                                  Radius.circular(30.0),
                                              bottomLeft: Radius.circular(30.0),
                                              topRight: Radius.circular(30.0),
                                            ),
                                            elevation: 5.0,
                                            color: Colors.grey.shade300,
                                            child: Container(
                                              constraints: const BoxConstraints(
                                                maxWidth: double.infinity,
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0,
                                                      horizontal: 15.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        listbaocaott[index]
                                                            ['fullname'],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    listbaocaott[index]
                                                        ['NoiDungBC']!,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return CupertinoAlertDialog(
                                                            // backgroundColor: Colors.grey.shade100,
                                                            // title: Text('Thông báo'),
                                                            content: const Text(
                                                              'Bạn chắc chắn xóa chứ?',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                            actions: [
                                                              MaterialButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child:
                                                                    const Text(
                                                                        'Hủy'),
                                                              ),
                                                              MaterialButton(
                                                                onPressed: () {
                                                                  setState(
                                                                    () {
                                                                      var url =
                                                                          "http://192.168.2.91:8012/php_connect/xoabctinhtrang.php";
                                                                      http.post(
                                                                        Uri.parse(
                                                                            url),
                                                                        body: {
                                                                          "MaTT":
                                                                              listbaocaott[index]['MaTT'],
                                                                        },
                                                                      );
                                                                    },
                                                                  );
                                                                  EasyLoading
                                                                      .showSuccess(
                                                                    'Xóa thành công !',
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            1300),
                                                                    maskType:
                                                                        EasyLoadingMaskType
                                                                            .black,
                                                                  );
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                    'Đồng ý'),
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  },
                                                  child: Text(
                                                    'Xóa',
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Text(
                                                  listbaocaott[index]['NgayBC'],
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(),
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
