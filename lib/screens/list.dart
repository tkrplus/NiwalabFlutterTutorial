import 'package:flutter/material.dart';
import 'package:NiwalabFlutterTutorial/screens/detail.dart';

class ListScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hoge')),
        body: ListView(
          children: [
            RaisedButton(
              child: Text('tap here'),
              onPressed: () {
                Navigator.pushNamed(context, DetailScreen.routeName,
                    arguments: DetailScreenArguments(
                        'uuid', 'Oeschinen Lake Campground'));
              },
            )
          ],
        ));
  }
}
