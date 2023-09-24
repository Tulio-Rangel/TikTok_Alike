import 'package:flutter/material.dart';
import 'package:tiktok_alike/presentation/widgets/shared/video_player/video_buttons.dart';

import '../../../domain/entities/video_post.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical, // Cambia el scroll a vertical
      physics:
          const BouncingScrollPhysics(), // fisica de rebote cuando se llega al final de las paginas, se debe poner para que funcione en android, en apple lo tiene por defecto
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            // Video Player + gradiente

            // Botones
            Positioned(
                bottom: 40, right: 20, child: VideoButtons(video: videoPost))
          ],
        );
      },
    );
  }
}
