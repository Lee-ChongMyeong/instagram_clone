import 'package:flutter/material.dart';
import 'package:instagram_clon/login_page.dart';
import 'package:instagram_clon/tab_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RootPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>( // 스트림 데이터 사용 가능
      stream: FirebaseAuth.instance.onAuthStateChanged, // 인증이 되거나 끊어졌을때 상태가 변경됬을때, 변경된 상태에 따라서 흘러오게 됨.
      builder: (BuildContext context, AsyncSnapshot snapshot) { // snapshot : firebase 유저 정보가 들어옴
        if (snapshot.hasData){
          return TabPage(snapshot.data);
        } else{
          return LoginPage();
        }
      },
    );
  }
}
