import 'package:NiwalabFlutterTutorial/models/album.model.dart';
import 'package:NiwalabFlutterTutorial/repositories/album.repository.dart';

class AlbumService {
  final AlbumRepository _repository = AlbumRepository();

  Future<List<Album>> fetchAlbums() async {
    return await this._repository.fetchAlbums();
  }
}
