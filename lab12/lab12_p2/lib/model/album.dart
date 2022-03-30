class AlbumList {
  List<Album> album;

  AlbumList({
    required this.album,
  });

  AlbumList.fromJson(List<dynamic> albumJson)
      : album =
            List.from(albumJson).map((album) => Album.fromJson(album)).toList();
}

class Album {
  int id;
  String title;

  Album.fromJson(Map<String, dynamic> albumsJson)
      : id = albumsJson['id'],
        title = albumsJson['title'];
}
