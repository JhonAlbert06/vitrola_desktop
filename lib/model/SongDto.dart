class SongDto {
  final dynamic id;
  final String name;
  final String genre;
  final String length;
  final String artist;

  SongDto({
    this.id,
    this.name = "",
    this.genre = "",
    this.length = "",
    this.artist = "",
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'genre': genre,
      'length': length,
      'artist': artist,
    };
  }

  static SongDto fromMap(Map<String, dynamic> map) {
    return SongDto(
      id: map['id'],
      name: map['name'],
      genre: map['genre'],
      length: map['length'],
      artist: map['artist'],
    );
  }
}
