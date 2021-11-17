import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('instagram Clone',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )
        ),
        body: _buildBody()
    );
  }

  Widget _buildBody(){
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea( // iphone 에서 위에 탈모 가림 현상 방지
        child: SingleChildScrollView( // 스크롤 추가
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Instagram에 오신것을 환영합니다.',
                  style: TextStyle(fontSize: 24.0),
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                Text('사진과 동영상을 보려면 팔로우하세요'),
                Padding(padding: EdgeInsets.all(16.0)),
                SizedBox( // 감싸고 있는 위젯의 크기를 지정해줌.
                  width: 280.0,
                  child: Card(
                    elevation: 4.0, // 그림자 깊이
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: 80.0,
                          height: 80.0,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2021/10/12/17/52/couple-6704262_1280.jpg'),
                          )
                        ),
                        Padding(padding: EdgeInsets.all(8.0)),
                        Text('dlchdaud1327@gmail.com', style: TextStyle(fontWeight: FontWeight.bold), ),
                        Text('이총명'),
                        Padding(padding: EdgeInsets.all(8.0)), // row center 로 정렬
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                                width: 70.0,
                                height: 70.0,
                                child: Image.network('https://cdn.pixabay.com/photo/2014/02/07/11/36/couple-260899_1280.jpg', fit: BoxFit.cover),
                            ),
                            Padding(padding: EdgeInsets.all(8.0)),
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network('https://cdn.pixabay.com/photo/2016/10/06/05/19/couple-1718244_1280.jpg', fit: BoxFit.cover),
                            ),
                            Padding(padding: EdgeInsets.all(8.0)),
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network('https://cdn.pixabay.com/photo/2017/07/31/21/04/people-2561053_1280.jpg', fit: BoxFit.cover),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(4.0)),
                        Text('Facebook 친구'),
                        Padding(padding: EdgeInsets.all(4.0)),
                        RaisedButton(
                          child: Text('팔로우'),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: (){},
                        ),
                        Padding(padding: EdgeInsets.all(4.0)),
                      ]
                    ),
                  ),
                )
              ],
            )
          )
        )
      )
    );
  }
}