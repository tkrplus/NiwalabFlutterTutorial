import 'dart:async';
import 'dart:convert';

import 'package:NiwalabFlutterTutorial/models/Album.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AlbumsScreen extends StatefulWidget {
  static const routeName = '/albums';

  const AlbumsScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  Future<List<Album>> futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbums = fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Albums'),
        ),
        body: FutureBuilder<List<Album>>(
            future: futureAlbums,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return AlbumListTile(
                        index: index, albumn: snapshot.data[index]);
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('$snapshot.error'));
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  Future<List<Album>> fetchAlbums() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/photos');
    if (response.statusCode == 200) {
      print(response.body);
      print(json.decode(response.body));
      return (json.decode(response.body) as List)
          .map((album) => Album.fromJson(album))
          .toList();
    } else {
      throw Exception('Failed to load album.');
    }
  }
}

class AlbumListTile extends StatelessWidget {
  final int index;
  final Album albumn;

  const AlbumListTile({Key key, this.index, this.albumn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(albumn.thumbnailUrl),
      title: Text(albumn.title),
      subtitle: Text('Billy Joel'),
    );
  }
}
