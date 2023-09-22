import 'package:flutter/material.dart';

import '../../../domain/entities/video_post.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical, // Cambia el scroll a vertical
      physics:
          const BouncingScrollPhysics(), // fisica de rebote cuando se llega al final de las paginas
      children: [
        Container(color: Colors.red),
        Container(color: Colors.blue),
        Container(color: Colors.green),
        Container(color: Colors.orange),
        Container(color: Colors.deepPurple)
      ],
    );
  }
}
