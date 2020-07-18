import 'package:NiwalabFlutterTutorial/models/Place.dart';
import 'package:flutter/material.dart';
import 'package:NiwalabFlutterTutorial/screens/detail.dart';

class ListScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final places =
        List<Place>.generate(50, (index) => Place('uuid', 'Place name $index'));
    final listView = ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        final place = places[index];
        return ListTile(
          leading: Icon(Icons.place),
          title: Text(place.placeName),
          trailing: FavoriteWidget(),
          onTap: () {
            Navigator.pushNamed(context, DetailScreen.routeName,
                arguments:
                    DetailScreenArguments(place.placeId, place.placeName));
          },
        );
      },
    );
    return Scaffold(
      appBar: AppBar(title: Text('Hoge')),
      body: listView,
    );
  }
}
