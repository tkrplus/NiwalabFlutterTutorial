import 'package:NiwalabFlutterTutorial/models/Place.dart';
import 'package:NiwalabFlutterTutorial/screens/Place/place.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  static const routeName = '/places';

  const PlacesScreen({Key key}) : super(key: key);

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
            Navigator.pushNamed(context, PlaceScreen.routeName,
                arguments:
                    PlaceScreenArguments(place.placeId, place.placeName));
          },
        );
      },
    );
    return Scaffold(
      appBar: AppBar(title: Text('Places')),
      body: listView,
    );
  }
}
