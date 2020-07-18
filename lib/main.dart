import 'package:flutter/material.dart';
import 'screens/list.dart';
import 'screens/detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter layout demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          ListScreen.routeName: (context) => ListScreen(),
          DetailScreen.routeName: (context) => DetailScreen(),
        });
  }
}
