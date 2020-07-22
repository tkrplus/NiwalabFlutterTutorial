import 'dart:async';

import 'package:NiwalabFlutterTutorial/models/album.model.dart';
import 'package:NiwalabFlutterTutorial/services/album.service.dart';
import 'package:flutter/material.dart';

class AlbumsPage extends StatefulWidget {
  static const routeName = '/albums';

  const AlbumsPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  Future<List<Album>> futureAlbums;
  final AlbumService _albumService = AlbumService();

  @override
  void initState() {
    super.initState();
    futureAlbums = _albumService.fetchAlbums();
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
                print(snapshot.error);
                return Center(child: Text('$snapshot.error'));
              }
              return Center(child: CircularProgressIndicator());
            }));
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
