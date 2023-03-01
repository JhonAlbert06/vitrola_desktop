import 'package:flutter/material.dart';

import 'componentes/ImageCard.dart';
import 'model/SongDto.dart';

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

  final List<SongDto> songs = [
    SongDto(artist: 'Artista 1', genre: 'Género 1'),
    SongDto(artist: 'Artista 2', genre: 'Género 2'),
    SongDto(artist: 'Artista 3', genre: 'Género 3'),
    SongDto(artist: 'Artista 4', genre: 'Género 4'),
    SongDto(artist: 'Artista 5', genre: 'Género 5'),
  ];

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(150.0),
        child: Container(
          height: 600,
          child: ListView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: songs.length,
            itemBuilder: (context, index) {
              return ImageCard(
                painter: NetworkImage(
                    imageUrl), //AssetImage('assets/images/${index + 1}.jpg'),
                contentDescription: 'Imagen ${index + 1}',
                title: 'Título ${index + 1}',
                song: songs[index],
                onClick: () {
                  // Aquí puedes definir lo que quieres hacer al pulsar cada elemento
                  print('Has pulsado el elemento ${index + 1}');
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
