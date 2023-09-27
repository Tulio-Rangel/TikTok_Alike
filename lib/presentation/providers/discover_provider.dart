import 'package:flutter/material.dart';
import 'package:tiktok_alike/domain/repositories/video_posts_repository.dart';

import '../../domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videosRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRepository});

  // Funcion para pasar al siguiente video
  Future<void> loadNextPage() async {
    //await Future.delayed(const Duration(seconds: 2));

    // Metodo que va a cargar los videos
    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //     .toList();

    // Ahora los videos se cargan desde el repository
    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    // Se agregan los videos a la lista
    videos.addAll(newVideos);
    // Como ya se hizo la carga inicial se pasa el initialLoading a false
    initialLoading = false;
    notifyListeners();
  }
}
