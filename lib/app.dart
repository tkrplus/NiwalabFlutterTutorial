import 'package:NiwalabFlutterTutorial/screens/Place/place.dart';
import 'package:NiwalabFlutterTutorial/screens/Place/places.dart';
import 'package:NiwalabFlutterTutorial/screens/album/albums.dart';
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
        AlbumsScreen.routeName: (context) => AlbumsScreen(),
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
    PlacesScreen(),
    AlbumsScreen(),
    Text(
      'User',
      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    ),
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
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.place), title: Text('Place')),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note), title: Text('Album')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('User')),
        ],
        currentIndex: _selectedState,
        selectedItemColor: color,
        unselectedItemColor: Colors.lightGreen,
        onTap: _onItemTapped,
        elevation: 6.0,
        iconSize: 18.0,
        showUnselectedLabels: true,
        // iconSize: ,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.view_carousel),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
