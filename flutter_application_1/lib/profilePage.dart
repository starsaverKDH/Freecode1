import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/HomePage.dart';
import 'calendarPage.dart';
import 'graph.dart';
import 'HomePage.dart';
import 'main.dart';

FirebaseAuth auth = FirebaseAuth.instance;
User? user = auth.currentUser;
String? userId = user?.email;

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Color.fromRGBO(55, 115, 108, 1),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                        fontFamily: 'LilitaOne',
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(248, 246, 232, 1)),
                  ),
                ),
              ),
              flex: 1,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 20.0),
                child: Container(
                  // 모서리 둥근 큰 컨테이너
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(55, 115, 108, 1),
                    boxShadow: [
                      BoxShadow(
                        // 그림자
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    border: Border.all(
                        color: Color.fromRGBO(22, 57, 26, 100),
                        width: 2), // 컨테이너 테두리
                    borderRadius: BorderRadius.circular(20), // 컨테이너 박스 둥글게
                  ),
                  child: Column(
                    children: [
                      Flexible(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(5.0, 10.0, 8.0, 5.0),
                            // id 표시
                            child: Row(
                              children: [
                                SizedBox(
                                  child: Icon(
                                    Icons.account_circle,
                                    color: Color.fromRGBO(248, 246, 232, 50),
                                    size: 50,
                                  ),
                                  width: 70,
                                ),
                                SizedBox(
                                  // 파이어베이스에서 email 끌고와서 표시
                                  child: Text('id(email) : $userId',
                                      style: TextStyle(
                                        fontFamily: 'LilitaOne',
                                        color:
                                            Color.fromRGBO(255, 255, 255, 50),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                )
                              ],
                            ),
                          ),
                          flex: 2),
                      Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Color.fromRGBO(55, 115, 108, 1),
                              child: Text(
                                'WishList',
                                style: TextStyle(
                                    fontFamily: 'LilitaOne',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(255, 255, 255, 50)),
                              ),
                            ),
                          ),
                          flex: 1),
                      Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(55, 115, 108, 1),
                                border: Border.all(
                                    color: Color.fromRGBO(22, 57, 26, 100),
                                    width: 2), // 컨테이너 테두리
                                borderRadius:
                                    BorderRadius.circular(20), // 컨테이너 박스 둥글게
                              ),
                            ),
                          ),
                          flex: 4),
                      Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/pig.png'), // 돼지 사진
                          ),
                          flex: 2),
                      // 로그아웃 버튼
                      TextButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp()),
                            );
                          },
                          child: Text(
                            'LogOut',
                            style: TextStyle(
                                fontFamily: 'LilitaOne',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(255, 255, 255, 50)),
                          ))
                    ],
                  ),
                ),
              ),
              flex: 9,
            )
          ],
        ),
        backgroundColor: Color.fromRGBO(55, 115, 108, 1),
        bottomNavigationBar: Container(
          child: BottomNavigationBar(
            backgroundColor: Color.fromRGBO(55, 115, 108, 1),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color.fromRGBO(248, 246, 232, 1),
            unselectedItemColor: Color.fromRGBO(248, 246, 232, 1),
            selectedLabelStyle:
                TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            showSelectedLabels: true,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: '캘린더',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_sharp),
                label: '통계자료',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: '마이페이지',
              ),
            ],
            onTap: (int index) {
              switch (index) {
                case 0:
                  // 홈 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  break;
                case 1:
                  // 캘린더 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => calendarPage()),
                  );
                  break;
                case 2:
                  // 통계자료 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => graph()),
                  );
                  break;
              }
            },
          ),
        ));
  }
}

void main() {
  runApp(MaterialApp(
    home: profilePage(),
  ));
}
