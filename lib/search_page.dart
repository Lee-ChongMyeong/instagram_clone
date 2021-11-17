import 'package:flutter/material.dart';

import 'create_page.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreatePage())
          );
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildBody(){
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0, // 가로세로 비율 1.0
          mainAxisSpacing: 1.0, // 사진 간격
          crossAxisSpacing: 1.0,
        ),
        itemCount: 5,
        itemBuilder: (context, index){
          return _buildListItem(context, index);
    });
  }

  Widget _buildListItem(BuildContext context, int index){
    return Image.network('https://cdn.pixabay.com/photo/2014/12/08/02/59/benches-560435_1280.jpg', fit: BoxFit.cover);
  }
}
