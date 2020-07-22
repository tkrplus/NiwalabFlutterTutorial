import './base.url.dart' as url;

class _Album {
  final albums = url.jsonPlaceholder + '/photos';
}

final album = _Album();
