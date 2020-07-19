class Album {
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Album({this.id, this.title, this.url, this.thumbnailUrl});

  static Album fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
