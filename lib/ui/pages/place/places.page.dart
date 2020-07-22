import 'package:NiwalabFlutterTutorial/models/place.model.dart';
import 'package:NiwalabFlutterTutorial/ui/pages/place/place.page.dart';
import 'package:flutter/material.dart';

class PlacesPage extends StatelessWidget {
  static const routeName = '/places';

  const PlacesPage({Key key}) : super(key: key);

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
            Navigator.pushNamed(context, PlacePage.routeName,
                arguments: PlacePageArguments(place.placeId, place.placeName));
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
