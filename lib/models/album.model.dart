class Album {
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Album({this.id, this.title, this.url, this.thumbnailUrl});

  static List<Album> fromArrayJson(List<dynamic> json) =>
      json.map((e) => fromJson(e)).toList();

  static Album fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
