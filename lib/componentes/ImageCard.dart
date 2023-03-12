import 'package:flutter/material.dart';

import '../model/SongDto.dart';

class ImageCard extends StatelessWidget {
  final ImageProvider painter;
  final String contentDescription;
  final String title;
  final SongDto song;
  final VoidCallback onClick;

  const ImageCard({
    super.key,
    required this.painter,
    required this.contentDescription,
    required this.title,
    required this.song,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5.0,
      child: InkWell(
        onTap: onClick,
        child: Container(
          height: 600.0,
          width: 400.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: painter,
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                  ],
                ),
                const SizedBox(height: 8.0),
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
        ),
      ),
    );
  }
}
