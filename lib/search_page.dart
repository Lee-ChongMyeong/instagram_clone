import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'create_page.dart';
import 'detail_post_page.dart';

class SearchPage extends StatefulWidget {
  final FirebaseUser user;

  SearchPage(this.user);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreatePage(widget.user))
          );
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildBody(){
    return StreamBuilder(
      stream: Firestore.instance.collection('post').snapshots(), // firestore instance 가져온 다음에, post 컬렉션에 데이터 넣음.
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        }

        var items = snapshot.data?.documents ?? [];

        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0, // 가로세로 비율 1.0
              mainAxisSpacing: 1.0, // 사진 간격
              crossAxisSpacing: 1.0,
            ),
            itemCount: items.length,
            itemBuilder: (context, index){
              return _buildListItem(context, items[index]);
            });
      }
    );
  }

  Widget _buildListItem(BuildContext context, document){
    return Hero(
      tag: document['photoUrl'],
      child: Material(
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailPostPage(document);
            }));
          },
          child: Image.network(
              document['photoUrl'],
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
