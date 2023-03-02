import 'package:flutter/material.dart';
import 'package:vitrolla_desktop/componentes/ImageCard.dart';
import 'package:vitrolla_desktop/model/SongDto.dart';
import 'package:vitrolla_desktop/songs_api.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(150.0),
        child: FutureBuilder<List<SongDto>>(
          future: _api.getSongs(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<SongDto> songs = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return ImageCard(
                      painter:
                          AssetImage('assets/images/${songs[index].name}.jpeg'),
                      contentDescription: "contentDescription",
                      title: songs[index].name,
                      song: songs[index],
                      onClick: () => _api.createSong(
                          songs[index].name,
                          songs[index].genre,
                          songs[index].length,
                          songs[index].artist));
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
