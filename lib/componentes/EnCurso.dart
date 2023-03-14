import 'package:flutter/material.dart';

class EnCurso extends StatelessWidget {
  final ImageProvider painter;
  final String contentDescription;
  final String title;
  final String artist;
  final String genre;

  const EnCurso(
      {super.key,
      required this.painter,
      required this.contentDescription,
      required this.title,
      required this.artist,
      required this.genre});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: InkWell(
          child: SizedBox(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image(
                  image: painter,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              artist,
                              style: const TextStyle(
                                  color: Colors.cyan, fontSize: 16),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              genre,
                              style: const TextStyle(
                                  color: Colors.cyan, fontSize: 16),
                            ),
                          ],
                        ),
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
