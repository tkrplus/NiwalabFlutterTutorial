import 'package:NiwalabFlutterTutorial/screens/Place/place.dart';
import 'package:NiwalabFlutterTutorial/screens/Place/places.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BottomNavigation(),
      initialRoute: PlacesScreen.routeName,
      routes: {
        PlacesScreen.routeName: (context) => PlacesScreen(),
        PlaceScreen.routeName: (context) => PlaceScreen(),
      },
    );
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedState = 0;

  static const List<Widget> _widgetOptions = [
    Text(
      'Home',
      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    ),
    PlacesScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedState = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Scaffold(
        body: Center(child: _widgetOptions[_selectedState]),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.place), title: Text('Place')),
          ],
          currentIndex: _selectedState,
          selectedItemColor: color,
          onTap: _onItemTapped,
        ));
  }
}
