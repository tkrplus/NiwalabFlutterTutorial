import 'package:NiwalabFlutterTutorial/screens/Place/place.dart';
import 'package:NiwalabFlutterTutorial/screens/Place/places.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Tutorial',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          PlaceScreen.routeName: (context) => PlaceScreen(),
          PlacesScreen.routeName: (context) => PlacesScreen(),
        });
  }
}
