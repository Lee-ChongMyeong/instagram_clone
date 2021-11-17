import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();

  File _image;
  final picker = ImagePicker();

  @override
  void dispose() {
    // 메모리가 소멸될때는 이게 불러와짐.
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.send),
        )
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _image == null ? Text('No Image') : Image.file(_image),
          TextField(
            decoration: InputDecoration(hintText: "내용을 입력하세요"),
            controller: textEditingController,
          )
        ],
      ),
    );
  }

  Future _getImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image.path);
    });
  }
}
