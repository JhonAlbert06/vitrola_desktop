import 'package:flutter/material.dart';
import 'package:vitrolla_desktop/componentes/ImageCard.dart';
import 'package:vitrolla_desktop/model/SongDto.dart';
import 'package:vitrolla_desktop/songs_api.dart';

import 'componentes/EnCurso.dart';
import 'componentes/ImageCard2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vitrola Desktop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Vitrola Desktop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final imageUrl =
      'https://th.bing.com/th/id/R.677055a5d878a0bf721536ca6e453dc1?rik=eIgJMuFQiW8UtA&pid=ImgRaw&r=0';

  final SongsApi _api = SongsApi();
  final song = SongDto(
    name: 'name',
    genre: 'genre',
    length: '4:45',
    artist: 'artist',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 28.0),
                child: Text(
                  "Elija Una Canciones",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 25.0),
                child: SizedBox(
                  height: 850,
                  width: 900,
                  child: FutureBuilder<List<SongDto>>(
                    future: _api.getSongs(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<SongDto> songs = snapshot.data!;
                        return ListView.builder(
                          itemCount: songs.length,
                          itemBuilder: (context, index) {
                            return ImageCard(
                              painter: AssetImage(
                                  'assets/images/${songs[index].name}.jpeg'),
                              contentDescription: "contentDescription",
                              title: songs[index].name,
                              song: songs[index],
                              onClick: () => _api.createSong(
                                songs[index].name,
                                songs[index].genre,
                                songs[index].length,
                                songs[index].artist,
                                songs[index].id ?? '',
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      return const CircularProgressIndicator();
                    },
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                "En Curso",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 250.0,
                width: 250.0,
                child: EnCurso(
                  painter: AssetImage('assets/images/Bohemian Rhapsody.jpeg'),
                  contentDescription: 'Content description',
                  title: 'Bohemian Rhapsody',
                  artist: "Queen",
                  genre: "Rock",
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 28.0, bottom: 2.0),
                child: Text(
                  "Siguientes",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 180.0),
                child: SizedBox(
                  height: 550,
                  width: 800,
                  child: FutureBuilder<List<SongDto>>(
                    future: _api.getSongsList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<SongDto> songs = snapshot.data!;
                        return ListView.builder(
                          itemCount: songs.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: ImageCard2(
                                    painter: AssetImage(
                                        'assets/images/${songs[index].name}.jpeg'),
                                    contentDescription: "contentDescription",
                                    title: songs[index].name,
                                    song: songs[index],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
