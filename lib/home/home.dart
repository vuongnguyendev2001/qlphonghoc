import 'package:app_quanlythietbi/baocao_suachua/baocao_suachua.dart';
import 'package:app_quanlythietbi/home/listRoom_Screen.dart';
import 'package:app_quanlythietbi/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(57),
          child: AppBar(
            backgroundColor: Colors.lightBlue.shade700,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: const Text(
              'Trang Chủ',
              style: TextStyle(fontSize: 23),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          // backgroundColor: Colors.grey.shade100,
                          // title: Text('Thông báo'),
                          content: const Text(
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
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                                EasyLoading.showSuccess(
                                  'Đăng xuất thành công !',
                                  duration: const Duration(milliseconds: 1300),
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
                    children: const [
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
              )
            ],
          ),
        ),
        body: Role == 'admin'
            ? GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.48,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.2,
                ),
                children: [
                  FeatureButton(
                    text: 'Quản Lý Thiết Bị',
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListRoomScreen(),
                          ));
                    },
                    image: 'lib/asset/images/img_1.png',
                  ),
                  FeatureButton(
                    text: 'Báo Cáo, Sữa Chữa',
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BaoCaoSuaChua(),
                          ));
                    },
                    image: 'lib/asset/images/reportsuachua.png',
                  ),
                  FeatureButton(
                    text: 'Người Dùng',
                    press: () {},
                    image: 'lib/asset/images/icon_PH.png',
                  ),
                ],
              )
            : GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.48,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.2,
                ),
                children: [
                  FeatureButton(
                    text: 'Phòng học',
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListRoomScreen(),
                          ));
                    },
                    image: 'lib/asset/images/img_1.png',
                  ),
                ],
              ));
  }
}

class FeatureButton extends StatelessWidget {
  final VoidCallback press;
  String text;
  String image;
  FeatureButton({
    required this.image,
    required this.text,
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.width * 0.25,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
