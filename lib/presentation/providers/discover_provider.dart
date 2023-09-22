import 'package:flutter/material.dart';
import 'package:tiktok_alike/infrastructure/models/local_video_model.dart';
import 'package:tiktok_alike/shared/data/local_video_post.dart';

import '../../domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO: Respository, DataSource

  bool initialLoading = true;
  List<VideoPost> videos = [];

  // Funcion para pasar al siguiente video
  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    // Metodo que va a cargar los videos
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    // Se agregan los videos a la lista
    videos.addAll(newVideos);
    // Como ya se hizo la carga inicial se pasa el initialLoading a false
    initialLoading = false;
    notifyListeners();
  }
}
