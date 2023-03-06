import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/SongDto.dart';

class SongsApi {
  static const baseURL = 'http://192.168.1.20:8000';

  Future<List<SongDto>> getSongs() async {
    final response = await http.get(Uri.parse('$baseURL/Songs'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return List<SongDto>.from(jsonData.map((x) => SongDto.fromMap(x)));
    } else {
      throw Exception('Failed to load songs');
    }
  }

  Future<void> createSong(
      String name, String genre, String length, String artist) async {
    final response = await http.post(
      Uri.parse('$baseURL/Songs/List'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'genre': genre,
        'length': length,
        'artist': artist,
      }),
    );

    if (response.statusCode == 201) {
      print('Song created successfully');
    } else {
      throw Exception('Failed to create song');
    }
  }
}
