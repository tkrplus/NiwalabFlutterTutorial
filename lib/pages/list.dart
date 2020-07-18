import 'package:flutter/material.dart';

class ListRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hoge')),
        body: ListView(
          children: [
            RaisedButton(
              child: Text('tap here'),
              onPressed: () {
                Navigator.pushNamed(context, '/detail');
              },
            )
          ],
        ));
  }
}
