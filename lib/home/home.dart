import 'package:app_quanlythietbi/home/listRoom_Screen.dart';
import 'package:app_quanlythietbi/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class home_Screen extends StatefulWidget {
  const home_Screen({Key? key}) : super(key: key);
  static const String id = 'home';
  @override
  State<home_Screen> createState() => _home_ScreenState();
}

class _home_ScreenState extends State<home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(57),
          child: AppBar(
            backgroundColor: Colors.lightBlue.shade700,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              'Trang Chủ',
              style: TextStyle(fontSize: 23),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    levelUser = 0;
                  });
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
                              child: Text('Hủy'),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login_Screen(),
                                  ),
                                );
                                EasyLoading.showSuccess(
                                  'Đăng xuất thành công !',
                                  duration: Duration(milliseconds: 1300),
                                  maskType: EasyLoadingMaskType.black,
                                );
                              },
                              child: Text('Đồng ý'),
                            ),
                          ],
                        );
                      });
                },
                child: Container(
                  padding: EdgeInsets.only(top: 5),
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
              )
            ],
          ),
        ),
        body: levelUser == 1
            ? GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.48,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.2,
                ),
                children: [
                  Feature_Button(
                    text: 'Quản lý Thiết Bị',
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => listRoom_Screen(),
                          ));
                    },
                    image: 'lib/asset/images/img_1.png',
                  ),
                  Feature_Button(
                    text: 'Báo Cáo Sửa chữa',
                    press: () {},
                    image: 'lib/asset/images/reportsuachua.png',
                  ),
                  Feature_Button(
                    text: 'Mượn phòng',
                    press: () {},
                    image: 'lib/asset/images/img.png',
                  ),
                  Feature_Button(
                    text: 'Báo Cáo Thiết Bị',
                    press: () {},
                    image: 'lib/asset/images/reportthietbi.jpg',
                  ),
                  Feature_Button(
                    text: 'Yêu Cầu Đăng Ký',
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
                  Feature_Button(
                    text: 'Phòng học',
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => listRoom_Screen(),
                          ));
                    },
                    image: 'lib/asset/images/img_1.png',
                  ),
                ],
              ));
  }
}

class Feature_Button extends StatelessWidget {
  final VoidCallback press;
  String text;
  String image;
  Feature_Button({
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
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
