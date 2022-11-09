import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class BaoCaoSuaChua extends StatefulWidget {
  const BaoCaoSuaChua({Key? key}) : super(key: key);

  @override
  State<BaoCaoSuaChua> createState() => _BaoCaoSuaChuaState();
}

class _BaoCaoSuaChuaState extends State<BaoCaoSuaChua> {
  List listtt = [];
  Future getData() async {
    var Url = "http://192.168.2.91:8012/php_connect/thongkebctt.php";
    var response1 = await http.get(Uri.parse(Url));
    return json.decode(response1.body);
  }

  Future TinhTrang(String matt) async {
    var Url = "http://192.168.2.91:8012/php_connect/tinhtrangsuachua.php";
    await http.post(Uri.parse(Url), body: {'MaTT': matt});
    var response = await http.get(Uri.parse(Url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Báo Cáo Và Sửa Chữa"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                // TextFormField(
                //   controller: Tenphonghoc,
                //   style: const TextStyle(
                //       fontSize: 19, fontWeight: FontWeight.w400),
                //   keyboardType: TextInputType.number,
                //   textAlign: TextAlign.start,
                //   decoration: kTextFieldDecoration.copyWith(
                //       suffixIcon: IconButton(
                //         padding: EdgeInsets.only(right: 30),
                //         onPressed: () {
                //           setState(() {
                //             getData();
                //           });
                //         },
                //         icon: Icon(
                //           FontAwesomeIcons.search,
                //           size: 26,
                //         ),
                //       ),
                //       hintText: 'Tìm tên phòng học...',
                //       hintStyle: const TextStyle(
                //           fontSize: 18, fontWeight: FontWeight.w500)),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        'Báo Cáo',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 130,
                      ),
                      Text(
                        ('Tình Trạng'),
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
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
                            List listbctt = snapshot.data;
                            // listtt.add(
                            TinhTrang(listbctt[index]['MaTT'].toString());
                            // print(listtt);
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.grey.shade400),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      width: 270,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FieldLineBC(
                                            field: 'Phòng',
                                            content: listbctt[index]['TenPH'],
                                          ),
                                          FieldLineBC(
                                            field: 'Thiết Bị',
                                            content: listbctt[index]['TenTB'],
                                          ),
                                          FieldLineBC(
                                            field: 'Mã LTB',
                                            content: listbctt[index]['MaLTB'],
                                          ),
                                          FieldLineBC(
                                            field: 'Nội Dung BC',
                                            content: listbctt[index]
                                                ['NoidungBC'],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                        // children: [Text(listtt[index])],
                                        ),
                                  ],
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

class FieldLineBC extends StatelessWidget {
  final String field;
  final String content;

  const FieldLineBC({
    super.key,
    required this.field,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      overflow: TextOverflow.visible,
      TextSpan(
        text: '$field: ',
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: content,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
