import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('instagram Clone',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )
        )
    );
  }
}