import 'package:flutter/material.dart';
import 'package:instagram_clon/home_page.dart';
import 'package:instagram_clon/search_page.dart';
import 'package:instagram_clon/account_page.dart';

import 'account_page.dart';
import 'home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TabPage extends StatefulWidget {

  final FirebaseUser user;

  TabPage(this.user);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;

  List _pages;

  @override
  void initState(){ // build 하기전에 생성자 다음에 호출되는 부분
    super.initState();
    _pages = [
      Homepage(widget.user),
      SearchPage(),
      AccountPage(widget.user),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child : _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,// 탭 고정 색깔
        onTap: _onItemTapped,
        
          currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search')),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('Account')),
      ]),
    );
  }

  void _onItemTapped(int index) {
    setState((){
      _selectedIndex = index;
    });
  }
}
