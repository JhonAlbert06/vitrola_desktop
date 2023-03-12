import 'package:flutter/material.dart';

import '../model/SongDto.dart';

class ImageCard2 extends StatelessWidget {
  final ImageProvider painter;
  final String contentDescription;
  final String title;
  final SongDto song;

  const ImageCard2({
    super.key,
    required this.painter,
    required this.contentDescription,
    required this.title,
    required this.song,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 200.0,
          width: 200.0,
          alignment: AlignmentDirectional.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(image: painter, fit: BoxFit.cover),
          ),
        ),
        Container(
          color: Colors.black,
          width: 400.0,
          height: 200.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                song.artist,
                style: const TextStyle(
                  color: Colors.cyan,
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(width: 16.0),
              Text(
                song.genre,
                style: const TextStyle(
                  color: Colors.cyan,
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(width: 16.0),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
