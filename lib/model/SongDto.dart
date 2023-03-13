class SongDto {
  final dynamic id;
  final String name;
  final String genre;
  final String length;
  final String artist;

  SongDto({
    this.name = "",
    this.genre = "",
    this.length = "",
    this.artist = "",
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'genre': genre,
      'length': length,
      'artist': artist,
    };
  }

  static SongDto fromMap(Map<String, dynamic> map) {
    return SongDto(
      id: map['_id'],
      name: map['name'],
      genre: map['genre'],
      length: map['length'],
      artist: map['artist'],
    );
  }
}
