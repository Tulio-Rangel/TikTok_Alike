import 'package:flutter/material.dart';
import 'package:tiktok_alike/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  // Se debe inicializar el widget
  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(
        widget.videoUrl) // El widge.videoUrl es el url que defini arriba
      ..setVolume(0) // Volumen en 0
      ..setLooping(true) // Loop activo
      ..play();
  }

  @override
  void dispose() {
    controller
        .dispose(); // Para evitar la fuga de memoria, esto evita que el video se siga reproduciendo cuando ya pasamos a otro video
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }

        return GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
              return;
            }
            controller.play();
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(children: [
              VideoPlayer(controller),

              // Gradiente
              VideoBackGround(
                stops: const [0.8, 1.0],
              ),

              // Texto del video
              Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption))
            ]),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;

  const _VideoCaption({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}
