import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountPage extends StatefulWidget {

  final FirebaseUser user;

  AccountPage(this.user);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  int _postCount = 0;

  @override
  void initState() { // 초기화 되는 부분
    super.initState();
    Firestore.instance.collection('post').where('email', isEqualTo: widget.user.email) // 내가 올린 게시글만 가져온다.
      .getDocuments()
      .then((snapShot){
        setState((){
          _postCount = snapShot.documents.length;
        });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Row 정렬 변경 수정
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.user.photoUrl)
                    )
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        SizedBox(
                            width: 28.0,
                            height: 28.0,
                            child: FloatingActionButton(onPressed: null,
                              backgroundColor: Colors.white,
                            )
                        ),
                        SizedBox(
                            width: 25.0,
                            height: 25.0,
                            child: FloatingActionButton(onPressed: null,
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.add),
                            )
                        ),
                      ]
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Text(widget.user.displayName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              )
            ],
          ),
          Text(
            '$_postCount\n게시글',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            '0\n팔로워',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            '0\n팔로잉',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(){
    return AppBar(
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){
              try{
                FirebaseAuth.instance.signOut();
                _googleSignIn.signOut();
                print('success');
              }catch(e){
                print(e.toString());
              }
            },
        )
      ],
    );
  }
}
