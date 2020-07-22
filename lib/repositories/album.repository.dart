import 'dart:convert';

import 'package:NiwalabFlutterTutorial/helpers/http/http.helper.dart';
import 'package:NiwalabFlutterTutorial/models/album.model.dart';
import 'package:NiwalabFlutterTutorial/repositories/base/base.endpoints.dart'
    as Endpoints;

class AlbumRepository {
  Future<List<Album>> fetchAlbums() async {
    final res = await HttpHelper.get(Endpoints.album.albums);
    if (res.statusCode == 200) {
      return Album.fromArrayJson(json.decode(res.body));
    } else {
      throw Exception('Failed to load albums.');
    }
  }
}
