import 'package:flutter/material.dart';
import 'package:instagram_clon/login_page.dart';
import 'package:instagram_clon/tab_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RootPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
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
